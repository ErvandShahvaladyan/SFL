CREATE DATABASE IF NOT EXISTS sfl;
USE sfl;
--
-- Table structure for table user
--
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id         INT(11) NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(255)     DEFAULT NULL,
  last_name  VARCHAR(255)     DEFAULT NULL,
  email      VARCHAR(255)     DEFAULT NULL,
  password   VARCHAR(255)     DEFAULT NULL,
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8;
SET FOREIGN_KEY_CHECKS = 1;
--
-- Table structure for table role
--
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS roles;
CREATE TABLE roles (
  id   INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255)     DEFAULT NULL,
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8;
SET FOREIGN_KEY_CHECKS = 1;
--
-- Dumping data for table role
--
LOCK TABLES roles WRITE;
INSERT INTO roles VALUES (1, 'ROLE_USER');
UNLOCK TABLES;

--
-- Table structure for table user_roles
--
DROP TABLE IF EXISTS user_roles;
CREATE TABLE user_roles(
  user_id INT(11) NOT NULL ,
  role_id INT(11) NOT NULL ,
  PRIMARY KEY (user_id,role_id),
  KEY fk_user_role_roleid_idx (role_id),
  CONSTRAINT fk_user_role_roleid FOREIGN KEY (role_id) REFERENCES roles (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_user_role_userid FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;




DROP TABLE IF EXISTS catalog;
CREATE TABLE catalog (
  id         INT(11)      NOT NULL AUTO_INCREMENT,
  user_id    INT(11)      NOT NULL,
  link       VARCHAR(100) NOT NULL,
  comment    VARCHAR(100) NOT NULL,
  type       VARCHAR(100) NOT NULL,
  insertDate DATE                  DEFAULT NULL,
  content    LONGBLOB     NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_catalog FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
