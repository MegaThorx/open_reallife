SQL_STRUCTURE = {}


-- TABLE accounts
SQL_STRUCTURE["accounts"] = {
  ["id"] = {
    ["primarykey"] = true,
    ["datatype"] = "INT",
    ["notnull"] = true,
    ["autoincrement"] = true,
  },
  ["username"] = {
    ["datatype"] = "VARCHAR",
    ["length"] = 32,
  },
  ["password"] = {
    ["datatype"] = "VARCHAR",
    ["length"] = 64,
  },
  ["email"] = {
    ["datatype"] = "VARCHAR",
    ["length"] = 64,
  },
  ["salt"] = {
    ["datatype"] = "VARCHAR",
    ["length"] = 8,
  },
  ["serial"] = {
    ["datatype"] = "VARCHAR",
    ["length"] = 32,
  }
}

-- TABLE characters
SQL_STRUCTURE["characters"] = {
  ["id"] = {
    ["primarykey"] = true,
    ["datatype"] = "INT",
    ["notnull"] = true,
    ["autoincrement"] = true
  },
  ["account"] = {
    ["datatype"] = "INT"
  },
  ["firstname"] = {
    ["datatype"] = "VARCHAR",
    ["length"] = 32,
  },
  ["lastname"] = {
    ["datatype"] = "VARCHAR",
    ["length"] = 32,
  },
  ["age"] = {
    ["datatype"] = "INT"
  },
  ["money"] = {
    ["datatype"] = "BIGINT"
  }
}
