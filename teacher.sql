/*
Navicat MySQL Data Transfer

Source Server         : wamp
Source Server Version : 50520
Source Host           : 127.0.0.1:3306
Source Database       : teacher

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2017-06-12 10:04:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_depart
-- ----------------------------
DROP TABLE IF EXISTS `t_depart`;
CREATE TABLE `t_depart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_depart
-- ----------------------------
INSERT INTO `t_depart` VALUES ('1', '人事部', '一教3101');
INSERT INTO `t_depart` VALUES ('2', '财政部', '二教2201');
INSERT INTO `t_depart` VALUES ('3', '学生处', '四教2101');
INSERT INTO `t_depart` VALUES ('4', '宣传部', '五教1101');

-- ----------------------------
-- Table structure for t_income
-- ----------------------------
DROP TABLE IF EXISTS `t_income`;
CREATE TABLE `t_income` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `proid` int(11) unsigned DEFAULT NULL,
  `sloary` double(7,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incom` (`proid`),
  CONSTRAINT `incom` FOREIGN KEY (`proid`) REFERENCES `t_profession` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_income
-- ----------------------------
INSERT INTO `t_income` VALUES ('1', '1', '5000.00');
INSERT INTO `t_income` VALUES ('2', '2', '4000.00');
INSERT INTO `t_income` VALUES ('3', '3', '3000.00');

-- ----------------------------
-- Table structure for t_info
-- ----------------------------
DROP TABLE IF EXISTS `t_info`;
CREATE TABLE `t_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `dapartid` int(11) unsigned NOT NULL,
  `professionid` int(11) unsigned NOT NULL,
  `jobid` int(11) unsigned NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL,
  `email` char(60) DEFAULT NULL,
  `IDcard` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `info_depart` (`dapartid`),
  KEY `info_job` (`jobid`),
  KEY `info_profession` (`professionid`),
  KEY `info_uid` (`uid`),
  CONSTRAINT `info_depart` FOREIGN KEY (`dapartid`) REFERENCES `t_depart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `info_job` FOREIGN KEY (`jobid`) REFERENCES `t_job` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `info_profession` FOREIGN KEY (`professionid`) REFERENCES `t_profession` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `info_uid` FOREIGN KEY (`uid`) REFERENCES `t_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_info
-- ----------------------------
INSERT INTO `t_info` VALUES ('1', '1', '小坤', '1', '2017-04-03', '党员', '专科', '2', '2', '2', '四川11111', '12121212', '12121@zzk.com', '2121212xx12121212');
INSERT INTO `t_info` VALUES ('2', '5', '小坤', '1', '2017-04-03', '党员', '专科', '1', '1', '1', '上海', '88888888', '12121@zzk.com', '1221321xx11213');
INSERT INTO `t_info` VALUES ('3', '2', '咚咚', '1', '2017-04-04', '团员', '大专', '2', '3', '1', '德阳', '123', '233@cafuc.com', '123123123');
INSERT INTO `t_info` VALUES ('4', '3', '咚咚坤', '1', '2010-04-07', '团员', '大专', '2', '2', '3', '德阳', '123', '233@cafuc.com', '123123123');
INSERT INTO `t_info` VALUES ('5', '4', '一觉', '1', '2004-03-28', '群众', '大专', '4', '2', '4', '德阳', '123', '233@cafuc.com', '123123123');

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_job
-- ----------------------------
INSERT INTO `t_job` VALUES ('1', '教授');
INSERT INTO `t_job` VALUES ('2', '副教授');
INSERT INTO `t_job` VALUES ('3', '讲师');
INSERT INTO `t_job` VALUES ('4', '助教');

-- ----------------------------
-- Table structure for t_logininfo
-- ----------------------------
DROP TABLE IF EXISTS `t_logininfo`;
CREATE TABLE `t_logininfo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT NULL,
  `loginip` varchar(15) DEFAULT NULL,
  `logintime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `t_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_logininfo
-- ----------------------------
INSERT INTO `t_logininfo` VALUES ('154', '1', '127.0.0.1', '2017-04-09 10:27:05');
INSERT INTO `t_logininfo` VALUES ('156', '1', '127.0.0.1', '2017-04-09 10:29:25');
INSERT INTO `t_logininfo` VALUES ('157', '1', '127.0.0.1', '2017-04-09 10:31:35');
INSERT INTO `t_logininfo` VALUES ('164', '1', '127.0.0.1', '2017-04-09 11:11:23');
INSERT INTO `t_logininfo` VALUES ('165', '1', '127.0.0.1', '2017-04-09 11:18:57');
INSERT INTO `t_logininfo` VALUES ('166', '5', '127.0.0.1', '2017-04-09 11:20:16');
INSERT INTO `t_logininfo` VALUES ('167', '5', '127.0.0.1', '2017-04-09 11:21:05');
INSERT INTO `t_logininfo` VALUES ('168', '2', '127.0.0.1', '2017-04-09 11:35:54');
INSERT INTO `t_logininfo` VALUES ('169', '1', '127.0.0.1', '2017-04-09 11:38:05');
INSERT INTO `t_logininfo` VALUES ('170', '2', '127.0.0.1', '2017-04-09 11:38:26');
INSERT INTO `t_logininfo` VALUES ('171', '5', '127.0.0.1', '2017-04-09 12:47:43');
INSERT INTO `t_logininfo` VALUES ('172', '5', '127.0.0.1', '2017-04-09 12:47:53');
INSERT INTO `t_logininfo` VALUES ('173', '5', '127.0.0.1', '2017-04-09 12:49:27');
INSERT INTO `t_logininfo` VALUES ('174', '5', '127.0.0.1', '2017-04-09 12:50:01');
INSERT INTO `t_logininfo` VALUES ('175', '5', '127.0.0.1', '2017-04-09 12:50:40');
INSERT INTO `t_logininfo` VALUES ('176', '5', '127.0.0.1', '2017-04-09 12:51:39');
INSERT INTO `t_logininfo` VALUES ('177', '5', '127.0.0.1', '2017-04-09 12:55:09');
INSERT INTO `t_logininfo` VALUES ('178', '5', '127.0.0.1', '2017-04-09 12:57:58');
INSERT INTO `t_logininfo` VALUES ('179', '5', '127.0.0.1', '2017-04-09 12:59:36');
INSERT INTO `t_logininfo` VALUES ('180', '4', '127.0.0.1', '2017-04-09 13:05:05');
INSERT INTO `t_logininfo` VALUES ('181', '4', '127.0.0.1', '2017-04-09 13:06:08');
INSERT INTO `t_logininfo` VALUES ('182', '1', '127.0.0.1', '2017-04-09 16:50:22');
INSERT INTO `t_logininfo` VALUES ('183', '5', '127.0.0.1', '2017-04-10 16:35:49');
INSERT INTO `t_logininfo` VALUES ('184', '1', '127.0.0.1', '2017-04-12 15:53:54');
INSERT INTO `t_logininfo` VALUES ('185', '5', '127.0.0.1', '2017-04-12 15:54:17');
INSERT INTO `t_logininfo` VALUES ('186', '1', '127.0.0.1', '2017-04-12 15:54:24');
INSERT INTO `t_logininfo` VALUES ('187', '5', '127.0.0.1', '2017-04-12 19:08:55');
INSERT INTO `t_logininfo` VALUES ('188', '1', '127.0.0.1', '2017-04-12 19:16:30');
INSERT INTO `t_logininfo` VALUES ('189', '5', '127.0.0.1', '2017-04-12 21:13:19');
INSERT INTO `t_logininfo` VALUES ('190', '5', '127.0.0.1', '2017-04-12 21:14:21');
INSERT INTO `t_logininfo` VALUES ('191', '5', '127.0.0.1', '2017-04-12 22:04:58');
INSERT INTO `t_logininfo` VALUES ('192', '5', '127.0.0.1', '2017-04-12 22:07:27');
INSERT INTO `t_logininfo` VALUES ('193', '5', '127.0.0.1', '2017-04-12 22:07:57');
INSERT INTO `t_logininfo` VALUES ('194', '5', '127.0.0.1', '2017-04-12 22:13:05');
INSERT INTO `t_logininfo` VALUES ('195', '5', '127.0.0.1', '2017-04-12 22:14:58');
INSERT INTO `t_logininfo` VALUES ('196', '5', '127.0.0.1', '2017-04-12 22:16:29');
INSERT INTO `t_logininfo` VALUES ('197', '5', '127.0.0.1', '2017-04-12 22:17:56');
INSERT INTO `t_logininfo` VALUES ('198', '5', '127.0.0.1', '2017-04-12 22:18:12');
INSERT INTO `t_logininfo` VALUES ('199', '5', '127.0.0.1', '2017-04-12 22:18:29');
INSERT INTO `t_logininfo` VALUES ('200', '5', '127.0.0.1', '2017-04-12 22:41:11');
INSERT INTO `t_logininfo` VALUES ('201', '1', '127.0.0.1', '2017-04-12 22:41:17');
INSERT INTO `t_logininfo` VALUES ('202', '5', '172.19.222.5', '2017-04-12 22:52:34');
INSERT INTO `t_logininfo` VALUES ('203', '5', '172.19.222.5', '2017-04-12 22:59:27');
INSERT INTO `t_logininfo` VALUES ('204', '5', '172.19.222.5', '2017-04-12 22:59:57');
INSERT INTO `t_logininfo` VALUES ('205', '1', '127.0.0.1', '2017-04-12 23:00:25');
INSERT INTO `t_logininfo` VALUES ('206', '1', '127.0.0.1', '2017-04-12 23:02:32');
INSERT INTO `t_logininfo` VALUES ('207', '1', '127.0.0.1', '2017-04-12 23:04:31');
INSERT INTO `t_logininfo` VALUES ('208', '1', '127.0.0.1', '2017-04-12 23:06:52');
INSERT INTO `t_logininfo` VALUES ('209', '1', '127.0.0.1', '2017-04-12 23:07:03');
INSERT INTO `t_logininfo` VALUES ('210', '5', '172.19.222.5', '2017-04-12 23:09:24');
INSERT INTO `t_logininfo` VALUES ('211', '1', '172.19.222.5', '2017-04-12 23:11:16');
INSERT INTO `t_logininfo` VALUES ('212', '1', '172.19.222.5', '2017-04-12 23:28:15');
INSERT INTO `t_logininfo` VALUES ('213', '1', '127.0.0.1', '2017-04-12 23:46:40');
INSERT INTO `t_logininfo` VALUES ('214', '5', '127.0.0.1', '2017-06-12 10:04:02');

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `outtime` char(40) DEFAULT NULL,
  `author` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES ('1', '你好啊', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈啊哈哈三大三打哈三季度合计as大师级的黄金啊圣诞节啊圣诞节啊还是觉得哈数据库的哈萨克决定回家ask即可', '12:21:21', 'zzk');
INSERT INTO `t_news` VALUES ('2', '你好啊', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈啊哈哈三大三打哈三季度合计as大师级的黄金啊圣诞节啊圣诞节啊还是觉得哈数据库的哈萨克决定回家ask即可', '12:21:22', 'zzk1');
INSERT INTO `t_news` VALUES ('3', 'sdsadas', 'dasdasdas', '12:12:32', 'zz');
INSERT INTO `t_news` VALUES ('4', 'test', 'this is a test news', '2017:04:06 23:56:29', '大坤');
INSERT INTO `t_news` VALUES ('5', 'another test', 'this is a test news too', '2017:04:06 23:57:34', '大坤');
INSERT INTO `t_news` VALUES ('6', '哈哈哈哈哈哈哈', '搞好了，搞好了，搞好了，搞好了，搞好了。', '2017:04:12 23:25:11', '小坤');

-- ----------------------------
-- Table structure for t_profession
-- ----------------------------
DROP TABLE IF EXISTS `t_profession`;
CREATE TABLE `t_profession` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_profession
-- ----------------------------
INSERT INTO `t_profession` VALUES ('1', '高级');
INSERT INTO `t_profession` VALUES ('2', '中级');
INSERT INTO `t_profession` VALUES ('3', '助理');

-- ----------------------------
-- Table structure for t_rp
-- ----------------------------
DROP TABLE IF EXISTS `t_rp`;
CREATE TABLE `t_rp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `reward` tinyint(1) DEFAULT NULL,
  `money` double(10,2) DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rp` (`uid`),
  CONSTRAINT `rp` FOREIGN KEY (`uid`) REFERENCES `t_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rp
-- ----------------------------
INSERT INTO `t_rp` VALUES ('1', '1', '迟到', '0', '100.00', '2017-04-03');
INSERT INTO `t_rp` VALUES ('2', '1', '中秋节', '1', '600.00', '2017-04-10');
INSERT INTO `t_rp` VALUES ('4', '1', '123123', '1', '1200.00', '2017-04-02');
INSERT INTO `t_rp` VALUES ('7', '1', '睡觉', '1', '1111.00', '2017-04-18');
INSERT INTO `t_rp` VALUES ('8', '5', '开心', '1', '1000.00', '2017-06-06');
INSERT INTO `t_rp` VALUES ('9', '5', '开心', '1', '1000.00', '2017-05-06');
INSERT INTO `t_rp` VALUES ('10', '1', '开心', '1', '1000.00', '2018-01-01');

-- ----------------------------
-- Table structure for t_teachereducation
-- ----------------------------
DROP TABLE IF EXISTS `t_teachereducation`;
CREATE TABLE `t_teachereducation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) unsigned DEFAULT NULL,
  `begin` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `school` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `edu_teacherid` (`tid`),
  CONSTRAINT `edu_teacherid` FOREIGN KEY (`tid`) REFERENCES `t_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teachereducation
-- ----------------------------
INSERT INTO `t_teachereducation` VALUES ('28', '2', '2017-03-07', '2017-03-29', '本科', '电子科大');
INSERT INTO `t_teachereducation` VALUES ('29', '2', '2017-04-12', '2017-04-14', '本科', '电子科大');
INSERT INTO `t_teachereducation` VALUES ('32', '1', '2017-03-07', '2017-03-29', '本科', '电子科大');
INSERT INTO `t_teachereducation` VALUES ('33', '1', '2017-04-12', '2017-04-14', '本科', '电子科大');
INSERT INTO `t_teachereducation` VALUES ('34', '1', '2017-04-04', '2017-04-28', '收到', '对对对');
INSERT INTO `t_teachereducation` VALUES ('35', '3', '2017-04-11', '2017-05-06', 'asa', 'saas');
INSERT INTO `t_teachereducation` VALUES ('36', '3', '2017-04-04', '2017-04-11', 'qw', 'qw');
INSERT INTO `t_teachereducation` VALUES ('37', '3', '2017-04-21', '2017-04-18', 'sa', 'dasd');

-- ----------------------------
-- Table structure for t_teacherfamily
-- ----------------------------
DROP TABLE IF EXISTS `t_teacherfamily`;
CREATE TABLE `t_teacherfamily` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) unsigned NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `relation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacherid` (`tid`),
  CONSTRAINT `teacherid` FOREIGN KEY (`tid`) REFERENCES `t_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teacherfamily
-- ----------------------------
INSERT INTO `t_teacherfamily` VALUES ('29', '2', '蚂蚁', '宠物');
INSERT INTO `t_teacherfamily` VALUES ('30', '2', '小发发', '弟弟');
INSERT INTO `t_teacherfamily` VALUES ('31', '2', '大发发', '哥哥');
INSERT INTO `t_teacherfamily` VALUES ('32', '1', '蚂蚁', '宠物');
INSERT INTO `t_teacherfamily` VALUES ('33', '1', '马云', '爸爸');
INSERT INTO `t_teacherfamily` VALUES ('34', '3', 'das', 'dasd');
INSERT INTO `t_teacherfamily` VALUES ('35', '3', 'dasdf', 'asdas');

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(60) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `flag` int(1) unsigned NOT NULL,
  `lock` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES ('1', '管理员', '3', '202cb962ac59075b964b07152d234b70', '1', '0');
INSERT INTO `t_users` VALUES ('2', '司徒凉', '4', '202cb962ac59075b964b07152d234b70', '1', '0');
INSERT INTO `t_users` VALUES ('3', '坤坤', '5', '202cb962ac59075b964b07152d234b70', '1', '0');
INSERT INTO `t_users` VALUES ('4', '咚咚', '2', '202cb962ac59075b964b07152d234b70', '1', '0');
INSERT INTO `t_users` VALUES ('5', '走走', '1', '202cb962ac59075b964b07152d234b70', '0', '0');

-- ----------------------------
-- View structure for t_smallinfo
-- ----------------------------
DROP VIEW IF EXISTS `t_smallinfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `t_smallinfo` AS SELECT
t_info.id,
t_info.`name`,
t_info.dapartid AS departid,
t_info.professionid,
t_info.jobid,
t_job.`name` AS jobname,
t_depart.`name` AS departname,
t_profession.`name` AS professionname,
t_income.sloary AS solary
FROM
	t_info,
	t_job,
	t_depart,
	t_profession,
	t_income
WHERE
	t_info.jobid = t_job.id AND
	t_profession.id = t_info.professionid AND 
	t_depart.id = t_info.dapartid AND
	t_info.professionid = t_income.proid ;

-- ----------------------------
-- Procedure structure for insert_edu
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_edu`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_edu`(IN tid int,IN begintime date,IN endtime date,IN status varchar(90),IN school varchar(90))
BEGIN
	DECLARE d DATE;
	IF tid IS NULL THEN
	ROLLBACK;
	END IF;
	IF begintime>endtime THEN
	SET d=begintime;
	SET begintime=endtime;
	SET endtime=d;
	END IF;
	INSERT INTO t_teachereducation(tid,begin,end,status,school) VALUES(tid,begintime,endtime,status,school);
	COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for t_changerp
-- ----------------------------
DROP PROCEDURE IF EXISTS `t_changerp`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `t_changerp`(OUT id LONG,OUT departid LONG,OUT departname VARCHAR(60),OUT professionid LONG,OUT professionname VARCHAR(60),OUT jobid LONG,OUT jobname VARCHAR(60),OUT solary DOUBLE)
BEGIN
	DECLARE reward DOUBLE;
	DECLARE publish DOUBLE;
	DECLARE tid LONG;
	
	SELECT id  INTO id FROM t_info;
	
	COMMIT;
	

END
;;
DELIMITER ;
