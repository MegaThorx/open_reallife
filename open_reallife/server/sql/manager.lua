SQL_MANAGER = {}

SQL_MANAGER.Validate = function()
  -- SHOW TABLES LIKE players

  for k,v in pairs(SQL_STRUCTURE) do
    local handle = SQL.Query("SHOW TABLES LIKE ?", k)
    local result = SQL.Poll(handle, 10)

    if(#result==0)then
      SQL_MANAGER.CreateTable(k,v)
    else
      SQL_MANAGER.ValidateTable(k,v)
    end

    for k2,v2 in pairs(result) do
        Console.Print("%s:%s", tostring(k2), tostring(v2))
        if(type(v2)=="table")then
          for k3,v3 in pairs(v2) do
              Console.Print("%s:%s", tostring(k3), tostring(v3))
          end
        end
    end
  end
end

SQL_MANAGER.CreateTable = function(name, structure)
  local sql = string.format("CREATE TABLE `%s`.`%s` (", _CONFIG["db.dbname"], name)

  local first = true
  local primarykey

  for k,v in pairs(structure) do
    local qr = string.format(" `%s`", k)

    if not first then
      qr = ", "..qr
    end
    first = false

    if(v["datatype"])then
        if(v["length"])then
          qr = qr..string.format(" %s(%i)", v["datatype"], v["length"])
        else
          qr = qr..string.format(" %s", v["datatype"])
        end
    end

    if(v["notnull"])then
      qr = qr.." NOT NULL"
    else
      qr = qr.." NULL"
    end

    if(v["autoincrement"])then
      qr = qr.." AUTO_INCREMENT"
    end

    if(v["primarykey"])then
      primarykey = k
    end

    sql = sql..qr
  end

  if primarykey then
    sql = sql..string.format(", PRIMARY KEY (`%s`)", primarykey)
  end

  sql = sql..");"

  Log.PrintServer(sql)
end

SQL_MANAGER.ValidateTable = function(name, structure)

end
