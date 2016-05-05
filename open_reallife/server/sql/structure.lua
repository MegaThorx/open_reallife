SQL_STRUCTURE = {}


-- TABLE players
SQL_STRUCTURE["players"] = {}
SQL_STRUCTURE["players"]["id"] = {}
SQL_STRUCTURE["players"]["id"]["primarykey"] = true
SQL_STRUCTURE["players"]["id"]["datatype"] = "INT"
SQL_STRUCTURE["players"]["id"]["notnull"] = true
SQL_STRUCTURE["players"]["id"]["autoincrement"] = true

SQL_STRUCTURE["players"]["name"] = {}
SQL_STRUCTURE["players"]["name"]["length"] = 22
SQL_STRUCTURE["players"]["name"]["datatype"] = "VARCHAR"

SQL_STRUCTURE["players"]["displayname"] = {}
SQL_STRUCTURE["players"]["displayname"]["length"] = 32
SQL_STRUCTURE["players"]["displayname"]["datatype"] = "VARCHAR"

SQL_STRUCTURE["players"]["password"] = {}
SQL_STRUCTURE["players"]["password"]["length"] = 64
SQL_STRUCTURE["players"]["password"]["datatype"] = "VARCHAR"

SQL_STRUCTURE["players"]["serial"] = {}
SQL_STRUCTURE["players"]["serial"]["length"] = 32
SQL_STRUCTURE["players"]["serial"]["datatype"] = "VARCHAR"

SQL_STRUCTURE["players"]["bank"] = {}
SQL_STRUCTURE["players"]["bank"]["datatype"] = "BIGINT"

SQL_STRUCTURE["players"]["money"] = {}
SQL_STRUCTURE["players"]["money"]["datatype"] = "BIGINT"
-- TABLE players END

--[[
CREATE TABLE `open_reallife`.`players` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `serial` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
]]

--[[
ALTER TABLE `open_reallife`.`players`
ADD COLUMN `money` BIGINT NULL AFTER `password`;
]]

--[[
ALTER TABLE `open_reallife`.`players`
CHANGE COLUMN `password` `password` VARCHAR(32) NULL DEFAULT NULL ;
]]
