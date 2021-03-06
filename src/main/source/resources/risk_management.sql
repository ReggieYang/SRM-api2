/*
Navicat MySQL Data Transfer

Source Server         : ReggieYang
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : risk_management

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-11-15 11:55:50
*/


CREATE DATABASE IF NOT EXISTS risk_management CHARACTER SET utf8;

USE risk_management;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for followup
-- ----------------------------
DROP TABLE IF EXISTS `followup`;
CREATE TABLE `followup` (
  `followup_id` int(11) NOT NULL AUTO_INCREMENT,
  `possibility` varchar(255) DEFAULT NULL,
  `impact` varchar(255) DEFAULT NULL,
  `threshold` varchar(255) DEFAULT NULL,
  `creator_name` varchar(255) DEFAULT NULL,
  `follower_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `risk_type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `parent_risk_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `risk_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`followup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of followup
-- ----------------------------

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) DEFAULT NULL,
  `creator_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for project_developer
-- ----------------------------
DROP TABLE IF EXISTS `project_developer`;
CREATE TABLE `project_developer` (
  `project_id` int(11) DEFAULT NULL,
  `developer_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for risk
-- ----------------------------
DROP TABLE IF EXISTS `risk`;
CREATE TABLE `risk` (
  `risk_id` int(11) NOT NULL AUTO_INCREMENT,
  `possibility` varchar(255) DEFAULT NULL,
  `impact` varchar(255) DEFAULT NULL,
  `threshold` varchar(255) DEFAULT NULL,
  `creator_name` varchar(255) DEFAULT NULL,
  `follower_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `risk_type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `parent_risk_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`risk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TRIGGER IF EXISTS `create_project`;
DELIMITER ;;
CREATE TRIGGER `create_project` AFTER INSERT ON `project` FOR EACH ROW BEGIN
        INSERT INTO `project_developer`
    SELECT NEW.project_id, u2.user_name
    FROM user u1, user u2
    WHERE u1.user_name = NEW.creator_name AND u1.company = u2.company;
    END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_project`;
DELIMITER ;;
CREATE TRIGGER `delete_project` AFTER DELETE ON `project` FOR EACH ROW BEGIN
        DELETE FROM `project_developer`
        WHERE project_id = OLD.project_id;
        DELETE FROM `risk`
        WHERE project_id = OLD.project_id;
    END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_risk`;
DELIMITER ;;
CREATE TRIGGER `delete_risk` AFTER DELETE ON `risk` FOR EACH ROW BEGIN
        DELETE FROM `followup`
        WHERE risk_id = OLD.risk_id;
    END
;;
DELIMITER ;

DROP TRIGGER IF EXISTS `add_followup`;
DELIMITER ;;
CREATE TRIGGER `add_followup` AFTER INSERT ON `followup` FOR EACH ROW BEGIN
        UPDATE risk
        SET possibility = NEW.possibility,
            impact = NEW.impact,
            threshold = NEW.threshold,
            follower_name = NEW.follower_name,
            description = NEW.description,
            risk_type = NEW.risk_type,
            `status` = NEW.`status`,
            update_time = NEW.update_time
        WHERE risk_id = NEW.risk_id;
    END
;;
DELIMITER ;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('kaimyang', 'PM', '123456', 'eBay');
INSERT INTO `user` VALUES ('gaowei', 'Developer', 'asa', 'eBay');
INSERT INTO `user` VALUES ('zhouweilu', 'PM', 's', 'TaoBao');
INSERT INTO `user` VALUES ('kaimyangfff', 'PM', '123456', 'ebay');

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('123', 'SRM', 'zhouweilu');
INSERT INTO `project` VALUES ('128', 'super', 'kaimyang');

-- ----------------------------
-- Records of risk
-- ----------------------------
INSERT INTO `risk` VALUES ('3', 'High', 'High', 'x', 'kaimyang', 'kaimyang', 'x', 'Quality Risk', 'risk', '2016-11-15 11:47:38', '3', '123');
INSERT INTO `risk` VALUES ('4', 'Low', 'Low', 'x', 'gaowei', 'gaowei', 'x', 'Technical Risk', 'risk', '2016-11-15 11:47:41', '4', '123');
INSERT INTO `risk` VALUES ('5', 'Medium', 'Low', 'x', 'kaimyang', 'gaowei', 'x', 'Legal Risk', 'risk', '2016-11-15 11:47:42', '5', '123');
INSERT INTO `risk` VALUES ('8', 'High', 'High', '', 'kaimyang', 'kaimyang', 'risk1111', 'Quality Risk', 'risk', '2016-11-15 11:47:44', '8', '128');
INSERT INTO `risk` VALUES ('18', 'High', 'High', '', 'gaowei', 'gaowei', 'ddd', 'Quality Risk', 'risk', '2016-11-15 11:47:47', '18', '128');
INSERT INTO `risk` VALUES ('19', 'High', 'High', '', 'gaowei', 'kaimyang', 'sfafas', 'Quality Risk', 'risk', '2016-11-15 11:47:50', '19', '128');
INSERT INTO `risk` VALUES ('20', 'High', 'High', '', 'gaowei', 'kaimyang', 'sfafas', 'Quality Risk', 'risk', '2016-11-15 11:47:50', '19', '128');
INSERT INTO `risk` VALUES ('21', 'High', 'High', '', 'gaowei', 'kaimyang', 'sfafas', 'Quality Risk', 'risk', '2016-11-15 11:47:50', '19', '128');
INSERT INTO `risk` VALUES ('22', 'High', 'High', '', 'gaowei', 'kaimyang', 'sfafas', 'Quality Risk', 'risk', '2016-11-15 11:47:50', '19', '128');
INSERT INTO `risk` VALUES ('23', 'High', 'High', '', 'gaowei', 'kaimyang', 'sfafas', 'Quality Risk', 'risk', '2016-11-15 11:47:50', '4', '128');
INSERT INTO `risk` VALUES ('24', 'High', 'High', '', 'gaowei', 'kaimyang', 'sfafas', 'Quality Risk', 'risk', '2016-11-15 11:47:50', '3', '128');