DROP TABLE IF EXISTS `USER`;

CREATE TABLE `USER` (
	`user_id`	INT	NOT NULL,
	`name`	VARCHAR(50)	NULL,
	`age`	INT	NULL,
	`gender`	TINYINT(1)	NULL,
	`weight`	FLOAT	NULL,
	`height`	FLOAT	NULL,
	`bmi`	FLOAT	NULL,
	`drinking_status`	TINYINT(1)	NULL,
	`smoking_status`	TINYINT(1)	NULL,
	`obesity_status`	TINYINT(1)	NULL,
	`fatigue_status`	TINYINT(1)	NULL
);

DROP TABLE IF EXISTS `DETAIL`;

CREATE TABLE `DETAIL` (
	`detail_id`	INT	NOT NULL,
	`user_id`	INT	NOT NULL,
	`systolic_bp`	INT	NULL,
	`diastolic_bp`	INT	NULL,
	`heart_rate`	INT	NULL,
	`daily_steps`	INT	NULL,
	`cholesterol_status`	TINYINT(1)	NULL,
	`daily_sleep`	FLOAT	NULL,
	`hypertension_status`	TINYINT(1)	NULL
);

DROP TABLE IF EXISTS `VIDEO`;

CREATE TABLE `VIDEO` (
	`video_id`	INT	NOT NULL,
	`user_id`	INT	NOT NULL,
	`title`	VARCHAR(50)	NULL,
	`video_length`	INT	NULL,
	`viewing_time`	INT	NULL,
	`category`	varchar(20)	NULL
);

DROP TABLE IF EXISTS `TV`;

CREATE TABLE `TV` (
	`iptv_id`	INT	NOT NULL,
	`user_id`	INT	NOT NULL
);

ALTER TABLE `USER` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `DETAIL` ADD CONSTRAINT `PK_DETAIL` PRIMARY KEY (
	`detail_id`,
	`user_id`
);

ALTER TABLE `VIDEO` ADD CONSTRAINT `PK_VIDEO` PRIMARY KEY (
	`video_id`,
	`user_id`
);

ALTER TABLE `TV` ADD CONSTRAINT `PK_TV` PRIMARY KEY (
	`iptv_id`,
	`user_id`
);

ALTER TABLE `DETAIL` ADD CONSTRAINT `FK_USER_TO_DETAIL_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USER` (
	`user_id`
);

ALTER TABLE `VIDEO` ADD CONSTRAINT `FK_USER_TO_VIDEO_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USER` (
	`user_id`
);

ALTER TABLE `TV` ADD CONSTRAINT `FK_USER_TO_TV_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USER` (
	`user_id`
);

