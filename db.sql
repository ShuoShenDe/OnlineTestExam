-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 年 04 月 01 日 15:51
-- 服务器版本: 5.6.16
-- PHP 版本: 5.5.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `db`
--

-- --------------------------------------------------------

--
-- 表的结构 `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

--
-- 转存表中的数据 `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can add group', 3, 'add_group'),
(9, 'Can change group', 3, 'change_group'),
(10, 'Can delete group', 3, 'delete_group'),
(11, 'Can view group', 3, 'view_group'),
(12, 'Can view permission', 2, 'view_permission'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add 班级信息', 6, 'add_userclass'),
(22, 'Can change 班级信息', 6, 'change_userclass'),
(23, 'Can delete 班级信息', 6, 'delete_userclass'),
(24, 'Can add 用户信息', 7, 'add_userprofile'),
(25, 'Can change 用户信息', 7, 'change_userprofile'),
(26, 'Can delete 用户信息', 7, 'delete_userprofile'),
(27, 'Can add 邮箱验证码', 8, 'add_emailrevifyrecord'),
(28, 'Can change 邮箱验证码', 8, 'change_emailrevifyrecord'),
(29, 'Can delete 邮箱验证码', 8, 'delete_emailrevifyrecord'),
(30, 'Can add 轮播图', 9, 'add_banner'),
(31, 'Can change 轮播图', 9, 'change_banner'),
(32, 'Can delete 轮播图', 9, 'delete_banner'),
(33, 'Can add 允许学号', 10, 'add_alloweduser'),
(34, 'Can change 允许学号', 10, 'change_alloweduser'),
(35, 'Can delete 允许学号', 10, 'delete_alloweduser'),
(36, 'Can view 允许学号', 10, 'view_alloweduser'),
(37, 'Can view 轮播图', 9, 'view_banner'),
(38, 'Can view 邮箱验证码', 8, 'view_emailrevifyrecord'),
(39, 'Can view 班级信息', 6, 'view_userclass'),
(40, 'Can view 用户信息', 7, 'view_userprofile'),
(41, 'Can add 课程', 11, 'add_courselist'),
(42, 'Can change 课程', 11, 'change_courselist'),
(43, 'Can delete 课程', 11, 'delete_courselist'),
(44, 'Can add 题库', 12, 'add_question'),
(45, 'Can change 题库', 12, 'change_question'),
(46, 'Can delete 题库', 12, 'delete_question'),
(47, 'Can add 试卷列表', 13, 'add_paperlist'),
(48, 'Can change 试卷列表', 13, 'change_paperlist'),
(49, 'Can delete 试卷列表', 13, 'delete_paperlist'),
(50, 'Can add 试题列表', 14, 'add_paper'),
(51, 'Can change 试题列表', 14, 'change_paper'),
(52, 'Can delete 试题列表', 14, 'delete_paper'),
(53, 'Can view 课程', 11, 'view_courselist'),
(54, 'Can view 试题列表', 14, 'view_paper'),
(55, 'Can view 试卷列表', 13, 'view_paperlist'),
(56, 'Can view 题库', 12, 'view_question'),
(57, 'Can add 通知发布', 15, 'add_notice'),
(58, 'Can change 通知发布', 15, 'change_notice'),
(59, 'Can delete 通知发布', 15, 'delete_notice'),
(60, 'Can add 用户留言', 16, 'add_usernote'),
(61, 'Can change 用户留言', 16, 'change_usernote'),
(62, 'Can delete 用户留言', 16, 'delete_usernote'),
(63, 'Can add 用户做题记录', 17, 'add_useranswerlog'),
(64, 'Can change 用户做题记录', 17, 'change_useranswerlog'),
(65, 'Can delete 用户做题记录', 17, 'delete_useranswerlog'),
(66, 'Can add 用户总分', 18, 'add_userscore'),
(67, 'Can change 用户总分', 18, 'change_userscore'),
(68, 'Can delete 用户总分', 18, 'delete_userscore'),
(69, 'Can view 通知发布', 15, 'view_notice'),
(70, 'Can view 用户做题记录', 17, 'view_useranswerlog'),
(71, 'Can view 用户留言', 16, 'view_usernote'),
(72, 'Can view 用户总分', 18, 'view_userscore'),
(73, 'Can add Bookmark', 19, 'add_bookmark'),
(74, 'Can change Bookmark', 19, 'change_bookmark'),
(75, 'Can delete Bookmark', 19, 'delete_bookmark'),
(76, 'Can add User Setting', 20, 'add_usersettings'),
(77, 'Can change User Setting', 20, 'change_usersettings'),
(78, 'Can delete User Setting', 20, 'delete_usersettings'),
(79, 'Can add User Widget', 21, 'add_userwidget'),
(80, 'Can change User Widget', 21, 'change_userwidget'),
(81, 'Can delete User Widget', 21, 'delete_userwidget'),
(82, 'Can add log entry', 22, 'add_log'),
(83, 'Can change log entry', 22, 'change_log'),
(84, 'Can delete log entry', 22, 'delete_log'),
(85, 'Can view Bookmark', 19, 'view_bookmark'),
(86, 'Can view log entry', 22, 'view_log'),
(87, 'Can view User Setting', 20, 'view_usersettings'),
(88, 'Can view User Widget', 21, 'view_userwidget'),
(89, 'Can add captcha store', 23, 'add_captchastore'),
(90, 'Can change captcha store', 23, 'change_captchastore'),
(91, 'Can delete captcha store', 23, 'delete_captchastore');

-- --------------------------------------------------------

--
-- 表的结构 `captcha_captchastore`
--

CREATE TABLE IF NOT EXISTS `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=165 ;

-- --------------------------------------------------------

--
-- 表的结构 `coures_courselist`
--

CREATE TABLE IF NOT EXISTS `coures_courselist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `decs` varchar(500) NOT NULL,
  `add_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `coures_courselist`
--

INSERT INTO `coures_courselist` (`id`, `name`, `decs`, `add_time`) VALUES
(1, '数据结构', '数据机构与算法设计', '2017-04-03'),
(2, 'java语言程序设计', 'Java语言的语法以及编程实战', '2017-04-03'),
(3, '小学数学', '小学数学人人学', '2017-04-03');

-- --------------------------------------------------------

--
-- 表的结构 `coures_paper`
--

CREATE TABLE IF NOT EXISTS `coures_paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` date NOT NULL,
  `paper_name_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coures_paper_51e862cf` (`paper_name_id`),
  KEY `coures_paper_7aa0f6ee` (`question_id`),
  KEY `coures_paper_ea134da7` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `coures_paper`
--

INSERT INTO `coures_paper` (`id`, `add_time`, `paper_name_id`, `question_id`, `course_id`) VALUES
(1, '2017-04-04', 1, 1, 1),
(2, '2017-04-04', 1, 2, 1),
(3, '2017-04-04', 1, 3, 1),
(4, '2017-04-04', 1, 4, 1),
(5, '2017-04-04', 1, 5, 1),
(6, '2017-04-04', 1, 6, 1),
(7, '2017-04-04', 1, 7, 1),
(9, '2017-04-04', 1, 8, 1),
(10, '2017-04-04', 1, 9, 1),
(11, '2017-04-04', 1, 10, 1),
(12, '2017-04-04', 2, 11, 3),
(13, '2017-04-04', 2, 12, 3),
(14, '2017-04-04', 2, 13, 1),
(15, '2017-04-04', 2, 14, 1),
(16, '2018-03-21', 5, 1, 1),
(17, '2018-03-21', 5, 2, 1),
(18, '2018-03-21', 5, 3, 1),
(19, '2018-04-01', 6, 2, 1),
(20, '2018-04-01', 6, 7, 1),
(21, '2018-04-01', 6, 9, 1);

-- --------------------------------------------------------

--
-- 表的结构 `coures_paperlist`
--

CREATE TABLE IF NOT EXISTS `coures_paperlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `is_allow` tinyint(1) NOT NULL,
  `add_time` date NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coures_paperlist_course_id_945bf724_fk_coures_courselist_id` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `coures_paperlist`
--

INSERT INTO `coures_paperlist` (`id`, `name`, `is_allow`, `add_time`, `course_id`) VALUES
(1, '第一次测试', 1, '2017-04-04', 1),
(2, '三年级第一次月考', 1, '2017-04-04', 3),
(5, 'test', 1, '2018-03-21', 1),
(6, '我的考试', 1, '2018-04-01', 1);

-- --------------------------------------------------------

--
-- 表的结构 `coures_question`
--

CREATE TABLE IF NOT EXISTS `coures_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionType` varchar(2) NOT NULL,
  `content` longtext NOT NULL,
  `answer` longtext NOT NULL,
  `choice_a` longtext NOT NULL,
  `choice_b` longtext NOT NULL,
  `choice_c` longtext NOT NULL,
  `choice_d` longtext NOT NULL,
  `score` int(11) NOT NULL,
  `note` longtext NOT NULL,
  `boolt` longtext NOT NULL,
  `boolf` longtext NOT NULL,
  `add_time` date NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coures_question_course_id_1c63d3e4_fk_coures_courselist_id` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `coures_question`
--

INSERT INTO `coures_question` (`id`, `questionType`, `content`, `answer`, `choice_a`, `choice_b`, `choice_c`, `choice_d`, `score`, `note`, `boolt`, `boolf`, `add_time`, `course_id`) VALUES
(1, 'xz', 'C语言发明者是谁？', 'B', 'A.詹姆斯·高斯林', 'B.丹尼斯·里奇', 'C.林纳斯·托瓦兹', 'D.严蔚敏', 10, '问答题在此处做答', 'True', 'False', '2017-04-03', 1),
(2, 'xz', '研究数据结构就是研究（）', 'D', 'A.数据的逻辑结构', 'B.数据的存储结构', 'C.数据的逻辑结构和存储结构', 'D.数据的逻辑结构、存储结构及其基本操作', 10, '问答题在此处做答', 'True', 'False', '2017-04-03', 1),
(3, 'xz', '与数据元素本身的形式、内容、相对位置和个数无关的是数据的（）结构', 'C', 'A.存储', 'B.物理', 'C.逻辑', 'D.物理和存储', 10, '问答题在此处做答', 'True', 'False', '2017-04-03', 1),
(4, 'xz', '数据结构在计算机存储空间中的存放形式称为（）', 'C', 'A.数据元素之间的关系', 'B.数据结构', 'C.数据的存储结构', 'D.数据的逻辑结构', 10, '问答题在此处做答', 'True', 'False', '2017-04-03', 1),
(5, 'xz', '数据的存储结构是指（）', 'B', 'A.数据所占的存储空间', 'B.数据的逻辑结构在计算机中的表示', 'C.存储在外存中的数据', 'D.数据在计算机的顺序访问形式', 10, '问答题在此处做答', 'True', 'False', '2017-04-03', 1),
(6, 'xz', '以下说法正确的是（）', 'D', 'A.数据元素是数据的最小单位', 'B.数据项是数据的基本单位', 'C.数据结构是带结构的各数据项的集合', 'D.一些表面上很不想同的数据，可以有相同的逻辑结构', 10, '问答题在此处做答', 'True', 'False', '2017-04-03', 1),
(7, 'xz', '从逻辑上可以把数据结构分成（）', 'C', 'A.动态结构和静态结构', 'B.紧凑结构和非紧凑结构', 'C.线性结构和非线性结构', 'D.内部结构和外部结构', 10, '问答题在此处做答', 'True', 'False', '2017-04-03', 1),
(8, 'xz', '算法分析的目的是（）', 'C', 'A.找出数据结构的合理性', 'B.研究算法中的输入和输出的关系', 'C.分析算法的效率以求改进', 'D.分析算法的易懂性和文档性', 10, '问答题在此处做答', 'True', 'False', '2017-04-03', 1),
(9, 'xz', '算法分析的两个主要方面', 'A', 'A.时间复杂度和空间复杂度', 'B.正确性和简单性', 'C.分析算法的效率以求改进', 'D.分析算法的易懂性和文档性', 10, '问答题在此处做答', 'True', 'False', '2017-04-04', 1),
(10, 'xz', '算法的时间复杂度是指（）', 'D', 'A.执行算法程序锁需要的时间', 'B.算法程序中的指令条数', 'C.算法程序的长度', 'D.算法执行过程中所需要的基本运算次数', 10, '问答题在此处做答', 'True', 'False', '2017-04-04', 1),
(11, 'xz', '请问 3 + 9 = ___', 'C', 'A.11', 'B.13', 'C.12', 'D.14', 25, '问答题在此处做答', 'True', 'False', '2017-04-04', 3),
(12, 'xz', '3 * 5 = ___', 'A', 'A.15', 'B.16', 'C.14', 'D.13', 25, '问答题在此处做答', 'True', 'False', '2017-04-04', 3),
(13, 'pd', '我有两块糖，吃了一块，还剩三块', 'False', 'A.', 'B.', 'C.', 'D.', 25, '问答题在此处做答', 'True', 'False', '2017-04-04', 3),
(14, 'xz', '学校与小明家的距离是3km，小明骑自行车以300米/分钟的匀速去学校，那么他需要多长时间到学校', 'D', 'A.11分钟', 'B.15分钟', 'C.12分钟', 'D.10分钟', 25, '问答题在此处做答', 'True', 'False', '2017-04-04', 3),
(16, '', 'test1111', 'tttt', '', '', '', '', 3423, '', '', '', '2018-03-19', 0);

-- --------------------------------------------------------

--
-- 表的结构 `coures_userpaperlog`
--

CREATE TABLE IF NOT EXISTS `coures_userpaperlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_name_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `add_time` date DEFAULT NULL,
  `score` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paper_name_id` (`paper_name_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `coures_userpaperlog`
--

INSERT INTO `coures_userpaperlog` (`id`, `paper_name_id`, `user_id`, `status`, `add_time`, `score`) VALUES
(1, 1, 10, 2, '2018-03-18', '21'),
(2, 5, 10, 2, '2018-03-21', '23'),
(3, 1, 19, 2, '2018-04-01', '44');

-- --------------------------------------------------------

--
-- 表的结构 `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- 转存表中的数据 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(23, 'captcha', 'captchastore'),
(4, 'contenttypes', 'contenttype'),
(11, 'coures', 'courselist'),
(14, 'coures', 'paper'),
(13, 'coures', 'paperlist'),
(12, 'coures', 'question'),
(15, 'operate', 'notice'),
(17, 'operate', 'useranswerlog'),
(16, 'operate', 'usernote'),
(18, 'operate', 'userscore'),
(5, 'sessions', 'session'),
(10, 'users', 'alloweduser'),
(9, 'users', 'banner'),
(8, 'users', 'emailrevifyrecord'),
(6, 'users', 'userclass'),
(7, 'users', 'userprofile'),
(19, 'xadmin', 'bookmark'),
(22, 'xadmin', 'log'),
(20, 'xadmin', 'usersettings'),
(21, 'xadmin', 'userwidget');

-- --------------------------------------------------------

--
-- 表的结构 `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2017-04-03 23:43:57'),
(2, 'contenttypes', '0002_remove_content_type_name', '2017-04-03 23:43:57'),
(3, 'auth', '0001_initial', '2017-04-03 23:43:58'),
(4, 'auth', '0002_alter_permission_name_max_length', '2017-04-03 23:43:58'),
(5, 'auth', '0003_alter_user_email_max_length', '2017-04-03 23:43:58'),
(6, 'auth', '0004_alter_user_username_opts', '2017-04-03 23:43:58'),
(7, 'auth', '0005_alter_user_last_login_null', '2017-04-03 23:43:58'),
(8, 'auth', '0006_require_contenttypes_0002', '2017-04-03 23:43:58'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2017-04-03 23:43:58'),
(10, 'users', '0001_initial', '2017-04-03 23:43:59'),
(11, 'admin', '0001_initial', '2017-04-03 23:43:59'),
(12, 'admin', '0002_logentry_remove_auto_add', '2017-04-03 23:43:59'),
(13, 'captcha', '0001_initial', '2017-04-03 23:43:59'),
(14, 'coures', '0001_initial', '2017-04-03 23:43:59'),
(15, 'coures', '0002_paper_course', '2017-04-03 23:43:59'),
(16, 'operate', '0001_initial', '2017-04-03 23:44:00'),
(17, 'operate', '0002_auto_20170403_2323', '2017-04-03 23:44:00'),
(18, 'sessions', '0001_initial', '2017-04-03 23:44:00'),
(19, 'users', '0002_alloweduser', '2017-04-03 23:44:00'),
(20, 'xadmin', '0001_initial', '2017-04-03 23:44:00'),
(21, 'xadmin', '0002_log', '2017-04-03 23:44:00'),
(22, 'xadmin', '0003_auto_20160715_0100', '2017-04-03 23:44:00');

-- --------------------------------------------------------

--
-- 表的结构 `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('769elg2ktegxulb0fn4tu3xgglt2c43j', 'M2NhNmE2ZjE5NjU3MmUwZGIyYzc5ZGYwNGQ0ZTFjMDdmZjJiZjYwNTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJ1c2VycHJvZmlsZSJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiZmU3Mzk1MzdkZjRhYjg2Nzc4NWFjYjlkODcwZjE2OGI1MjJmNWE1NyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQifQ==', '2017-04-24 17:08:24'),
('7tlr8ooflhsbo3hpef9danuj8cno1u3p', 'MDY1MTdhYzkwYmNmZmZjMGQ5MDU0OTNlZTFhZWNlMDgwZTM3NjdkYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM0NTI0ZGViNGJhOGFiMmZkNmQ5NzI3ZWVlYzgyMjcyMjNkODllNTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjE5In0=', '2018-04-15 21:48:30'),
('8h5jq0fffjm7x63dyjiq888dn20uo13k', 'Y2I5M2NmMmJkMjg1N2Q2NmU5N2ZhMzQ4ZWVhMjNkZDkzNDE1NDU4MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZlNzM5NTM3ZGY0YWI4Njc3ODVhY2I5ZDg3MGYxNjhiNTIyZjVhNTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==', '2017-04-18 22:19:31');

-- --------------------------------------------------------

--
-- 表的结构 `operate_notice`
--

CREATE TABLE IF NOT EXISTS `operate_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pub_time` date NOT NULL,
  `pub_content` longtext NOT NULL,
  `pub_name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operate_notice_pub_name_id_1ba66da6_fk_users_userprofile_id` (`pub_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `operate_useranswerlog`
--

CREATE TABLE IF NOT EXISTS `operate_useranswerlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` longtext NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `add_time` date NOT NULL,
  `paper_log_id` int(11) DEFAULT NULL,
  `paper_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- 转存表中的数据 `operate_useranswerlog`
--

INSERT INTO `operate_useranswerlog` (`id`, `answer`, `score`, `add_time`, `paper_log_id`, `paper_id`, `user_id`) VALUES
(21, 'test1', 10, '2018-03-18', 1, 1, 10),
(22, 'test2', 11, '2018-03-18', 1, 2, 10),
(23, '', 0, '2018-03-18', 1, 3, 10),
(24, '', 0, '2018-03-18', 1, 4, 10),
(25, '', 0, '2018-03-18', 1, 5, 10),
(26, '', 0, '2018-03-18', 1, 6, 10),
(27, '', 0, '2018-03-18', 1, 7, 10),
(28, '', 0, '2018-03-18', 1, 8, 10),
(29, '', 0, '2018-03-18', 1, 9, 10),
(30, '', 0, '2018-03-18', 1, 10, 10),
(31, 'test1', 6, '2018-03-21', 2, 16, 10),
(32, 'test2', 7, '2018-03-21', 2, 17, 10),
(33, 'test4', 10, '2018-03-21', 2, 18, 10),
(34, 'test1', 8, '2018-04-01', 3, 1, 19),
(35, 'test2', 7, '2018-04-01', 3, 2, 19),
(36, 'test3', 3, '2018-04-01', 3, 3, 19),
(37, 'test4', 4, '2018-04-01', 3, 4, 19),
(38, 'test5', 5, '2018-04-01', 3, 5, 19),
(39, 'test6', 2, '2018-04-01', 3, 6, 19),
(40, 'test7', 1, '2018-04-01', 3, 7, 19),
(41, 'test8', 3, '2018-04-01', 3, 9, 19),
(42, 'test9', 5, '2018-04-01', 3, 10, 19),
(43, 'test10', 6, '2018-04-01', 3, 11, 19);

-- --------------------------------------------------------

--
-- 表的结构 `operate_usernote`
--

CREATE TABLE IF NOT EXISTS `operate_usernote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` date NOT NULL,
  `note_content` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operate_usernote_user_id_07966e99_fk_users_userprofile_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `operate_userscore`
--

CREATE TABLE IF NOT EXISTS `operate_userscore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) NOT NULL,
  `add_time` date NOT NULL,
  `paper_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operate_userscore_user_id_b7fbf01a_fk_users_userprofile_id` (`user_id`),
  KEY `operate_userscore_paper_id_a32de3cb_uniq` (`paper_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `operate_userscore`
--

INSERT INTO `operate_userscore` (`id`, `total`, `add_time`, `paper_id`, `user_id`) VALUES
(1, 100, '2017-04-04', 2, 2),
(2, 0, '2017-04-04', 2, 2),
(3, 0, '2017-04-04', 2, 2),
(4, 100, '2017-04-04', 2, 2),
(5, 100, '2017-04-04', 2, 2),
(6, 100, '2017-04-04', 2, 2),
(7, 100, '2017-04-04', 2, 2),
(8, 100, '2017-04-04', 2, 2),
(9, 100, '2017-04-04', 2, 2),
(10, 100, '2017-04-06', 2, 2),
(11, 100, '2017-04-10', 2, 2),
(12, 100, '2017-04-10', 2, 2),
(13, 100, '2017-04-10', 2, 2),
(14, 75, '2017-04-10', 2, 2),
(15, 0, '2018-03-18', 2, 10),
(16, 0, '2018-03-18', 1, 10);

-- --------------------------------------------------------

--
-- 表的结构 `users_alloweduser`
--

CREATE TABLE IF NOT EXISTS `users_alloweduser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `users_banner`
--

CREATE TABLE IF NOT EXISTS `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `users_emailrevifyrecord`
--

CREATE TABLE IF NOT EXISTS `users_emailrevifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `is_alive` tinyint(1) NOT NULL,
  `send_type` varchar(10) NOT NULL,
  `send_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `users_emailrevifyrecord`
--

INSERT INTO `users_emailrevifyrecord` (`id`, `code`, `email`, `is_alive`, `send_type`, `send_time`) VALUES
(1, 'p3ppbfGfBUwNn4uH', 'sqr129@163.com', 1, 'register', '2018-03-11'),
(2, 'rwZD08tJzEE9L4FG', 'sqr123@163.com', 1, 'register', '2018-03-11'),
(3, 'rXdJtw6snOg4Nl7o', 'sqr124@163.com', 1, 'register', '2018-03-11'),
(4, 'gsx3Tx08gmLCIMNZ', 'sqr1287@163.com', 1, 'register', '2018-03-11'),
(5, '4Bmhd1DVkS13xisS', 'sqr126@163.com', 1, 'register', '2018-03-11'),
(6, 'W8sKKfVha2AV10CC', 'sqr1288@163.com', 1, 'register', '2018-03-31'),
(7, 'WufuLDOaa9TMiMEm', 'sqr1282@163.com', 1, 'register', '2018-03-31'),
(8, 'svJic6TAHAeszI1Z', 'sqr1284@163.com', 1, 'register', '2018-03-31'),
(9, 'semlnNLzVw1jZAa4', 'sqr1296@163.com', 1, 'register', '2018-03-31'),
(10, 'XqK8aUvt8Jgimgx6', 'sqr129341@163.com', 1, 'register', '2018-03-31');

-- --------------------------------------------------------

--
-- 表的结构 `users_userclass`
--

CREATE TABLE IF NOT EXISTS `users_userclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `users_userclass`
--

INSERT INTO `users_userclass` (`id`, `class_name`, `count`) VALUES
(1, '14信算2', 0);

-- --------------------------------------------------------

--
-- 表的结构 `users_userprofile`
--

CREATE TABLE IF NOT EXISTS `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `user_class` varchar(255) DEFAULT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `users_userprofile`
--

INSERT INTO `users_userprofile` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `nick_name`, `birthday`, `gender`, `mobile`, `image`, `user_class`, `role`) VALUES
(2, 'pbkdf2_sha256$24000$1FbedrjjO1KY$QJmwh1gecgu09fVwOnogVHp7thz7CjCopg9FanC+2Ss=', '2018-03-21 17:12:23', 1, 'root', '', '', '410018832@qq.com', 1, 1, '2017-04-03 23:46:00', '任志远1', '2017-04-06', 'male', '15068895421', 'static/images/head/2017/04/python_y9icNZd.png', NULL, 0),
(10, 'pbkdf2_sha256$24000$1FbedrjjO1KY$QJmwh1gecgu09fVwOnogVHp7thz7CjCopg9FanC+2Ss=', '2018-03-21 17:15:53', 0, '1000000001', '', '', 'sqr129@163.com', 0, 1, '2018-03-11 19:33:20', 'sun', '2018-03-05', 'male', '13242112', 'static/images/head/default.png', '14信算2', 1),
(11, 'pbkdf2_sha256$24000$1FbedrjjO1KY$QJmwh1gecgu09fVwOnogVHp7thz7CjCopg9FanC+2Ss=', NULL, 0, '1000000002', '', '', 'sqr123@163.com', 0, 0, '2018-03-11 19:54:15', '', NULL, 'female', NULL, 'static/images/head/default.png', '14信算2', 0),
(12, 'pbkdf2_sha256$24000$StmypUhz1TBx$tX4BOxkpcQVok50wqlSbXfAh/3fhUFzz8zpeMDJBkGA=', NULL, 0, '1000000003', '', '', 'sqr124@163.com', 0, 0, '2018-03-11 19:57:15', '', NULL, 'female', NULL, 'static/images/head/default.png', '14信算2', 0),
(13, 'pbkdf2_sha256$24000$XgL0gq7WI8Ej$gSeItgW44YeaJfVYP3YeB71/I9nRYOFvVfeb10daxl8=', NULL, 0, '1000000004', '', '', 'sqr1287@163.com', 0, 0, '2018-03-11 20:03:16', '', NULL, 'female', NULL, 'static/images/head/default.png', '14信算2', 1),
(14, 'pbkdf2_sha256$24000$KmUFji7u9LTC$SwHVyr/pAH/fg3u4rIEf5Sy2uaS59wZzLghQMtBMA7I=', NULL, 0, '1000000005', '', '', 'sqr126@163.com', 0, 0, '2018-03-11 20:04:28', '', NULL, 'female', NULL, 'static/images/head/default.png', '14信算2', 1),
(15, 'pbkdf2_sha256$24000$3ij1y1UYl7e8$JVJIF+LDXknVeNezlJmraa3bR+zvxF7CZNxTF4dENtI=', '2018-03-31 12:25:26', 0, '2000000001', '', '', 'sqr1288@163.com', 0, 1, '2018-03-31 12:23:51', '', NULL, 'female', NULL, 'static/images/head/default.png', '14信算2', 0),
(16, 'pbkdf2_sha256$24000$Y4RRRG3rYRRp$5HNe3fK42A9pWjgBLzCjDdJpDHz3/MLlxsGHYNaj+7g=', '2018-03-31 12:27:17', 0, '2000000002', '', '', 'sqr1282@163.com', 0, 1, '2018-03-31 12:26:58', '', NULL, 'female', NULL, 'static/images/head/default.png', '14信算2', 0),
(17, 'pbkdf2_sha256$24000$w2cLoLraEOL8$aFtxx1nLZiF5kzoM7zTmXlfcu02sEtgr4dohJfXQfHw=', '2018-03-31 12:28:29', 0, '1000000009', '', '', 'sqr1284@163.com', 0, 1, '2018-03-31 12:28:06', '', NULL, 'female', NULL, 'static/images/head/default.png', '14信算2', 1),
(18, 'pbkdf2_sha256$24000$ma5ti8VuNP21$pi9YumivWOUoeas4CXtynHiSUskL5tuufBNXtijn6FU=', '2018-04-01 21:41:51', 0, '2000000009', '', '', 'sqr1296@163.com', 0, 1, '2018-03-31 12:30:49', '', NULL, 'female', NULL, 'static/images/head/default.png', '14信算2', 0),
(19, 'pbkdf2_sha256$24000$M36maDsqZkJd$dVgQPllcO6C5VoEtgvsXZGAtjA+oSxtcNIKhBQqVy8g=', '2018-04-01 21:48:30', 0, '1000000011', '', '', 'sqr129341@163.com', 0, 1, '2018-03-31 12:31:39', '李三1', '2018-03-05', 'male', '13263139054', 'static/images/head/default.png', '14信算2', 1);

-- --------------------------------------------------------

--
-- 表的结构 `users_userprofile_groups`
--

CREATE TABLE IF NOT EXISTS `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `users_userprofile_user_permissions`
--

CREATE TABLE IF NOT EXISTS `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xadmin_bookmark`
--

CREATE TABLE IF NOT EXISTS `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xadmin_log`
--

CREATE TABLE IF NOT EXISTS `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `xadmin_log`
--

INSERT INTO `xadmin_log` (`id`, `action_time`, `ip_addr`, `object_id`, `object_repr`, `action_flag`, `message`, `content_type_id`, `user_id`) VALUES
(1, '2017-04-03 23:47:20', '127.0.0.1', '1', '数据结构', 'create', '已添加', 11, 2),
(2, '2017-04-03 23:47:38', '127.0.0.1', '2', 'java语言程序设计', 'create', '已添加', 11, 2),
(3, '2017-04-03 23:48:08', '127.0.0.1', '3', '小学数学', 'create', '已添加', 11, 2),
(4, '2017-04-03 23:49:55', '127.0.0.1', '1', '数据结构(题干:C语言发明者是谁？ | 正确答案:B )', 'create', '已添加', 12, 2),
(5, '2017-04-03 23:51:42', '127.0.0.1', '2', '数据结构(题干:研究数据结构就是研究（） | 正确答案:D )', 'create', '已添加', 12, 2),
(6, '2017-04-03 23:52:55', '127.0.0.1', '3', '数据结构(题干:与数据元素本身的形式、内容、相对位置和个数无关的是数据的（）结构 | 正确答案:C )', 'create', '已添加', 12, 2),
(7, '2017-04-03 23:54:19', '127.0.0.1', '4', '数据结构(题干:数据结构在计算机存储空间中的存放形式称为（） | 正确答案:C )', 'create', '已添加', 12, 2),
(8, '2017-04-03 23:56:06', '127.0.0.1', '5', '数据结构(题干:数据的存储结构是指（） | 正确答案:B )', 'create', '已添加', 12, 2),
(9, '2017-04-03 23:58:02', '127.0.0.1', '6', '数据结构(题干:以下说法正确的是（） | 正确答案:D )', 'create', '已添加', 12, 2),
(10, '2017-04-03 23:59:20', '127.0.0.1', '7', '数据结构(题干:从逻辑上可以把数据结构分成（） | 正确答案:C )', 'create', '已添加', 12, 2),
(11, '2017-04-04 00:00:52', '127.0.0.1', '8', '数据结构(题干:算法分析的目的是（） | 正确答案:C )', 'create', '已添加', 12, 2),
(12, '2017-04-04 00:02:01', '127.0.0.1', '9', '数据结构(题干:算法分析的两个主要方面 | 正确答案:A )', 'create', '已添加', 12, 2),
(13, '2017-04-04 00:03:26', '127.0.0.1', '10', '数据结构(题干:算法的时间复杂度是指（） | 正确答案:D )', 'create', '已添加', 12, 2),
(14, '2017-04-04 00:04:17', '127.0.0.1', '1', '数据结构(试卷名称:第一次测试 | 使用状态:True)', 'create', '已添加', 13, 2),
(15, '2017-04-04 00:04:50', '127.0.0.1', '1', '数据结构(试卷名称:第一次测试 | 使用状态:True) (C语言发明者是谁？)', 'create', '已添加', 14, 2),
(16, '2017-04-04 00:04:56', '127.0.0.1', '2', '数据结构(试卷名称:第一次测试 | 使用状态:True) (研究数据结构就是研究（）)', 'create', '已添加', 14, 2),
(17, '2017-04-04 00:05:09', '127.0.0.1', '3', '数据结构(试卷名称:第一次测试 | 使用状态:True) (与数据元素本身的形式、内容、相对位置和个数无关的是数据的（）结构)', 'create', '已添加', 14, 2),
(18, '2017-04-04 00:05:16', '127.0.0.1', '4', '数据结构(试卷名称:第一次测试 | 使用状态:True) (数据结构在计算机存储空间中的存放形式称为（）)', 'create', '已添加', 14, 2),
(19, '2017-04-04 00:05:56', '127.0.0.1', '5', '数据结构(试卷名称:第一次测试 | 使用状态:True) (数据的存储结构是指（）)', 'create', '已添加', 14, 2),
(20, '2017-04-04 00:06:25', '127.0.0.1', '6', '数据结构(试卷名称:第一次测试 | 使用状态:True) (以下说法正确的是（）)', 'create', '已添加', 14, 2),
(21, '2017-04-04 00:06:43', '127.0.0.1', '7', '数据结构(试卷名称:第一次测试 | 使用状态:True) (从逻辑上可以把数据结构分成（）)', 'create', '已添加', 14, 2),
(22, '2017-04-04 00:07:04', '127.0.0.1', '8', '数据结构(试卷名称:第一次测试 | 使用状态:True) (从逻辑上可以把数据结构分成（）)', 'create', '已添加', 14, 2),
(23, '2017-04-04 00:07:27', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 试题列表', NULL, 2),
(24, '2017-04-04 00:07:50', '127.0.0.1', '9', '数据结构(试卷名称:第一次测试 | 使用状态:True) (算法分析的目的是（）)', 'create', '已添加', 14, 2),
(25, '2017-04-04 00:08:01', '127.0.0.1', '10', '数据结构(试卷名称:第一次测试 | 使用状态:True) (算法分析的两个主要方面)', 'create', '已添加', 14, 2),
(26, '2017-04-04 00:08:20', '127.0.0.1', '11', '数据结构(试卷名称:第一次测试 | 使用状态:True) (算法的时间复杂度是指（）)', 'create', '已添加', 14, 2),
(27, '2017-04-04 00:13:23', '127.0.0.1', '11', '小学数学(题干:请问 3 + 9 = ___ | 正确答案:C )', 'create', '已添加', 12, 2),
(28, '2017-04-04 00:14:20', '127.0.0.1', '12', '小学数学(题干:3 * 5 = ___ | 正确答案:A )', 'create', '已添加', 12, 2),
(29, '2017-04-04 00:15:16', '127.0.0.1', '13', '小学数学(题干:我有两块糖，吃了一块，还剩三块 | 正确答案:False )', 'create', '已添加', 12, 2),
(30, '2017-04-04 00:18:19', '127.0.0.1', '14', '小学数学(题干:学校与小明家的距离是3km，小明骑自行车以300米/分钟的匀速去学校，那么他需要多长时间到学校 | 正确答案:D )', 'create', '已添加', 12, 2),
(31, '2017-04-04 00:19:34', '127.0.0.1', '2', '小学数学(试卷名称:三年级第一次月考 | 使用状态:True)', 'create', '已添加', 13, 2),
(32, '2017-04-04 00:20:07', '127.0.0.1', '12', '小学数学(试卷名称:三年级第一次月考 | 使用状态:True) (请问 3 + 9 = ___)', 'create', '已添加', 14, 2),
(33, '2017-04-04 00:20:30', '127.0.0.1', '13', '小学数学(试卷名称:三年级第一次月考 | 使用状态:True) (3 * 5 = ___)', 'create', '已添加', 14, 2),
(34, '2017-04-04 00:20:43', '127.0.0.1', '14', '小学数学(试卷名称:三年级第一次月考 | 使用状态:True) (我有两块糖，吃了一块，还剩三块)', 'create', '已添加', 14, 2),
(35, '2017-04-04 00:20:59', '127.0.0.1', '15', '小学数学(试卷名称:三年级第一次月考 | 使用状态:True) (学校与小明家的距离是3km，小明骑自行车以300米/分钟的匀速去学校，那么他需要多长时间到学校)', 'create', '已添加', 14, 2),
(36, '2017-04-04 13:33:23', '127.0.0.1', '2', 'root', 'change', '已修改 last_login，nick_name，birthday，gender，mobile 和 image 。', 7, 2),
(37, '2017-04-10 17:07:41', '127.0.0.1', '3', '1400801299', 'create', '已添加', 7, 2),
(38, '2017-04-10 17:08:24', '127.0.0.1', '2', 'root', 'change', '已修改 last_login 和 image 。', 7, 2);

-- --------------------------------------------------------

--
-- 表的结构 `xadmin_usersettings`
--

CREATE TABLE IF NOT EXISTS `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `xadmin_usersettings`
--

INSERT INTO `xadmin_usersettings` (`id`, `key`, `value`, `user_id`) VALUES
(1, 'dashboard:home:pos', '', 2);

-- --------------------------------------------------------

--
-- 表的结构 `xadmin_userwidget`
--

CREATE TABLE IF NOT EXISTS `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 限制导出的表
--

--
-- 限制表 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- 限制表 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 限制表 `coures_paper`
--
ALTER TABLE `coures_paper`
  ADD CONSTRAINT `coures_paper_course_id_bbb6941b_fk_coures_courselist_id` FOREIGN KEY (`course_id`) REFERENCES `coures_courselist` (`id`),
  ADD CONSTRAINT `coures_paper_paper_name_id_db46332d_fk_coures_paperlist_id` FOREIGN KEY (`paper_name_id`) REFERENCES `coures_paperlist` (`id`),
  ADD CONSTRAINT `coures_paper_question_id_f1d0b8c2_fk_coures_question_id` FOREIGN KEY (`question_id`) REFERENCES `coures_question` (`id`);

--
-- 限制表 `coures_paperlist`
--
ALTER TABLE `coures_paperlist`
  ADD CONSTRAINT `coures_paperlist_course_id_945bf724_fk_coures_courselist_id` FOREIGN KEY (`course_id`) REFERENCES `coures_courselist` (`id`);

--
-- 限制表 `coures_userpaperlog`
--
ALTER TABLE `coures_userpaperlog`
  ADD CONSTRAINT `coures_userpaperlog_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  ADD CONSTRAINT `coures_userpaperlog_ibfk_3` FOREIGN KEY (`paper_name_id`) REFERENCES `coures_paperlist` (`id`);

--
-- 限制表 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  ADD CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 限制表 `operate_notice`
--
ALTER TABLE `operate_notice`
  ADD CONSTRAINT `operate_notice_pub_name_id_1ba66da6_fk_users_userprofile_id` FOREIGN KEY (`pub_name_id`) REFERENCES `users_userprofile` (`id`);

--
-- 限制表 `operate_usernote`
--
ALTER TABLE `operate_usernote`
  ADD CONSTRAINT `operate_usernote_user_id_07966e99_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`);

--
-- 限制表 `operate_userscore`
--
ALTER TABLE `operate_userscore`
  ADD CONSTRAINT `operate_userscore_paper_id_a32de3cb_fk_coures_paperlist_id` FOREIGN KEY (`paper_id`) REFERENCES `coures_paperlist` (`id`),
  ADD CONSTRAINT `operate_userscore_user_id_b7fbf01a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`);

--
-- 限制表 `users_userprofile_groups`
--
ALTER TABLE `users_userprofile_groups`
  ADD CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`);

--
-- 限制表 `users_userprofile_user_permissions`
--
ALTER TABLE `users_userprofile_user_permissions`
  ADD CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`);

--
-- 限制表 `xadmin_bookmark`
--
ALTER TABLE `xadmin_bookmark`
  ADD CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  ADD CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 限制表 `xadmin_log`
--
ALTER TABLE `xadmin_log`
  ADD CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`);

--
-- 限制表 `xadmin_usersettings`
--
ALTER TABLE `xadmin_usersettings`
  ADD CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`);

--
-- 限制表 `xadmin_userwidget`
--
ALTER TABLE `xadmin_userwidget`
  ADD CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
