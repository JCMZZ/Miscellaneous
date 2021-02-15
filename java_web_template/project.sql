CREATE TABLE `auth_navigation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `l_index` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert  into `auth_navigation`(`id`,`l_index`,`name`) values (1,1,'系统管理');


CREATE TABLE `auth_oper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `auth_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `l_index` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_auth_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert  into `auth_oper`(`id`,`auth_code`,`l_index`,`name`,`page_auth_id`) values (1,'ADD_USER',1,'新增用户',1),(2,'OPER_USER',2,'停用/启用用户',1),(3,'EDIT_USER',3,'编辑用户',1),(4,'DELETE_USER',4,'删除用户',1),(5,'ADD_ROLE',5,'新增角色',2),(6,'EDIT_ROLE',6,'编辑角色',2),(7,'DELETE_ROLE',7,'删除角色',2);


CREATE TABLE `auth_page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `auth_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `l_index` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `navigation_id` bigint(20) DEFAULT NULL,
  `page_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert  into `auth_page`(`id`,`auth_code`,`l_index`,`name`,`navigation_id`,`page_url`) values (1,'USER',1,'用户管理',1,'/user'),(2,'ROLE',2,'角色管理',1,'/role');


CREATE TABLE `auth_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert  into `auth_role`(`id`,`create_time`,`is_delete`,`name`) values (1,'2015-08-14 15:05:31',0,'超级管理员');


CREATE TABLE `auth_role_auth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `auth_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert  into `auth_role_auth`(`id`,`auth_id`,`role_id`,`type`) values (1,1,1,'PAGE'),(2,2,1,'PAGE'),(3,1,1,'OPER'),(4,2,1,'OPER'),(5,3,1,'OPER'),(6,4,1,'OPER'),(7,5,1,'OPER'),(8,6,1,'OPER'),(9,7,1,'OPER');


CREATE TABLE `auth_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert  into `auth_user_role`(`id`,`role_id`,`user_id`) values (1,1,1);


CREATE TABLE `emay_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` bigint(20) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_state` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert  into `emay_user`(`id`,`create_time`,`create_user_id`,`email`,`mobile`,`nickname`,`password`,`user_state`,`username`) values (1,'2015-08-14 13:29:47',NULL,'admin@emay.cn','11111111111','总管','c3284d0f94606de1fd2af172aba15bf3',2,'admin');
