使用模版前，必读！

一、系统介绍
	系统后端采用springMVC+Hibernate+Spring框架，前端采用jquery框架；
	系统提供丰富的注入redis缓存,hibernate通用dao等各种常用util,前端table框架等工具方便您的开发；
	
二、使用配置
	1、首先请更改项目名称，以下几个地方需要修改：
		1) 项目文件夹名，从emay-project-web修改成您自己的项目名；
		2) pom.xml文件，将artifactId修改成您自己的项目名；
					   将build.finalName修改成您自己希望的部署名；
		3) web.xml文件，将display-name修改成您自己的项目名；
	2、创建数据库，并执行project.sql，导入初始化数据；在datasource.properties中修改您的数据库信息；
	3、log4j.properties,redis.properties文件中的PROJECT字样，都需要您改成自己项目的标识；
	4、其他扩展，请自行参考相关技术文档；

三、系统使用
	1、系统默认账号密码：admin/admin；