
CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) CHARACTER SET utf8 DEFAULT '' COMMENT '类型',
  `title` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '标题',
  `content` varchar(1500) DEFAULT '' COMMENT '内容',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '描述',
  `image` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '图片',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '跳转链接',
  `sort` int(11) NOT NULL DEFAULT '9' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 ',
  `target` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '跳转',
  `create_time` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `lang` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '语言',
  `is_video` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否使用视频',
  `video` varchar(255) DEFAULT NULL COMMENT '视频',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COMMENT='广告表';


CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '名称',
  `ename` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '英文名称',
  `pid` int(11) NOT NULL COMMENT '父ID',
  `mid` int(11) NOT NULL COMMENT '模型',
  `urlname` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'url名称',
  `template_list` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '列表页模版',
  `template_detail` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '详情页模版',
  `outlink` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '跳转链接',
  `image` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '栏目缩略图',
  `big_image` varchar(255) DEFAULT '' COMMENT '栏目大图',
  `seo_title` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT 'SEO关键词',
  `seo_description` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT 'SEO描述',
  `sort` int(10) DEFAULT '99' COMMENT '排序',
  `lang` varchar(255) NOT NULL DEFAULT 'zh-cn' COMMENT '语言',
  `is_target` tinyint(1) DEFAULT '0' COMMENT '是否target',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型 0 模型 1链接',
  `gid` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '浏览权限  0 公开  1 1级会员 2 2级会员 ...',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `is_nav` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否导航显示',
  `is_home` tinyint(1) NOT NULL DEFAULT '0' COMMENT '首页显示模块',
  `subname` varchar(255) DEFAULT NULL COMMENT '子名称',
  `model_table_name` varchar(255) DEFAULT '' COMMENT '模型名的表名称',
  `des1` varchar(255) DEFAULT '' COMMENT '描述1',
  `des2` varchar(255) DEFAULT '' COMMENT '描述2',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `urlname` (`urlname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='栏目表';



CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_content_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '名称',
  `url` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '链接',
  `lang` varchar(100) NOT NULL DEFAULT '',
  `create_time` bigint(16) DEFAULT NULL,
  `update_time` bigint(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='文章内容内链';


CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_diyform` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT '' COMMENT '表单名称',
  `title` varchar(100) DEFAULT '' COMMENT '标题',
  `table` varchar(50) DEFAULT '' COMMENT '表名',
  `needlogin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要登录发布',
  `iscaptcha` tinyint(1) unsigned DEFAULT '0' COMMENT '是否启用验证码',
  `create_time` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `setting` varchar(1500) DEFAULT '' COMMENT '表单配置',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='自定义表单表';

--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_message` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `diyform_id` int(10) NOT NULL,
    `lang` varchar(255) DEFAULT NULL,
    `user_ip` varchar(255) DEFAULT NULL,
    `user_os` varchar(255) DEFAULT NULL,
    `user_bs` varchar(255) DEFAULT NULL,
    `create_time` bigint(20) DEFAULT NULL,
    `update_time` bigint(20) DEFAULT NULL,
    `uname` varchar(100) DEFAULT '' COMMENT '姓名',
    `mobile` varchar(100) DEFAULT '' COMMENT '手机号',
    `remark` varchar(100) DEFAULT '' COMMENT '内容',
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='在线留言';


CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_diyform_fields` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `diyform_id` int(10) NOT NULL DEFAULT '0' COMMENT '表单ID',
  `field` char(30) DEFAULT '' COMMENT '名称',
  `type` varchar(30) DEFAULT '' COMMENT '类型',
  `title` varchar(30) DEFAULT '' COMMENT '标题',
  `filterlist` text COMMENT '筛选列表',
  `default` varchar(100) DEFAULT '' COMMENT '默认值',
  `rule` varchar(100) DEFAULT '' COMMENT '验证规则',
  `tip` varchar(100) DEFAULT '' COMMENT '提示消息',
  `decimals` tinyint(1) DEFAULT NULL COMMENT '小数点',
  `length` mediumint(8) DEFAULT NULL COMMENT '长度',
  `minimum` smallint(6) DEFAULT NULL COMMENT '最小数量',
  `maximum` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '最大数量',
  `extend_html` varchar(255) DEFAULT '' COMMENT '扩展信息',
  `setting` varchar(1500) DEFAULT '' COMMENT '配置信息',
  `sort` int(10) NOT NULL DEFAULT '9' COMMENT '排序',
  `create_time` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `update_time` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `issort` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可排序',
  `isfilter` tinyint(1) NOT NULL DEFAULT '0' COMMENT '筛选',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `id` (`diyform_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='自定义字段表';


CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL COMMENT '模型',
  `cid` int(11) DEFAULT NULL COMMENT '栏目',
  `sub_cid` varchar(255) DEFAULT '' COMMENT '副栏目',
  `title` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '标题',
  `image` text CHARACTER SET utf8 COMMENT '缩略图',
  `pics` text CHARACTER SET utf8 COMMENT '多图',
  `show_time` bigint(16) DEFAULT NULL COMMENT '显示时间',
  `seo_keywords` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT 'seo关键词',
  `seo_description` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT 'seo描述',
  `visits` int(255) DEFAULT '0' COMMENT '浏览次数',
  `likes` int(255) DEFAULT '0' COMMENT '点赞次数',
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员ID',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `sort` int(11) NOT NULL DEFAULT '99' COMMENT '排序',
  `lang` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'zh-cn' COMMENT '语言',
  `flag` varchar(255) DEFAULT '' COMMENT '标识',
  `tag` varchar(255) DEFAULT '' COMMENT '标签',
  `outlink` varchar(255) DEFAULT NULL COMMENT '跳转链接',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `gid` varchar(255) DEFAULT '' COMMENT '浏览权限',
  `custom_tpl` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '详情页模版',
  `custom_urlname` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '自定义url',
  `create_time` bigint(16) DEFAULT NULL,
  `update_time` bigint(16) DEFAULT NULL,
  `delete_time` bigint(16) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`mid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COMMENT='文章基础表';

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_document_content` (
  `document_id` int(11) NOT NULL,
  `content` longtext CHARACTER SET utf8 COMMENT '正文内容',
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章内容表';

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_document_page` (
  `document_id` int(10) NOT NULL,
  `test` varchar(255) DEFAULT '' COMMENT 'test',
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='单页';

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_document_team` (
    `document_id` int(10) NOT NULL,
    `zhiwei` varchar(255) DEFAULT '' COMMENT '职位',
    PRIMARY KEY (`document_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='团队';

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_document_news` (
    `document_id` int(10) NOT NULL,
    `test` varchar(255) DEFAULT '' COMMENT '测试',
    PRIMARY KEY (`document_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='新闻';

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_document_case` (
    `document_id` int(10) NOT NULL,
    `xmbj` text COMMENT '项目背景',
    `test1` varchar(255) DEFAULT '' COMMENT '测试关联表',
    PRIMARY KEY (`document_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='案例';

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_document_product` (
    `document_id` int(10) NOT NULL,
    `price` decimal(10,2) DEFAULT '0.00' COMMENT '价格',
    `zhekou` varchar(255) DEFAULT '' COMMENT '折扣',
    `types` varchar(255) DEFAULT '' COMMENT '类型',
    `test` varchar(255) DEFAULT '' COMMENT '测试',
    `color` varchar(50) DEFAULT '' COMMENT '颜色',
    `subtitle` varchar(255) DEFAULT '' COMMENT '副标题',
    `cpcs` text COMMENT '产品参数',
    `gzfw` text COMMENT '工作范围',
    `procz` varchar(255) DEFAULT '' COMMENT '材质',
    `procc` varchar(255) DEFAULT '' COMMENT '尺寸',
    PRIMARY KEY (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='产品';


CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_fields` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) NOT NULL DEFAULT '0' COMMENT '模型',
  `field` char(30) DEFAULT '' COMMENT '名称',
  `type` varchar(30) DEFAULT '' COMMENT '类型',
  `title` varchar(30) DEFAULT '' COMMENT '标题',
  `filterlist` text COMMENT '筛选列表',
  `default` varchar(100) DEFAULT '' COMMENT '默认值',
  `rule` varchar(100) DEFAULT '' COMMENT '验证规则',
  `tip` varchar(100) DEFAULT '' COMMENT '提示消息',
  `decimals` tinyint(1) DEFAULT NULL COMMENT '小数点',
  `length` mediumint(8) DEFAULT NULL COMMENT '长度',
  `minimum` smallint(6) DEFAULT NULL COMMENT '最小数量',
  `maximum` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '最大数量',
  `extend_html` varchar(255) DEFAULT '' COMMENT '扩展信息',
  `setting` varchar(1500) DEFAULT '' COMMENT '配置信息',
  `sort` int(10) NOT NULL DEFAULT '9' COMMENT '排序',
  `create_time` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `update_time` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `issort` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可排序',
  `isfilter` tinyint(1) NOT NULL DEFAULT '0' COMMENT '筛选',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `content_list` text COMMENT '数据列表',
  `visible` varchar(255) DEFAULT '' COMMENT '动态显示',
  `islist` tinyint(1) DEFAULT '1' COMMENT '数据列表显示',
  PRIMARY KEY (`id`),
  KEY `id` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='自定义字段表';


CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) CHARACTER SET utf8 DEFAULT '' COMMENT '类型',
  `title` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '标题',
  `image` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT 'logo',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '跳转链接',
  `sort` int(11) NOT NULL DEFAULT '9' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 ',
  `target` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '跳转',
  `create_time` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `lang` varchar(255) DEFAULT '' COMMENT '语言',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='友情链接';


CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_models` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '模型名',
  `table_name` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '对应表',
  `template_list` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '列表模板',
  `template_detail` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '内容模板',
  `ismenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '后台菜单',
  `default_fields` text COMMENT '默认字段',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 0 = 关闭  || 1= 正常',
  `create_time` bigint(16) DEFAULT NULL,
  `update_time` bigint(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='cms 模型表';


CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '标题',
  `use_num` int(11) DEFAULT '0' COMMENT '使用次数',
  `lang` varchar(100) NOT NULL DEFAULT '',
  `create_time` bigint(16) DEFAULT NULL,
  `update_time` bigint(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='文章tags\n';

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_langs` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL DEFAULT '' COMMENT '名称',
   `sub_title` varchar(255) DEFAULT '' COMMENT '简称',
   `code` varchar(255) CHARACTER SET utf8 DEFAULT NULL DEFAULT '' COMMENT '编码',
   `domain` varchar(100) DEFAULT '' COMMENT '域名',
   `status` tinyint(1) DEFAULT 1 COMMENT '状态',
   `is_default` tinyint(1) DEFAULT 0 COMMENT '默认语言',
   `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
   `create_time` bigint(16) NULL COMMENT '创建时间',
   `update_time` bigint(16) NULL COMMENT '更新时间',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='多语言表';

INSERT INTO `__PREFIX__ldcms_models` (`id`, `name`, `table_name`, `template_list`, `template_detail`, `ismenu`, `sort`, `status`, `create_time`, `update_time`) VALUES
(2, '新闻', 'news', 'list_news.html', 'detail_news.html', 1, NULL, 1, 1660652121, 1673490730),
(1, '单页', 'page', '', 'detail_page.html', 1, NULL, 1, 1660729799, 1660953440),
(6, '产品', 'product', 'list_product.html', 'detail_product.html', 1, NULL, 1, 1661071323, 1673491797),
(7, '案例', 'case', 'list_case.html', 'detail_case.html', 1, NULL, 1, 1662162090, 1673490728),
(8, '团队', 'team', 'list_team.html', 'detail_team.html', 1, NULL, 1, 1662162420, 1673491744);

-- 1.0.5 --
ALTER TABLE `__PREFIX__ldcms_fields` ADD COLUMN `visible` varchar(255) DEFAULT '' COMMENT '动态显示' AFTER `content_list`;
ALTER TABLE `__PREFIX__ldcms_fields` ADD COLUMN `islist` tinyint(1) DEFAULT '1' COMMENT '数据列表显示' AFTER `visible`;

-- 1.0.6 --
CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_siteinfo`(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `lang` varchar(50) NOT NULL COMMENT '语言',
    `config` text COMMENT '配置',
    `create_time` bigint(20) DEFAULT NULL,
    `update_time` bigint(20) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `lang` (`lang`) USING BTREE
    ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='站点信息表';

-- 1.1.0--
ALTER TABLE `__PREFIX__ldcms_langs` ADD COLUMN `domain` varchar(100) DEFAULT '' COMMENT '域名' AFTER `code`;
ALTER TABLE `__PREFIX__ldcms_langs` ADD COLUMN `status` tinyint(1) DEFAULT 1 COMMENT '状态' AFTER `domain`;
ALTER TABLE `__PREFIX__ldcms_langs` ADD COLUMN `is_default` tinyint(1) DEFAULT 0 COMMENT '默认语言' AFTER `status`;
INSERT INTO `__PREFIX__ldcms_langs` (`id`, `title`, `code`,`domain`,`status`, `is_default`,`create_time`, `update_time`) VALUES
(1, '简体中文', 'zh-cn','',1,1, 1675334627, 1675334724),
(2, 'English', 'en','',1,0,1675334645, 1675334645);

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_category_fields` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `field` char(30) DEFAULT NULL COMMENT '名称',
    `type` varchar(30) DEFAULT NULL COMMENT '类型',
    `title` varchar(30) DEFAULT NULL COMMENT '标题',
    `filterlist` text COMMENT '筛选列表',
    `default` varchar(100) DEFAULT NULL COMMENT '默认值',
    `rule` varchar(100) DEFAULT NULL COMMENT '验证规则',
    `tip` varchar(100) DEFAULT NULL COMMENT '提示消息',
    `decimals` tinyint(4) DEFAULT NULL COMMENT '小数点',
    `length` mediumint(9) DEFAULT NULL COMMENT '长度',
    `minimum` smallint(6) DEFAULT NULL COMMENT '最小数量',
    `maximum` smallint(6) DEFAULT '0' COMMENT '最大数量',
    `extend_html` varchar(255) DEFAULT NULL COMMENT '扩展信息',
    `setting` varchar(1500) DEFAULT NULL COMMENT '配置信息',
    `sort` int(11) DEFAULT '9' COMMENT '排序',
    `create_time` bigint(20) DEFAULT NULL COMMENT '添加时间',
    `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
    `status` tinyint(4) DEFAULT '1' COMMENT '状态',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='栏目自定义字段表';

-- 1.2.0--
ALTER TABLE `__PREFIX__ldcms_ad` ADD COLUMN `content` varchar(1500) DEFAULT '' COMMENT '内容' AFTER `title`;

-- 1.2.2--
INSERT INTO `__PREFIX__ldcms_diyform` (`id`, `name`, `title`, `table`, `needlogin`, `iscaptcha`, `create_time`, `update_time`, `setting`, `status`) VALUES
(16, 'message', '在线留言', 'ldcms_message', 0, 1, 1672923154, 1673275104, '', 1);

-- 1.2.3--
ALTER TABLE `__PREFIX__ldcms_models` ADD COLUMN `default_fields` text COMMENT '默认字段' AFTER `ismenu`;

-- 1.2.4--
ALTER TABLE `__PREFIX__ldcms_langs` ADD COLUMN `sub_title` varchar(255) DEFAULT '' COMMENT '简称' AFTER `title`;
ALTER TABLE `__PREFIX__ldcms_langs` ADD COLUMN `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序' AFTER `is_default`;

-- 1.2.7--
ALTER TABLE `__PREFIX__ldcms_document` ADD COLUMN `custom_tpl` varchar(255) DEFAULT '' COMMENT '详情页模版' AFTER `gid`;
ALTER TABLE `__PREFIX__ldcms_document` ADD COLUMN `custom_urlname` varchar(255) DEFAULT '' COMMENT '自定义url' AFTER `custom_tpl`;

-- 1.3.0--
ALTER TABLE `__PREFIX__ldcms_category` ADD COLUMN `model_table_name` varchar(255) DEFAULT '' COMMENT '模型名的表名称' AFTER `is_nav`;
ALTER TABLE `__PREFIX__ldcms_category` ADD COLUMN `subname` varchar(255) DEFAULT NULL COMMENT '子名称' AFTER `is_nav`;
ALTER TABLE `__PREFIX__ldcms_category` ADD COLUMN `is_home` tinyint(1) NOT NULL DEFAULT '0' COMMENT '首页显示模块' AFTER `is_nav`;

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_tagaction` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `action` varchar(255) DEFAULT '' COMMENT '方法名称',
    `type` enum('sql','func') DEFAULT 'sql' COMMENT '方法类型：sql=sql语句,func=函数名',
    `setting` text COMMENT '方法主体',
    `create_time` bigint(20) DEFAULT NULL,
    `update_time` bigint(20) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='自定义标签sql';

-- ----------------------------
-- Records of __PREFIX__ldcms_tagaction
-- ----------------------------
BEGIN;
INSERT INTO `__PREFIX__ldcms_tagaction` (`id`, `action`, `type`, `setting`, `create_time`, `update_time`) VALUES (1, 'product', 'sql', '{\"model\":\"\\\\addons\\\\ldcms\\\\model\\\\Document\",\"name\":\"ldcms_document\",\"db_type\":\"model\",\"alias\":\"document\",\"field\":\"document.*,extend.*,category.name cname,category.urlname curlname\",\"join\":[[\"ldcms_document_product extend\",\"extend.document_id=document.id\",\"LEFT\"]],\"class\":\"\\\\addons\\\\ldcms\\\\model\\\\Document\",\"func\":\"getHomeList\",\"params\":[[\"mid\",\"=\",\"6\",\"AND\"],[\"lang\",\"=\",\":ld_get_home_lang\",\"AND\"],[\"status\",\"=\",\"1\",\"AND\"],[\"filter_where\",\"CUSTOM\",\"\",\"AND\"],[\"show_time\",\"<=\",\":time\",\"AND\"],[\"cid\",\"IN\",\"\",\"AND\"],[\"sub_cid\",\"FIND_IN_SET_AND\",\"\",\"OR\"]]}', 1716512401, 1755665378);
INSERT INTO `__PREFIX__ldcms_tagaction` (`id`, `action`, `type`, `setting`, `create_time`, `update_time`) VALUES (2, 'home_block', 'sql', '{\"model\":\"\\\\addons\\\\ldcms\\\\model\\\\Category\",\"name\":\"\",\"db_type\":\"model\",\"alias\":\"category\",\"field\":\"id,is_home,name,urlname,model_table_name,subname,pid,ename\",\"class\":\"\",\"func\":\"\",\"params\":[[\"lang\",\"=\",\":ld_get_home_lang\",\"AND\"],[\"status\",\"=\",\"1\",\"AND\"],[\"model_table_name\",\"=\",\"\",\"AND\"],[\"is_home\",\"=\",\"1\",\"AND\"]],\"join\":\"\"}', 1716732521, 1755869203);
COMMIT;


-- 1.3.2--
ALTER TABLE `__PREFIX__ldcms_document` MODIFY COLUMN `seo_description` varchar(500) DEFAULT '' COMMENT 'SEO描述';


-- 1.4.0--
ALTER TABLE `__PREFIX__ldcms_ad` ADD COLUMN `is_video` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否使用视频';
ALTER TABLE `__PREFIX__ldcms_ad` ADD COLUMN `video` varchar(255) DEFAULT NULL COMMENT '视频';

--1.4.5--
ALTER TABLE `__PREFIX__ldcms_document_product` ADD COLUMN `types` varchar(255) DEFAULT NULL COMMENT '类型';
ALTER TABLE `__PREFIX__ldcms_document_product` ADD COLUMN `cpcs` text COMMENT '产品参数';
ALTER TABLE `__PREFIX__ldcms_document_product` ADD COLUMN `gzfw` text COMMENT '工作范围';
ALTER TABLE `__PREFIX__ldcms_document_product` ADD COLUMN `procz`  varchar(255) DEFAULT '' COMMENT '材质';
ALTER TABLE `__PREFIX__ldcms_document_product` ADD COLUMN `procc` varchar(255) DEFAULT '' COMMENT '尺寸';

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_document_download` (
  `document_id` int(10) NOT NULL,
  `downlinks` varchar(2555) DEFAULT '' COMMENT '下载文件',
  PRIMARY KEY (`document_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='下载';

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_document_wordlist` (
  `document_id` int(10) NOT NULL,
  `subtitle` varchar(255) DEFAULT '' COMMENT '副标题',
  PRIMARY KEY (`document_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文档';


INSERT INTO `__PREFIX__ldcms_siteinfo` (`id`, `lang`, `config`, `create_time`, `update_time`) VALUES (1, 'zh-cn', '[{\"name\":\"template\",\"title\":\"前台模板\",\"type\":\"select\",\"content\":\"[\\\"default\\\"]\",\"value\":\"ldcms2025\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"请确保addons\\/ldcms\\/view有相应的目录\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"sitetitle\",\"title\":\"网站标题\",\"type\":\"string\",\"content\":[],\"value\":\"苏州xx教育公司中文\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"sitesubtitle\",\"title\":\"网站副标题\",\"type\":\"string\",\"content\":[],\"value\":\"苏州xx教育公司中文\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"seo_keywords\",\"title\":\"网站关键词\",\"type\":\"text\",\"content\":[],\"value\":\"苏州xx教育公司\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"seo_description\",\"title\":\"网站描述\",\"type\":\"text\",\"content\":[],\"value\":\"苏州xx教育公司\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"logo1\",\"title\":\"网站logo\",\"type\":\"image\",\"content\":[],\"maximum\":1,\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/logo1.png\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"logo2\",\"title\":\"网站logo\",\"type\":\"image\",\"content\":[],\"maximum\":1,\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/logo2.png\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"compony\",\"title\":\"公司名称\",\"type\":\"string\",\"content\":[],\"value\":\"苏州xx教育公司\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"tel\",\"title\":\"联系电话\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"400-000-0000\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"phone\",\"title\":\"手机号\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"400-000-0000\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"text\",\"name\":\"address\",\"title\":\"地址\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"江苏省苏州市xxx街xx号\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"email\",\"title\":\"邮箱\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"123123@163.com\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"contacts\",\"title\":\"联系人\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"李经理\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"qq\",\"title\":\"在线咨询链接\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"http:\\/\\/wpa.qq.com\\/msgrd?v=3&uin=&site=qq&menu=yes\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"rule\":\"\",\"group\":\"基础\",\"type\":\"image\",\"name\":\"dyewm\",\"title\":\"抖音二维码\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/qrcode.png\",\"content\":\"\",\"tip\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"rule\":\"\",\"group\":\"基础\",\"type\":\"image\",\"name\":\"qqewm\",\"title\":\"QQ二维码\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/qrcode.png\",\"content\":\"\",\"tip\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"rule\":\"\",\"group\":\"基础\",\"type\":\"image\",\"name\":\"xhsewm\",\"title\":\"小红书二维码\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/qrcode.png\",\"content\":\"\",\"tip\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"icp\",\"title\":\"ICP备案号\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"苏ICP备88888888号\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"copyright\",\"title\":\"底部版权\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"Copyright © 2011-2024 苏州竹子网络科技有限公司 版权所有\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"text\",\"name\":\"script\",\"title\":\"第三方代码\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\",\"content\":\"\",\"tip\":\"\",\"visible\":\"\",\"rule\":\"\",\"extend\":\"\"},{\"rule\":\"\",\"group\":\"基础\",\"type\":\"array3\",\"name\":\"about_count\",\"title\":\"关于我们统计\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\",\"value1\":\"\",\"value2\":\"\",\"value3\":\"\",\"value4\":\"\"},\"value\":[{\"value1\":\"10\",\"value2\":\"年\",\"value3\":\"10年核心团队经验\"},{\"value1\":\"20\",\"value2\":\"+\",\"value3\":\"超20项知识产权\"}],\"content\":\"{\\\"value1\\\":\\\"title1\\\",\\\"value2\\\":\\\"title2\\\"}\",\"tip\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"rule\":\"\",\"group\":\"基础\",\"type\":\"string\",\"name\":\"bdak\",\"title\":\"百度地图ak密钥\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\",\"value1\":\"\",\"value2\":\"\",\"value3\":\"\",\"value4\":\"\"},\"value\":\"\",\"content\":\"\",\"tip\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"rule\":\"\",\"group\":\"基础\",\"type\":\"string\",\"name\":\"mpdw\",\"title\":\"百度地图定位经纬度\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\",\"value1\":\"\",\"value2\":\"\",\"value3\":\"\",\"value4\":\"\"},\"value\":\"\",\"content\":\"\",\"tip\":\"\",\"visible\":\"\",\"extend\":\"\"}]', 1680791788, 1755836620);
INSERT INTO `__PREFIX__ldcms_siteinfo` (`id`, `lang`, `config`, `create_time`, `update_time`) VALUES (2, 'en', '[{\"name\":\"template\",\"title\":\"前台模板\",\"type\":\"select\",\"content\":\"[\\\"default\\\"]\",\"value\":\"ldcms2025en\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"请确保addons\\/ldcms\\/view有相应的目录\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"sitetitle\",\"title\":\"网站标题\",\"type\":\"string\",\"content\":[],\"value\":\"Suzhou xx Education Company Chinese\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"sitesubtitle\",\"title\":\"网站副标题\",\"type\":\"string\",\"content\":[],\"value\":\"Suzhou xx Education Company Chinese\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"seo_keywords\",\"title\":\"网站关键词\",\"type\":\"text\",\"content\":[],\"value\":\"Suzhou xx Education Company Chinese\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"seo_description\",\"title\":\"网站描述\",\"type\":\"text\",\"content\":[],\"value\":\"Suzhou xx Education Company Chinese\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"logo1\",\"title\":\"网站logo\",\"type\":\"image\",\"content\":[],\"maximum\":1,\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/logo1.png\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"logo2\",\"title\":\"网站logo\",\"type\":\"image\",\"content\":[],\"maximum\":1,\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/logo2.png\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"compony\",\"title\":\"公司名称\",\"type\":\"string\",\"content\":[],\"value\":\"Suzhou xx Education Company Chinese\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"tel\",\"title\":\"联系电话\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"400-000-0000\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"phone\",\"title\":\"手机号\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"400-000-0000\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"text\",\"name\":\"address\",\"title\":\"地址\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"No. xx, xxx Street, Suzhou City, Jiangsu Province\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"email\",\"title\":\"邮箱\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"123123@163.com\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"contacts\",\"title\":\"联系人\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"李经理\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"qq\",\"title\":\"在线咨询链接\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"http:\\/\\/wpa.qq.com\\/msgrd?v=3&uin=&site=qq&menu=yes\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"rule\":\"\",\"group\":\"基础\",\"type\":\"image\",\"name\":\"dyewm\",\"title\":\"抖音二维码\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/qrcode.png\",\"content\":\"\",\"tip\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"rule\":\"\",\"group\":\"基础\",\"type\":\"image\",\"name\":\"qqewm\",\"title\":\"QQ二维码\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/qrcode.png\",\"content\":\"\",\"tip\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"rule\":\"\",\"group\":\"基础\",\"type\":\"image\",\"name\":\"xhsewm\",\"title\":\"小红书二维码\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/qrcode.png\",\"content\":\"\",\"tip\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"icp\",\"title\":\"ICP备案号\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"苏ICP备88888888号\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"copyright\",\"title\":\"底部版权\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"Copyright © 2011-2024 苏州竹子网络科技有限公司 版权所有\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"text\",\"name\":\"script\",\"title\":\"第三方代码\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\",\"content\":\"\",\"tip\":\"\",\"visible\":\"\",\"rule\":\"\",\"extend\":\"\"},{\"rule\":\"\",\"group\":\"基础\",\"type\":\"array3\",\"name\":\"about_count\",\"title\":\"关于我们统计\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\",\"value1\":\"\",\"value2\":\"\",\"value3\":\"\",\"value4\":\"\"},\"value\":[{\"value1\":\"10\",\"value2\":\"Year\",\"value3\":\"10 years of core team experience\"},{\"value1\":\"20\",\"value2\":\"+\",\"value3\":\"More than 20 intellectual property rights\"}],\"content\":\"{\\\"value1\\\":\\\"title1\\\",\\\"value2\\\":\\\"title2\\\"}\",\"tip\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"rule\":\"\",\"group\":\"基础\",\"type\":\"string\",\"name\":\"bdak\",\"title\":\"百度地图ak密钥\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\",\"value1\":\"\",\"value2\":\"\",\"value3\":\"\",\"value4\":\"\"},\"value\":\"\",\"content\":\"\",\"tip\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"rule\":\"\",\"group\":\"基础\",\"type\":\"string\",\"name\":\"mpdw\",\"title\":\"百度地图定位经纬度\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\",\"value1\":\"\",\"value2\":\"\",\"value3\":\"\",\"value4\":\"\"},\"value\":\"\",\"content\":\"\",\"tip\":\"\",\"visible\":\"\",\"extend\":\"\"}]', 1680791969, 1755836624);

INSERT INTO `__PREFIX__ldcms_models` (`id`, `name`, `table_name`, `template_list`, `template_detail`, `ismenu`, `default_fields`, `sort`, `status`, `create_time`, `update_time`) VALUES (12, '文档', 'wordlist', 'list_news.html', 'detail_news.html', 1, NULL, NULL, 1, 1708483289, 1716796722);
INSERT INTO `__PREFIX__ldcms_models` (`id`, `name`, `table_name`, `template_list`, `template_detail`, `ismenu`, `default_fields`, `sort`, `status`, `create_time`, `update_time`) VALUES (13, '下载', 'download', 'list_down.html', 'detail_news.html', 1, '[{\"id\":\"\",\"mid\":\"13\",\"field\":\"content\",\"type\":\"text\",\"title\":\"文章内容\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":\"1\",\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"id\",\"type\":\"int\",\"title\":\"\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"mid\",\"type\":\"int\",\"title\":\"模型\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"cid\",\"type\":\"int\",\"title\":\"栏目\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"sub_cid\",\"type\":\"varchar\",\"title\":\"副栏目\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":\"1\",\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"title\",\"type\":\"varchar\",\"title\":\"标题\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"image\",\"type\":\"text\",\"title\":\"缩略图\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"pics\",\"type\":\"text\",\"title\":\"多图\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"show_time\",\"type\":\"bigint\",\"title\":\"显示时间\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"seo_keywords\",\"type\":\"varchar\",\"title\":\"seo关键词\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"seo_description\",\"type\":\"varchar\",\"title\":\"seo描述\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"visits\",\"type\":\"int\",\"title\":\"浏览次数\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"likes\",\"type\":\"int\",\"title\":\"点赞次数\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"admin_id\",\"type\":\"int\",\"title\":\"管理员ID\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"author\",\"type\":\"varchar\",\"title\":\"作者\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"sort\",\"type\":\"int\",\"title\":\"排序\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"lang\",\"type\":\"varchar\",\"title\":\"语言\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"flag\",\"type\":\"varchar\",\"title\":\"标识\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"tag\",\"type\":\"varchar\",\"title\":\"标签\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"outlink\",\"type\":\"varchar\",\"title\":\"跳转链接\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"status\",\"type\":\"tinyint\",\"title\":\"状态\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"gid\",\"type\":\"varchar\",\"title\":\"浏览权限\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"custom_tpl\",\"type\":\"varchar\",\"title\":\"详情页模版\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"custom_urlname\",\"type\":\"varchar\",\"title\":\"自定义url\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"create_time\",\"type\":\"bigint\",\"title\":\"\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"update_time\",\"type\":\"bigint\",\"title\":\"\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"delete_time\",\"type\":\"bigint\",\"title\":\"\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1}]', NULL, 1, 1708609812, 1748006191);

UPDATE `__PREFIX__ldcms_tagaction` SET
  `setting` = '{\"model\":\"\\\\addons\\\\ldcms\\\\model\\\\Category\",\"name\":\"\",\"db_type\":\"model\",\"alias\":\"category\",\"field\":\"id,is_home,name,urlname,model_table_name,subname,pid,ename\",\"class\":\"\",\"func\":\"\",\"params\":[[\"lang\",\"=\",\":ld_get_home_lang\",\"AND\"],[\"status\",\"=\",\"1\",\"AND\"],[\"model_table_name\",\"=\",\"\",\"AND\"],[\"is_home\",\"=\",\"1\",\"AND\"]],\"join\":\"\"}',
  `update_time` = 1755869203
WHERE `id` = 2;