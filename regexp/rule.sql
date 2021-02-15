/*
Navicat MySQL Data Transfer

Source Server         : REGEXP
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : rule

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-07-13 11:17:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for regular
-- ----------------------------
DROP TABLE IF EXISTS `regular`;
CREATE TABLE `regular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(32) DEFAULT NULL,
  `reg` varchar(360) DEFAULT NULL,
  `warn` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of regular
-- ----------------------------
INSERT INTO `regular` VALUES ('30', 'isZipCode', '/^[0-9]{6}$/', '只能包括中文字、英文字母、数字和下划线');
INSERT INTO `regular` VALUES ('32', 'newPassReg', '/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/', '请输入6－16位数字和英文,区分大小写');
INSERT INTO `regular` VALUES ('33', 'channelIp', '/^(?:(?:[01]?d?d|2[0-4]d|25[0-5]).){3}(?:[01]?d?d|2[0-4]d|25[0-5])$/', 'IP格式错误/i');
INSERT INTO `regular` VALUES ('34', 'channelPort', '/^([1-9]|[1-9]\\d|[1-9]\\d{2}|[1-9]\\d{3}|[1-5]\\d{4}|6[0-4]\\d{3}|65[0-4]\\d{2}|655[0-2]\\d|6553[0-5])$/', '1-65535的整数');
INSERT INTO `regular` VALUES ('35', 'channelNumber', '/^[0-9]*$/', '请输入数字');
INSERT INTO `regular` VALUES ('36', 'number', '/^+?[1-9]d{0,8}$/', '请输入1-9位正整数');
INSERT INTO `regular` VALUES ('37', 'oneNum', '/^+?[1-9]d{0}$/', '请输入1到9之间的正整数');
INSERT INTO `regular` VALUES ('38', 'twoNum', '/^+?[1-9]d{0,1}$/', '不能以0开头的数字');
INSERT INTO `regular` VALUES ('39', 'sendAgin', '/^+?[1-3]d{0,1}$/', '请输入1-3的数字');
INSERT INTO `regular` VALUES ('40', 'threeNum', '/^+?[1-9]d{0,2}$/', '不能以0开头的数字');
INSERT INTO `regular` VALUES ('41', 'threeNumLessThan500', '/^([1-9]d?|[1-4]d{2}?)$/', '不能以0开头且小于500的数字');
INSERT INTO `regular` VALUES ('42', 'threeNumLessThan1000', '/^(?:(?!0{1,3})d{1,3})$/', '不能以0开头且小于1000的数字');
INSERT INTO `regular` VALUES ('43', 'numLessThan500', '/^([1-9]d?|[1-4]d{2}?)$/', '请输入1到499之间的正整数');
INSERT INTO `regular` VALUES ('44', 'numLessThan300', '/^([1-9]d?|[1-2]d{2}?)$/', '不能以0开头且小于300的数字');
INSERT INTO `regular` VALUES ('45', 'numLessThan100', '/^([1-9]d?)$/', '不能以0开头且小于100的数字');
INSERT INTO `regular` VALUES ('46', 'sendAddress', '/^(?:(?:[01]?d?d|2[0-4]d|25[0-5]).){3}(?:[01]?d?d|2[0-4]d|25[0-5]):([1-9]|[1-9]d|[1-9]d{2}|[1-9]d{3}|[1-5]d{4}|6[0-4]d{3}|65[0-4]d{2}|655[0-2]d|6553[0-5])$/', 'IP格式错误');
INSERT INTO `regular` VALUES ('47', 'numLessThanNew1212', '/^(?:(?!0{1,3})d{1,3})$|^1000$/', '大于0小于等于1000的数字');
INSERT INTO `regular` VALUES ('48', 'numLessThanNew1000', '/^[1-9]$|^[1-9]d$|^[1-9]d{2}$|^[1-3]d{3}$|^4000$/', '大于0小于等于4000的数字');
INSERT INTO `regular` VALUES ('49', 'numberLessOrEq2000', '/^[1-9]$|^[1-9]d$|^[1-9]d{2}$|^1d{3}$|^2000$/', '大于0小于等于2000的数字');
INSERT INTO `regular` VALUES ('50', 'readWriteModeValue', '/^(R|W|RW)$/', '请输入R或者W或者RW');
INSERT INTO `regular` VALUES ('51', 'reportErrorCodeReg', '/^+?[1-9]d{0,2}$/', '状态报告错误代码最大为3位正整数');
INSERT INTO `regular` VALUES ('53', 'sixNumber', '/^[0-9]\\d{0,5}$/', '请输入1-6位的数字');
INSERT INTO `regular` VALUES ('54', 'turnNumber', '/^([1-9]d?|100)$/', '请输入1-100的正整数');
INSERT INTO `regular` VALUES ('55', 'basesectionnumber', '/^1[0-9]{2,3}$/', '请输入以1为开头的3或4位正整数');
INSERT INTO `regular` VALUES ('56', 'sectionnumber', '/^1[0-9]{6}$/', '请输入以1为开头的7位正整数');
INSERT INTO `regular` VALUES ('57', 'c_user_name', '/^[a-zA-Z][a-zA-Z0-9]{5,15}$/', '请输入6-16位的大小写字母和数字');
INSERT INTO `regular` VALUES ('58', 'user_name', '/^[a-zA-Z][a-zA-Z0-9]{3,15}$/', '请输入4-16位英文字母和数字，首位不能为数字');
INSERT INTO `regular` VALUES ('59', 'real_name', '/^[u2E80-u9FFFa-zA-Z]+$/', '请输入中文和英文');
INSERT INTO `regular` VALUES ('60', 'userEmail', '/^([a-zA-Z0-9]+[_|\\_|.|-]?)*[u4e00-u9fa5a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\\_|.|-]?)*[a-zA-Z0-9]*[u4e00-u9fa5a-zA-Z0-9]+.[a-zA-Z]*[u4e00-u9fa5a-zA-Z0-9]{2,3}$/', '请输入正确的邮箱');
INSERT INTO `regular` VALUES ('62', 'waringNum', '/^+?[1-9]d{0,9}$/', '请输入1-9位的正整数');
INSERT INTO `regular` VALUES ('63', 'warningNum', '/^+?[1-9]d{0,3}$/', '请输入1-4位的正整数');
INSERT INTO `regular` VALUES ('64', 'drNumber', '/^+?[1-9]d{0,8}$/', '请输入1-9位的正整数');
INSERT INTO `regular` VALUES ('65', 'clientNum', '/^+?[1-9]d{0,7}$/', '请输入1-8位的正整数');
INSERT INTO `regular` VALUES ('66', 'spser', '/^+?[1-9]\\d{0,5}$/', '请输入1-6位的正整数');
INSERT INTO `regular` VALUES ('67', 'serviceCodeReg', '/^[1-9]d{0,30}$/', '最多输入30位正整数');
INSERT INTO `regular` VALUES ('68', 'extendCodeReg', '/^[0-9]d{0,9}$/', '最多输入10位整数');
INSERT INTO `regular` VALUES ('69', 'createNum', '/^(?:[0-9]{1,3}|1000)$/', '生成号码数量必须在1-1000之间');
INSERT INTO `regular` VALUES ('70', 'codeStartNum', '/^[a-zA-Z][a-zA-Z0-9]{3}$/', '请输入3位字母或者数字');
INSERT INTO `regular` VALUES ('71', 'numberMessage', '/^+?[1-9]d{0,8}$/', '请输入1-9位的正整数');
INSERT INTO `regular` VALUES ('72', 'warningThresholdGlobalReg', '/^+?[1-9]d{0,7}$/', '请输入1-8位的正整数');
INSERT INTO `regular` VALUES ('73', 'cNumber', '/^[1-9][0-9]{0,7}$/', '请输入非0开头的1-8位数字');
INSERT INTO `regular` VALUES ('74', 'cName', '/^[u2E80-u9FFF]+$/', '请输入中文');
INSERT INTO `regular` VALUES ('75', 'cuserName', '/^[a-zA-Z][a-zA-Z0-9]{3,15}$/', '请输入4-16位的英文字母和数字,首位不能为数字');
INSERT INTO `regular` VALUES ('76', 'opersign', '/^[u2E80-u9FFFa-zA-Z0-9]{2,8}$/', '请输入2-8位中英文和数字');
INSERT INTO `regular` VALUES ('77', 'newp', '/^[a-zA-Zd+]{6,16}$/', '输入密码不正确');
INSERT INTO `regular` VALUES ('78', 'allroleName', '/^([u4E00-u9FA5]|w)*$/', '角色名不能包含特殊字符');
INSERT INTO `regular` VALUES ('79', 'QQ', '/^[1-9]d{4,10}$/', '请输入正确QQ号');
INSERT INTO `regular` VALUES ('81', 'DBIP', '/^(?:(?:[01]?d?d|2[0-4]d|25[0-5]).){3}(?:[01]?d?d|2[0-4]d|25[0-5])$/', 'IP格式错误/i');
INSERT INTO `regular` VALUES ('83', 'DBnum', '/^+?[1-9]d{0,8}$/', '请输入数字');
INSERT INTO `regular` VALUES ('84', 'interface_code', '/^(d)*$/', '请输入数字');
INSERT INTO `regular` VALUES ('85', 'signExt', '/^.{2,30}$/', '请输入2-30个字符');
INSERT INTO `regular` VALUES ('86', 'extendCodeExt', '/^[0-9]d{1,8}$/', '请输入2-9位的数字');
INSERT INTO `regular` VALUES ('87', 'channelSignExt', '/^[u4E00-u9FA5A-Za-z0-9]{2,20}$/', '请输入除特殊字符外2-20个字符');
INSERT INTO `regular` VALUES ('88', 'signServiceCodeReg', '/^[0-9]\\d{0,6}$/', '请输入1-7位的数字');
INSERT INTO `regular` VALUES ('89', 'serviceCodeNote', '/^[u4E00-u9FA5A-Za-z]+$/', '请输入中英文');
INSERT INTO `regular` VALUES ('90', 'macReg', '/^(([0-9a-fA-F]{1,2}[-|:]){5}[0-9a-fA-F]{1,2},)*([0-9a-fA-F]{1,2}[-|:]){5}[0-9a-fA-F]{1,2}$/', '请输入正确的MAC地址');
INSERT INTO `regular` VALUES ('92', 'agentPlatCode', '/^[a-zA-Z]{3}$/', '请输入3位英文字母');
INSERT INTO `regular` VALUES ('94', 'warningThresholdExg', '/^+?[1-9]d{0,7}$/', '请输入1-8位正整数');
INSERT INTO `regular` VALUES ('95', 'warningTimesExg', '/^+?[1-9]\\d{0,1}$/', '请输入1-2位正整数');
INSERT INTO `regular` VALUES ('96', 'sncorrectExg', '/^+?[1-9]d*$/', '请输入正整数');
INSERT INTO `regular` VALUES ('97', 'sncorrectExg1000', '/^[2-9]$|^[1-9]d$|^[1-9]d{2}$|^1000$/', '2-1000的数字');
INSERT INTO `regular` VALUES ('98', 'reChargeNum', '/^+?[1-9]d{0,8}$/', '请输入1-9位的正整数');
INSERT INTO `regular` VALUES ('100', 'warningThresholdExgTwo', '/^(?!0(.0{1,3})?$)(d(.d{1,3})?|10)$/', '大于0小于等于10的数字支持三位小数');
INSERT INTO `regular` VALUES ('101', 'setIntervalExg', '/^+?[1-9]d$/', '请输入正整数');
INSERT INTO `regular` VALUES ('102', 'pushReportSuccessRateReg', '/^([1-9]d?|100)$/', '请输入1-100的正整数');
INSERT INTO `regular` VALUES ('103', 'pushReportSuccessHourReg', '/^[1-9]$|^[1-3]d$|^40$/', '请输入1-40的正整数');
INSERT INTO `regular` VALUES ('104', 'CHS', '/^[u0391-uFFE5]+$/', '请输入汉字');
INSERT INTO `regular` VALUES ('105', 'NCH', '/^(?!_)[a-zA-Z0-9_?]{5,20}$/', '用户名为不以下划线开头的5-20位英文字母、数字及下划线!');
INSERT INTO `regular` VALUES ('106', 'post', '/^[1-9]d{5}$/', '邮政编码不存在');
INSERT INTO `regular` VALUES ('107', 'QQ', '/^[1-9]d{4,10}$/', 'QQ号码不正确');
INSERT INTO `regular` VALUES ('109', 'offictel', '/^([0-9]{3,4}|[0-9]{3,4}-)?[0-9]{7,8}(-[0-9]{0,4})?$/', '座机号码不正确');
INSERT INTO `regular` VALUES ('110', 'loginName', '/^[u0391-uFFE5w]+$/', '登录名称只允许汉字、英文字母、数字及下划线。');
INSERT INTO `regular` VALUES ('111', 'password', '/((?=.*[a-zA-Z])(?=.*d)|(?=[a-zA-Z])(?=.*[^a-zA-Z0-9])).{8,18}$/', '密码只允许8-18位英文字母+特殊字符或者数字任意一个的组合');
INSERT INTO `regular` VALUES ('112', 'number', '/^d+$/', '数值');
INSERT INTO `regular` VALUES ('113', 'email', '/^[a-zA-Z0-9_+.-]+@([a-zA-Z0-9-]+.)+[a-zA-Z0-9]{2,4}$/', '电子邮箱格式错误/i');
INSERT INTO `regular` VALUES ('114', 'ip', '/^(?:(?:[01]?d?d|2[0-4]d|25[0-5]).){3}(?:[01]?d?d|2[0-4]d|25[0-5])$/', 'IP地址格式不正确/i');
INSERT INTO `regular` VALUES ('115', 'emayip', '/^([a-zA-Z0-9][-a-zA-Z0-9]{0,62}(.[a-zA-Z0-9][-a-zA-Z0-9]{0,62}||(localhost))+.?)$/', 'emay IP地址格式不正确/i');
INSERT INTO `regular` VALUES ('116', 'url', '/(http[s]{0,1}):///', '网址格式错误/i');
INSERT INTO `regular` VALUES ('118', 'basesectionnumber', '/^1[0-9]{2,3}$/', '号码段不正确');
INSERT INTO `regular` VALUES ('119', '用户名', '/^[a-z0-9_-]{3,16}$/', '用户名');
INSERT INTO `regular` VALUES ('120', '密码', '/^[a-z0-9_-]{6,18}$/', '密码');
INSERT INTO `regular` VALUES ('121', '十六进制值', '/^#?([a-f0-9]{6}|[a-f0-9]{3})$/', '十六进制值');
INSERT INTO `regular` VALUES ('122', '电子邮箱', '/^([a-z0-9_.-]+)@([da-z.-]+).([a-z.]{2,6})$/', '电子邮箱');
INSERT INTO `regular` VALUES ('123', '电子邮箱', '/^[a-zd]+(.[a-zd]+)*@([da-z](-[da-z])?)+(.{1,2}[a-z]+)+$/', '电子邮箱');
INSERT INTO `regular` VALUES ('124', 'URL', '/^(https?://)?([da-z.-]+).([a-z.]{2,6})([/w.-]*)*/?$/', 'URL');
INSERT INTO `regular` VALUES ('125', 'IP 地址', '/((2[0-4]d|25[0-5]|[01]?dd?).){3}(2[0-4]d|25[0-5]|[01]?dd?)/', 'IP 地址');
INSERT INTO `regular` VALUES ('126', 'IP 地址', '/^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?).){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/', 'IP 地址');
INSERT INTO `regular` VALUES ('127', 'HTML 标签', '/^<([a-z]+)([^<]+)*(?:>(.*)</1>|s+/>)$/', 'HTML 标签');
INSERT INTO `regular` VALUES ('128', 'Unicode编码中的汉字范围', '/[\\u2E80-\\u9FFF]/', 'Unicode编码中的汉字范围');
INSERT INTO `regular` VALUES ('129', 'Unicode编码中的韩文范围', '/[\\uAC00-\\uD7AF]/', 'Unicode编码中的韩文范围');
INSERT INTO `regular` VALUES ('130', 'Unicode编码中的日文范围', '/[\\u3040-\\u31FF]/', 'Unicode编码中的日文范围');
INSERT INTO `regular` VALUES ('131', '数字', '/^[0-9]*$/', '数字');
INSERT INTO `regular` VALUES ('132', 'n位的数字', '/^d{n}$/', 'n位的数字');
INSERT INTO `regular` VALUES ('133', '至少n位的数字', '/^d{n,}$/', '至少n位的数字');
INSERT INTO `regular` VALUES ('134', 'm-n位的数字', '/^d{m,n}$/', 'm-n位的数字');
INSERT INTO `regular` VALUES ('135', '零和非零开头的数字', '/^(0|[1-9][0-9]*)$/', '零和非零开头的数字');
INSERT INTO `regular` VALUES ('136', '非零开头的最多带两位小数的数字', '/^([1-9][0-9]*)+(.[0-9]{1,2})?$/', '非零开头的最多带两位小数的数字');
INSERT INTO `regular` VALUES ('137', '带1-2位小数的正数或负数', '/^(-)?\\d+(.\\d{1,2})$/', '带1-2位小数的正数或负数');
INSERT INTO `regular` VALUES ('139', '有两位小数的正实数', '/^[0-9]+(.[0-9]{2})?$/', '有两位小数的正实数');
INSERT INTO `regular` VALUES ('140', '有1~3位小数的正实数', '/^[0-9]+(.[0-9]{1,3})?$/', '有1~3位小数的正实数');
INSERT INTO `regular` VALUES ('141', '非零的正整数', '/^[1-9]d*$或^([1-9][0-9]*){1,3}$/', '非零的正整数');
INSERT INTO `regular` VALUES ('142', '非零的正整数', '/^+?[1-9][0-9]*$/', '非零的正整数');
INSERT INTO `regular` VALUES ('143', '非零的负整数', '/^-[1-9][]0-9\"*$/', '非零的负整数');
INSERT INTO `regular` VALUES ('144', '非零的负整数', '/^-[1-9]d*$/', '非零的负整数');
INSERT INTO `regular` VALUES ('145', '非负整数', '/^d+$/', '非负整数');
INSERT INTO `regular` VALUES ('146', '非负整数', '/^[1-9]d*|0$/', '非负整数');
INSERT INTO `regular` VALUES ('147', '非正整数', '/^((-d+)|(0+))$/', '非正整数');
INSERT INTO `regular` VALUES ('148', '非正整数', '/^-[1-9]d*|0$/', '非正整数');
INSERT INTO `regular` VALUES ('149', '非负浮点数', '/^d+(.d+)?$/', '非负浮点数');
INSERT INTO `regular` VALUES ('150', '非负浮点数', '/^[1-9]d*.d*|0.d*[1-9]d*|0?.0+|0$/', '非负浮点数');
INSERT INTO `regular` VALUES ('151', '非正浮点数', '/^((-d+(.d+)?)|(0+(.0+)?))$/', '非正浮点数');
INSERT INTO `regular` VALUES ('152', '非正浮点数', '/^(-([1-9]d*.d*|0.d*[1-9]d*))|0?.0+|0$/', '非正浮点数');
INSERT INTO `regular` VALUES ('153', '正浮点数', '/^[1-9]d*.d*|0.d*[1-9]d*$/', '正浮点数');
INSERT INTO `regular` VALUES ('154', '正浮点数', '/^(([0-9]+.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*.[0-9]+)|([0-9]*[1-9][0-9]*))$/', '正浮点数');
INSERT INTO `regular` VALUES ('155', '负浮点数', '/^-([1-9]d*.d*|0.d*[1-9]d*)$/', '负浮点数');
INSERT INTO `regular` VALUES ('156', '负浮点数', '/^(-(([0-9]+.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*.[0-9]+)|([0-9]*[1-9][0-9]*)))$/', '负浮点数');
INSERT INTO `regular` VALUES ('157', '浮点数', '/^(-?d+)(.d+)?$或^-?([1-9]d*.d*|0.d*[1-9]d*|0?.0+|0)$/', '浮点数');
INSERT INTO `regular` VALUES ('158', '英文和数字', '/^[A-Za-z0-9]+$/', '英文和数字');
INSERT INTO `regular` VALUES ('159', '英文和数字', '/^[A-Za-z0-9]{4,40}$/', '英文和数字');
INSERT INTO `regular` VALUES ('160', '长度为3-20的所有字符', '/^.{3,20}$/', '长度为3-20的所有字符');
INSERT INTO `regular` VALUES ('161', '由26个英文字母组成的字符串', '/^[A-Za-z]+$/', '由26个英文字母组成的字符串');
INSERT INTO `regular` VALUES ('162', '由26个大写英文字母组成的字符串', '/^[A-Z]+$/', '由26个大写英文字母组成的字符串');
INSERT INTO `regular` VALUES ('163', '由26个小写英文字母组成的字符串', '/^[a-z]+$/', '由26个小写英文字母组成的字符串');
INSERT INTO `regular` VALUES ('164', '由数字和26个英文字母组成的字符串', '/^[A-Za-z0-9]+$/', '由数字和26个英文字母组成的字符串');
INSERT INTO `regular` VALUES ('165', '由数字、26个英文字母或者下划线组成的字符串', '/^w+$或^w{3,20}$/', '由数字、26个英文字母或者下划线组成的字符串');
INSERT INTO `regular` VALUES ('166', '中文、英文、数字包括下划线', '/^[u4E00-u9FA5A-Za-z0-9_]+$/', '中文、英文、数字包括下划线');
INSERT INTO `regular` VALUES ('167', '中文、英文、数字但不包括下划线等符号', '/^[u4E00-u9FA5A-Za-z0-9]+$或^[u4E00-u9FA5A-Za-z0-9]{2,20}$/', '中文、英文、数字但不包括下划线等符号');
INSERT INTO `regular` VALUES ('168', '禁止输入含有~的字符', '/[^~x22]+/', '禁止输入含有~的字符');
INSERT INTO `regular` VALUES ('169', 'Email地址', '/^w+([-+.]w+)*@w+([-.]w+)*.w+([-.]w+)*$/', 'Email地址');
INSERT INTO `regular` VALUES ('170', '域名', '/[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(/.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+/.?/', '域名');
INSERT INTO `regular` VALUES ('171', 'InternetURL', '/[a-zA-z]+://[^s]*或^http://([w-]+.)+[w-]+(/[w-./?%&=]*)?$/', 'InternetURL');
INSERT INTO `regular` VALUES ('172', '手机号码', '/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])d{8}$/', '手机号码');
INSERT INTO `regular` VALUES ('173', '电话号码(\"XXX-XXXXXXX\"、\"XXXX-XXXXXXX', '/^((d{3,4}-)|d{3.4}-)?d{7,8}$/', '电话号码(\"XXX-XXXXXXX\"、\"XXXX-XXXXXXXX\"、\"XXX-XXXXXXX\"、\"XXX-XXXXXXXX\"、');
INSERT INTO `regular` VALUES ('174', '国内电话号码(0511-4405222、021-87888822', '/d{3}-d{8}|d{4}-d{7}/', '国内电话号码(0511-4405222、021-87888822)');
INSERT INTO `regular` VALUES ('175', '电话号码正则表达式（支持手机号码，3-4位区号，7-8位直播号码', '/((d{11})|^((d{7,8})|(d{4}|d{3})-(d{7,8})|(d{4}|d{3})-(d{7,8})-(d{4}|d{3}|d{2}|d{1})|(d{7,8})-(d{4}|d{3}|d{2}|d{1}))$)/', '电话号码正则表达式（支持手机号码，3-4位区号，7-8位直播号码，1－4位分机号）');
INSERT INTO `regular` VALUES ('176', '身份证号(15位、18位数字)，最后一位是校验位，可能为数字或字', '/(^d{15}$)|(^d{18}$)|(^d{17}(d|X|x)$)/', '身份证号(15位、18位数字)，最后一位是校验位，可能为数字或字符X');
INSERT INTO `regular` VALUES ('177', '帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)', '/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/', '帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)');
INSERT INTO `regular` VALUES ('178', '密码(以字母开头，长度在6~18之间，只能包含字母、数字和下划线', '/^[a-zA-Z]w{5,17}$/', '密码(以字母开头，长度在6~18之间，只能包含字母、数字和下划线)');
INSERT INTO `regular` VALUES ('179', '强密码(必须包含大小写字母和数字的组合，不能使用特殊字符，长度在', '/^(?=.*d)(?=.*[a-z])(?=.*[A-Z]).{8,10}$/', '强密码(必须包含大小写字母和数字的组合，不能使用特殊字符，长度在8-10之间)');
INSERT INTO `regular` VALUES ('180', '日期格式', '/^d{4}-d{1,2}-d{1,2}/', '日期格式');
INSERT INTO `regular` VALUES ('181', '一年的12个月(01～09和1～12)', '/^(0?[1-9]|1[0-2])$/', '一年的12个月(01～09和1～12)');
INSERT INTO `regular` VALUES ('182', '一个月的31天(01～09和1～31)', '/^((0?[1-9])|((1|2)[0-9])|30|31)$/', '一个月的31天(01～09和1～31)');
INSERT INTO `regular` VALUES ('183', '钱的表现形式', '/^[1-9][0-9]*$/', '\"10000.00\" 和 \"10,000.00\", 和没有 \"分\" 的 \"10000\" 和 \"10,000\"');
INSERT INTO `regular` VALUES ('184', '这表示任意一个不以0开头的数字,但是,这也意味着一个字符\"0\"不', '/^(0|[1-9][0-9]*)$/', '这表示任意一个不以0开头的数字,但是,这也意味着一个字符\"0\"不通过,所以我们采用下面的形式');
INSERT INTO `regular` VALUES ('185', '一个0或者一个不以0开头的数字.我们还可以允许开头有一个负号', '/^(0|-?[1-9][0-9]*)$/', '一个0或者一个不以0开头的数字.我们还可以允许开头有一个负号');
INSERT INTO `regular` VALUES ('186', '表示一个0或者一个可能为负的开头不为0的数字.让用户以0开头好了', '/^[0-9]+(.[0-9]+)?$/', '表示一个0或者一个可能为负的开头不为0的数字.让用户以0开头好了.把负号的也去掉');
INSERT INTO `regular` VALUES ('188', '1到3个数字,后面跟着任意个 逗号+3个数字,逗号成为可选,而不', '/^([0-9]+|[0-9]{1,3}(,[0-9]{3})*)(.[0-9]{1,2})?$/', '1到3个数字,后面跟着任意个 逗号+3个数字,逗号成为可选,而不是必须');
INSERT INTO `regular` VALUES ('189', 'xml文件', '/^([a-zA-Z]+-?)+[a-zA-Z0-9]+\\.[x|X][m|M][l|L]$/', 'xml文件');
INSERT INTO `regular` VALUES ('190', '双字节(包括汉字)', '/[^x00-xff]/', '双字节字符 包括汉字在内，可以用来计算字符串的长度(一个双字节字符长度计2，ASCII字符计1)');
INSERT INTO `regular` VALUES ('191', '空白行的正则表达式', '/\ns*\r/', '空白行的正则表达式');
INSERT INTO `regular` VALUES ('192', 'HTML标记的正则表达式', '/<(S*?)[^>]*>.*?|<.*?/>/', 'HTML标记的正则表达式');
INSERT INTO `regular` VALUES ('193', '腾讯QQ号', '/[1-9][0-9]{4,}/', '腾讯QQ号');
INSERT INTO `regular` VALUES ('194', '中国邮政编码国邮政编码为6位数字)', '/[1-9]d{5}(?!d)/', '中国邮政编码国邮政编码为6位数字)');
INSERT INTO `regular` VALUES ('195', 'IP地址', '/((?:(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d)\\.){3}(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d))/', 'IP地址');
INSERT INTO `regular` VALUES ('196', 'Unicode编码中的俄文范围', '/[\\x0400-\\x052f]/', 'Unicode编码中的俄文范围');
INSERT INTO `regular` VALUES ('197', '3位英文字母', '/^[a-zA-Z]{3}$/', '请输入3位英文字母');
INSERT INTO `regular` VALUES ('198', '固话+区号+座机号码+分机号码', '/^(0[0-9]{2,3}-)?([2-9][0-9]{6,7})+(-[0-9]{1,4})?$/', '区号+座机号码+分机号码');
INSERT INTO `regular` VALUES ('199', '手机号码精准正则', '/^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\\d{8}$/', '手机号码精准正则');
INSERT INTO `regular` VALUES ('200', '400或800电话', '/^[48]0{2}-d{3}-d{4}$/', '400或800');
