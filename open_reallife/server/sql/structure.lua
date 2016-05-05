SQL_STRUCTURE = {}


-- TABLE players
SQL_STRUCTURE["players"] = {}
SQL_STRUCTURE["players"]["id"] = {}
SQL_STRUCTURE["players"]["id"]["primarykey"] = true
SQL_STRUCTURE["players"]["id"]["datatype"] = "INT"
SQL_STRUCTURE["players"]["id"]["notnull"] = true
SQL_STRUCTURE["players"]["id"]["autoincrement"] = true

SQL_STRUCTURE["players"]["name"] = {}
SQL_STRUCTURE["players"]["name"]["length"] = 45
SQL_STRUCTURE["players"]["name"]["datatype"] = "VARCHAR"

SQL_STRUCTURE["players"]["password"] = {}
SQL_STRUCTURE["players"]["password"]["length"] = 45
SQL_STRUCTURE["players"]["password"]["datatype"] = "VARCHAR"

SQL_STRUCTURE["players"]["serial"] = {}
SQL_STRUCTURE["players"]["serial"]["length"] = 45
SQL_STRUCTURE["players"]["serial"]["datatype"] = "VARCHAR"
-- TABLE players END

--[[
CREATE TABLE `open_reallife`.`players` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `serial` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
]]
