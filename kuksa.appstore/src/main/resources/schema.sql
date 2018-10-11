
CREATE TABLE IF NOT EXISTS `app_category` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(200) NOT NULL,
	PRIMARY KEY (`id`)
)
;

CREATE TABLE IF NOT EXISTS `app` (
    `id` bigint(20) NOT NULL auto_increment,
    `name` varchar(200) NOT NULL,
    `hawkbitname` varchar(4000) NOT NULL,
    `description` varchar(4000) NOT NULL,
    `version` varchar(100) NOT NULL,
    `owner` varchar(100) NOT NULL,
    `downloadcount` bigint(20) NOT NULL,
    `publishdate` TIMESTAMP NOT NULL ,
    `appcategory_id` BIGINT(20) NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `FK_appcategory_id` FOREIGN KEY (`appcategory_id`) REFERENCES `app_category` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `user` (
    `id` bigint(20) NOT NULL auto_increment,
    `user_name` varchar(200) NOT NULL,
    `password` varchar(200) NOT NULL,
    `adminuser` BOOLEAN NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS  `usersapps` (
	`userid` BIGINT(20) NOT NULL,
	`appid` BIGINT(20) NOT NULL,
	`status` VARCHAR(50) NULL ,
	`date` TIMESTAMP NULL ,
	PRIMARY KEY (`userid`, `appid`),
	CONSTRAINT `FK_appid_app` FOREIGN KEY (`appid`) REFERENCES `app` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `FK_userid_user` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
)
;