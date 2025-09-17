<?php

namespace addons\ldcms\utils\fanyi\youdao;

use addons\ldcms\utils\fanyi\youdao\library\Translate;
use addons\ldcms\utils\fanyi\youdao\library\TranslateBatch;
use addons\ldcms\utils\fanyi\youdao\library\TranslateHtml;

class Youdao
{
    // 文本翻译
    public const API_URL = 'https://openapi.youdao.com/api';
    // 富文本翻译
    public const API_HTML_URL = 'https://openapi.youdao.com/translate_html';
    public const API_URL_BATCH = 'https://openapi.youdao.com/v2/api';
    public const CURL_TIMEOUT = 2000;

    /**
     * @var string 应用ID
     */
    private $appKey = '';

    /**
     * @var string 应用密钥
     */
    private $appSecret = '';

    /**
     * @param string $appKey
     * @param string $appSecret
     * @param bool $html
     * @throws \Exception
     */
    public function __construct(string $appKey = '', string $appSecret = '', bool $html = false)
    {
        if (!function_exists('curl_version')) {
            throw new \Exception('curl 扩展未安装，请先安装 curl 扩展');
        }

        if (empty($appKey)) {
            throw new \Exception('有道翻译 app key 不能为空!');
        }
        if (empty($appSecret)) {
            throw new \Exception('有道翻译 app secret 不能为空!');
        }

        $this->appKey    = $appKey;
        $this->appSecret = $appSecret;
    }

    public function getLangCode($code)
    {
        $addon_config = get_addon_config('ldcms');
        $youdao_lang_code = $addon_config['youdao_lang_code'];
        //根据value 找出code
        return array_search($code, $youdao_lang_code);
    }

    private function getErrorMessageByCode(int $code): string
    {
        $errorCodes = [
            101 => '缺少必填的参数,首先确保必填参数齐全，然后确认参数书写是否正确。',
            102 => '不支持的语言类型',
            103 => '翻译文本过长',
            104 => '不支持的API类型',
            105 => '不支持的签名类型',
            106 => '不支持的响应类型',
            107 => '不支持的传输加密类型',
            108 => '应用ID无效，注册账号，登录后台创建应用并完成绑定，可获得应用ID和应用密钥等信息',
            203 => '访问IP地址不在可访问IP列表',
            205 => '请求的接口与应用的平台类型不一致，确保接入方式（Android SDK、IOS SDK、API）与创建的应用平台类型一致。如有疑问请参考入门指南',
            206 => '因为时间戳无效导致签名校验失败',
            207 => '重放请求(接口salt+curtime来防重放（即一个请求不可以被请求2次），所以salt最好为UUID。)',
            301 => '辞典查询失败',
            302 => '翻译查询失败',
            303 => '服务端的其它异常',
            304 => '会话闲置太久超时',
            401 => '账户已经欠费，请进行账户充值',
            402 => 'offlinesdk不可用',
            405 => '鉴权失败',
            500 => '翻译失败，请参考errorMessage',
            411 => '访问频率受限,请稍后访问',
            412 => '长请求过于频繁，请稍后访问',
        ];
        return $errorCodes[$code] ?? "有道接口返回错误，错误码: {$code}";
    }

    /**
     * @param $text
     * @param $from
     * @param $to
     * @return string
     * @throws \Exception
     */
    public function translate($text, $from, $to)
    {
        $params = [
            'q' => $text,
            'from' => $from,
            'to' => $to,
            //您的用户词表ID
            'vocabId' => ''
        ];
        $params = Translate::add_auth_params($params, $this->appKey, $this->appSecret);
        $ret = Translate::do_call(self::API_URL, 'post', [], $params);
        if (!$ret) {
            $msg = '请求失败，请检查网络连接、API 地址是否正确，或接口是否可用。';
            throw new \Exception($msg);
        }
        $response = json_decode($ret, true);

        if ($response['errorCode']) {
            $code = $response['errorCode'];
            $errorMessage = $this->getErrorMessageByCode($code);
            $errorMessage .= "，详情请参考: https://ai.youdao.com/DOCSIRMA/html/trans/api/wbfy/index.html#section-14";
            throw new \Exception($errorMessage);
        }
        return $response['translation'][0];
    }

    public function translateHtml($text, $from, $to)
    {
        $salt = TranslateHtml::create_guid();
        $args = array(
            'q' => $text,
            'appKey' => $this->appKey,
            'salt' => $salt,
        );
        $args['from'] = $from;
        $args['to'] = $to;
        $args['signType'] = 'v3';
        $curtime = strtotime("now");
        $args['curtime'] = $curtime;
        $signStr = $this->appKey . TranslateHtml::truncate($text) . $salt . $curtime . $this->appSecret;
        $args['sign'] = hash("sha256", $signStr);
        $ret = TranslateHtml::call(self::API_HTML_URL, $args);
        if (!$ret) {
            $msg = '请求失败，请检查网络连接、API 地址是否正确，或接口是否可用。';
            throw new \Exception($msg);
        }
        $response = json_decode($ret, true);

        if ($response['errorCode']) {
            $code = $response['errorCode'];
            $errorMessage = $this->getErrorMessageByCode($code);
            $errorMessage .= "，详情请参考: https://ai.youdao.com/DOCSIRMA/html/trans/api/wbfy/index.html#section-14";
            throw new \Exception($errorMessage);
        }
        return $response['data']['translation'];
    }

    /**
     * @param $data
     * @param $from
     * @param $to
     * @return array
     * @throws \Exception
     */
    public function translateBatch($data, $from, $to)
    {
        if (!$data || !is_array($data)) {
            return [];
        }

        $salt = TranslateBatch::create_guid();
        $args = [
            'q' => $data,
            'appKey' => $this->appKey,
            'salt' => $salt,
        ];
        $args['from'] = $from;
        $args['to'] = $to;
        $args['signType'] = 'v3';
        $curtime = strtotime("now");
        $args['curtime'] = $curtime;
        $signStr =  $this->appKey . TranslateBatch::truncate(implode("", $data)) . $salt . $curtime . $this->appSecret;
        $args['sign'] = hash("sha256", $signStr);
        $args['vocabId'] = '';
        $ret = TranslateBatch::call(self::API_URL_BATCH, $args);
        $response = json_decode($ret, true);

        if ($response['errorCode']) {
            $code = $response['errorCode'];
            $errorMessage = $this->getErrorMessageByCode($code);
            $errorMessage .= "，详情请参考: https://ai.youdao.com/DOCSIRMA/html/trans/api/wbfy/index.html#section-14";
            throw new \Exception($errorMessage);
        }
        $results = $response['translateResults'];
        $returndata = [];
        $i = 0;
        foreach ($data as $key => $value) {
            $returndata[$key] = $results[$i]['translation'];
            $i++;
        }
        return $returndata;
    }
}
