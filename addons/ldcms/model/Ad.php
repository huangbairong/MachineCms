<?php

namespace addons\ldcms\model;

use addons\ldcms\model\common\Frontend;
use think\View;

class Ad extends Frontend
{
    // 表名
    protected $name = 'ldcms_ad';

    public function getImageAttr($value, $data)
    {
        if (empty($value)) {
            return cdnurl(config('ldcms.slider_noimage'), true);
        }
        return cdnurl($value, true);
    }
    public function getVideoAttr($value, $data)
    {
        if (empty($value)) {
            return '';
        }
        return cdnurl($value, true);
    }

    public function getContentAttr($value, $data)
    {
        $view = View::instance();
        $view->engine->layout(false);
        $view->assign('item', $data);
        return $view->display($data['content']);
    }

    /**
     * 获取指定类型的幻灯片
     * @param string $name     指定分类
     * @param int|null $limit  限制数量
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getHomeSlide($name, $limit = null)
    {
        $query = $this
            ->where('type', $name)
            ->where('status', 1)
            ->where('lang', $this->getLang());

        if (!is_null($limit) && $limit !== '') {
            $query = $query->limit((int)$limit);
        }

        $result = $query->order($this->getSort())->select();
        if (collection($result)->isEmpty()) {
            return [];
        }

        return collection($result);
    }
}
