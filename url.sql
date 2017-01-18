-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-01-18 02:23:01
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
  PRIMARY KEY (`site`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `tp_site`
--

INSERT INTO `tp_site` (`site`, `add_p`, `add_code`, `add_w`, `add_h`, `domain`, `filter`, `filter_key`, `forbidden_ip`, `log`) VALUES
(1, 2, '<a href="https://www.vultr.com/?ref=7064696-3B"><img src="https://www.vultr.com/media/banner_1.png" width="728" height="90"></a>', 0, 0, '["t66y.com","hentai"]', 1, '["GFW","shadowsocks","VPN"]', '', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=99 ;

--
-- 转存表中的数据 `tp_url`
--

INSERT INTO `tp_url` (`lid`, `uid`, `original`, `short`, `time`, `ip`, `click`, `visitor`) VALUES
(1, 10, 'http://baidu.com', 'EhN2x', 1484584249, '1.1.1.1', 0, ''),
(2, 10, 'http://baidu.com', '4W8AM', 1484584350, '1.1.1.1', 22, '[{"short":"4W8AM","ip":"123.12.234.11"},{"short":"4W8AM","ip":"127.0.0.1"}]'),
(3, 10, 'http://baidu.com', '3nh5B', 1484586457, '1.1.1.1', 0, ''),
(4, 10, 'http://baidu.com', 'DHAoA', 1484588795, '1.1.1.1', 0, ''),
(5, 10, 'http://baidu.com', 'tm57D', 1484589353, '1.1.1.1', 0, ''),
(6, 10, 'http://baidu.com', 'GLqX1', 1484589805, '1.1.1.1', 27, '[{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"},{"short":"GLqX1","ip":"127.0.0.1"}]'),
(7, 10, 'http://baidu.com', 'gcy9q', 1484590258, '127.0.0.1', 0, ''),
(8, 10, 'http://baidu.com', 'r00mj', 1484590654, '127.0.0.1', 0, ''),
(9, 10, 'http://baidu.com', 'WFPf2', 1484595425, '127.0.0.1', 0, ''),
(10, 10, 'http://qq.com', 'XPSkd', 1484603745, '127.0.0.1', 0, ''),
(11, 10, 'https://promotion.aliyun.com/ntms/act/aliyun/ssd.html?utm_campaign=ssdxinyemian&utm_medium=images&utm_source=thinkphp&utm_content=m_5703', 'GZAWe', 1484603781, '127.0.0.1', 1, '[{"short":"GZAWe","ip":"127.0.0.1"}]'),
(12, 10, '222222', '4hf8r', 1484667808, '127.0.0.1', 0, ''),
(13, 10, '222222', 'Ig5mK', 1484667881, '127.0.0.1', 0, ''),
(14, 10, 'baidu.com', 'R6S8o', 1484667893, '127.0.0.1', 0, ''),
(15, 10, 'sssssssssssssss', 'SfivC', 1484668025, '127.0.0.1', 0, ''),
(16, 10, 'sssssssssssssss', 'uY4v5', 1484668071, '127.0.0.1', 0, ''),
(17, 10, 'sssssssssssssss', 'rracW', 1484668102, '127.0.0.1', 0, ''),
(18, 10, 'baidu.com', 'ufMUc', 1484668113, '127.0.0.1', 0, ''),
(19, 10, 'qq.com', 'AKGVj', 1484668196, '127.0.0.1', 0, ''),
(20, 10, 'http://qq.com', 'BCuho', 1484668209, '127.0.0.1', 0, ''),
(21, 10, 'http://qq.com', 'bnKal', 1484668241, '127.0.0.1', 0, ''),
(22, 10, 'http://qq.com', '6yKdl', 1484668266, '127.0.0.1', 0, ''),
(23, 10, 'http://qq.com', 'BnNYm', 1484668299, '127.0.0.1', 0, ''),
(24, 10, 'http://qq.com', 'DSL9o', 1484668304, '127.0.0.1', 0, ''),
(25, 10, 'http://qq.com', 'SOz76', 1484668325, '127.0.0.1', 0, ''),
(26, 10, 'http://qq.com', 'mA3zt', 1484668336, '127.0.0.1', 0, ''),
(27, 10, 'http://qq.com', 'EGXEi', 1484668363, '127.0.0.1', 0, ''),
(28, 10, 'http://qq.com', 'zdfZX', 1484668379, '127.0.0.1', 0, ''),
(29, 10, 'http://qq.com', 'bbt0H', 1484668744, '127.0.0.1', 0, ''),
(30, 10, 'http://qq.com', 'rqaPf', 1484669130, '127.0.0.1', 0, ''),
(31, 10, 'http://qq.com', 'Jy0CO', 1484669133, '127.0.0.1', 0, ''),
(32, 10, 'http://qq.com', 'vnJpv', 1484669342, '127.0.0.1', 0, ''),
(33, 10, 'http://qq.com', 'Iq8S9', 1484669374, '127.0.0.1', 0, ''),
(34, 10, 'http://qq.com', '6Y5OW', 1484669378, '127.0.0.1', 0, ''),
(35, 10, 'http://qq.com', 'LCU81', 1484669432, '127.0.0.1', 0, ''),
(36, 10, 'http://qq.com', 'J24K1', 1484669453, '127.0.0.1', 0, ''),
(37, 10, 'baidu.com', '6QQGw', 1484669500, '127.0.0.1', 0, ''),
(38, 10, 'baidu.com', 'WcTt2', 1484669542, '127.0.0.1', 0, ''),
(39, 10, 'baidu.com', 'uqhqo', 1484669583, '127.0.0.1', 0, ''),
(40, 10, 'baidu.com', 'wIKgy', 1484669616, '127.0.0.1', 0, ''),
(41, 10, 'baidu.com', 'YZ3EF', 1484669641, '127.0.0.1', 0, ''),
(42, 10, 'http://www.qq.com', 'c2Yl9', 1484669668, '127.0.0.1', 0, ''),
(43, 10, 'qq.com', 'qikEa', 1484669742, '127.0.0.1', 0, ''),
(44, 10, 'www.qq.com', 'lo1d3', 1484669750, '127.0.0.1', 0, ''),
(45, 10, 'http://www.qq.com', 'X9i5h', 1484669759, '127.0.0.1', 0, ''),
(46, 10, 'baidu.com', 'h7tI8', 1484670271, '127.0.0.1', 0, ''),
(47, 10, 'baidu.com', 'Tu4LN', 1484671230, '127.0.0.1', 0, ''),
(48, 10, 'baidu.com', 'Z1ndp', 1484672235, '127.0.0.1', 0, ''),
(49, 10, 'baidu.com', 'wP7OK', 1484672373, '127.0.0.1', 0, ''),
(50, 10, 'baidu', 'HZsAp', 1484672387, '127.0.0.1', 0, ''),
(51, 10, 'baidux', 'DX1Xi', 1484672392, '127.0.0.1', 0, ''),
(52, 10, 'baidxx', 'iIVnw', 1484672395, '127.0.0.1', 0, ''),
(53, 10, 'baaaaa', 'i6l4H', 1484672399, '127.0.0.1', 0, ''),
(54, 10, 'baaaaa', 'zydeX', 1484672457, '127.0.0.1', 0, ''),
(55, 10, 'baaaaa', 'vQajk', 1484672496, '127.0.0.1', 0, ''),
(56, 10, 'baidu.com', 'fEXT5', 1484672503, '127.0.0.1', 0, ''),
(57, 10, 'baidu.com', 'TiFpv', 1484672513, '127.0.0.1', 0, ''),
(58, 10, 'baidu.com', 'Sgz7v', 1484672623, '127.0.0.1', 0, ''),
(59, 10, 'baidu.com', 'ztrvj', 1484672649, '127.0.0.1', 0, ''),
(60, 10, 'baidu.com', 'zyiMW', 1484672659, '127.0.0.1', 0, ''),
(61, 10, 'baidu.com', 'D9p6d', 1484675115, '127.0.0.1', 0, ''),
(62, 10, 'baidu.com', 'HZCDA', 1484675177, '127.0.0.1', 0, ''),
(63, 10, 'Baidu.com', 'EsUvk', 1484675313, '127.0.0.1', 0, ''),
(64, 10, 'asdasdasd', 'vW6nG', 1484676445, '127.0.0.1', 0, ''),
(65, 10, 'httpasdasdasd', 'Uotmp', 1484676453, '127.0.0.1', 0, ''),
(66, 10, 'http://asdasdasd', 'fJTkf', 1484676460, '127.0.0.1', 0, ''),
(67, 10, 'http://asdasdasd', 'MTHpL', 1484676462, '127.0.0.1', 0, ''),
(68, 10, 'https://asdasdasd', 'dcenO', 1484676470, '127.0.0.1', 0, ''),
(69, 10, 'http://httpsdasdasd', 'LCE7T', 1484676742, '127.0.0.1', 0, ''),
(70, 10, 'http://baidxu.com', 'dkP9V', 1484677120, '127.0.0.1', 0, ''),
(71, 10, 'http://gjcomic.com', '2yy5v', 1484677148, '127.0.0.1', 0, ''),
(72, 10, 'http://gjcomic.com', '1ENta', 1484677204, '127.0.0.1', 0, ''),
(73, 10, 'http://httpsdasdasd', 'VWBng', 1484678665, '127.0.0.1', 0, ''),
(74, 10, 'http://httpsdasdasd', '13sl9', 1484678689, '127.0.0.1', 0, ''),
(75, 10, 'http://httpsdasdasd', 'SHFok', 1484678703, '127.0.0.1', 0, ''),
(76, 10, 'http://httpsdasdasd', 'oLRqs', 1484678748, '127.0.0.1', 0, ''),
(77, 10, 'http://httpsdasdasd', 'HcEA7', 1484678766, '127.0.0.1', 0, ''),
(78, 10, 'http://httpsdasdasd', '6ezau', 1484678778, '127.0.0.1', 0, ''),
(79, 10, 'http://httpsdasdasd', 'pA4l3', 1484678956, '127.0.0.1', 0, ''),
(80, 10, 'http://httpsdasdasd', 'dsiQR', 1484678974, '127.0.0.1', 0, ''),
(81, 10, 'http://httpsdasdasd', '3pvMW', 1484679002, '127.0.0.1', 0, ''),
(82, 10, 'http://httpsdasdasd', 'R9Ldu', 1484679025, '127.0.0.1', 0, ''),
(83, 10, 'http://httpsdasdasd', 'OpLih', 1484679043, '127.0.0.1', 0, ''),
(84, 10, 'http://httpsdasdasd', 'CzZPQ', 1484679573, '127.0.0.1', 0, ''),
(85, 10, 'http://qq.com', 'ZZw7z', 1484679833, '127.0.0.1', 0, ''),
(86, 10, 'http://www.qq.com', '6V3Ki', 1484679873, '127.0.0.1', 0, ''),
(87, 10, 'http://qq.com', 'Fa6w8', 1484679895, '127.0.0.1', 0, ''),
(88, 10, 'http://bbs.csdn.net/topics/392037939?locationNum=10&fps=1', 'ZE20P', 1484679912, '127.0.0.1', 0, ''),
(89, 10, 'http://gjcomic.com', '47oNC', 1484689989, '127.0.0.1', 0, ''),
(90, 10, 'http://gjcomic.com', 'MJtTn', 1484690024, '127.0.0.1', 0, ''),
(91, 10, 'http://www.gjcomic.com', 'Rl178', 1484690032, '127.0.0.1', 0, ''),
(92, 10, 'http://baidux.comx', 'OPiOf', 1484690842, '127.0.0.1', 0, ''),
(93, 10, 'http://baiduc.com', '57jG7', 1484690928, '127.0.0.1', 0, ''),
(94, 10, 'http://ad.adhouyi.cn/v/index.html?s=30108&w=300&h=250&pvid=0001484399305826_671419086', 'gfSIn', 1484690949, '127.0.0.1', 0, ''),
(95, 10, 'http://360.com', 'UMGmO', 1484691206, '127.0.0.1', 1, '[{"short":"UMGmO","ip":"127.0.0.1"}]'),
(96, 10, 'http://so.com', 'Pc4eP', 1484696095, '127.0.0.1', 9, '[{"short":"Pc4eP","ip":"127.0.0.1"},{"short":"Pc4eP","ip":"127.0.0.1"},{"short":"Pc4eP","ip":"127.0.0.1"},{"short":"Pc4eP","ip":"127.0.0.1"},{"short":"Pc4eP","ip":"127.0.0.1"},{"short":"Pc4eP","ip":"127.0.0.1"},{"short":"Pc4eP","ip":"127.0.0.1"},{"short":"Pc4eP","ip":"127.0.0.1"},{"short":"Pc4eP","ip":"127.0.0.1"}]'),
(97, 10, 'http://www.yunbt.net', 'l7rjK', 1484697905, '127.0.0.1', 14, '[{"short":"l7rjK","ip":"127.0.0.1"},{"short":"l7rjK","ip":"127.0.0.1"},{"short":"l7rjK","ip":"127.0.0.1"},{"short":"l7rjK","ip":"127.0.0.1"},{"short":"l7rjK","ip":"127.0.0.1"},{"short":"l7rjK","ip":"127.0.0.1"},{"short":"l7rjK","ip":"127.0.0.1"},{"short":"l7rjK","ip":"127.0.0.1"},{"short":"l7rjK","ip":"127.0.0.1"},{"short":"l7rjK","ip":"127.0.0.1"},{"short":"l7rjK","ip":"127.0.0.1"},{"short":"l7rjK","ip":"127.0.0.1"},{"short":"l7rjK","ip":"127.0.0.1"},{"short":"l7rjK","ip":"127.0.0.1"}]'),
(98, 10, 'http://www.yunbt.net', 'y8dQK', 1484702068, '127.0.0.1', 6, '[{"short":"y8dQK","ip":"127.0.0.1"},{"short":"y8dQK","ip":"127.0.0.1"},{"short":"y8dQK","ip":"127.0.0.1"},{"short":"y8dQK","ip":"127.0.0.1"},{"short":"y8dQK","ip":"127.0.0.1"},{"short":"y8dQK","ip":"127.0.0.1"}]');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
