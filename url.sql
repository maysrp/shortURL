-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-01-21 23:36:42
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `url`
--

-- --------------------------------------------------------

--
-- 表的结构 `tp_admin`
--

CREATE TABLE IF NOT EXISTS `tp_admin` (
  `admin` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(54) NOT NULL,
  `salt` int(11) NOT NULL,
  `info` longtext NOT NULL,
  PRIMARY KEY (`admin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `tp_admin`
--

INSERT INTO `tp_admin` (`admin`, `password`, `salt`, `info`) VALUES
(1, '5f1d7a84db00d2fce00b31a7fc73224f', 123456, '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_site`
--

CREATE TABLE IF NOT EXISTS `tp_site` (
  `site` int(11) NOT NULL AUTO_INCREMENT,
  `add_p` int(11) NOT NULL COMMENT '广告位置[1上/2下]',
  `add_code` longtext CHARACTER SET utf8 NOT NULL COMMENT '广告代码',
  `add_w` int(11) NOT NULL COMMENT '宽度',
  `add_h` int(11) NOT NULL COMMENT '高',
  `domain` longtext CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `filter` int(11) NOT NULL COMMENT '过滤1开启0关闭',
  `filter_key` longtext CHARACTER SET utf8 NOT NULL COMMENT '过滤 词语',
  `forbidden_ip` longtext NOT NULL COMMENT '禁止IP',
  `log` longtext CHARACTER SET utf8 NOT NULL COMMENT '保存操作内容',
  `site_name` varchar(128) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`site`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `tp_site`
--

INSERT INTO `tp_site` (`site`, `add_p`, `add_code`, `add_w`, `add_h`, `domain`, `filter`, `filter_key`, `forbidden_ip`, `log`, `site_name`) VALUES
(1, 2, '<a href="https://www.vultr.com/?ref=7064696-3B"><img src="https://www.vultr.com/media/banner_1.png" width="728" height="90"></a>', 0, 0, '["t66y.com","hentai","baidu.com"]', 0, '', '', '', 'Short');

-- --------------------------------------------------------

--
-- 表的结构 `tp_url`
--

CREATE TABLE IF NOT EXISTS `tp_url` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `original` text CHARACTER SET utf8 NOT NULL,
  `short` varchar(16) NOT NULL COMMENT '最大16个字符串',
  `time` int(11) NOT NULL,
  `ip` varchar(128) NOT NULL,
  `click` int(11) NOT NULL,
  `visitor` longtext NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
