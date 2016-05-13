SQL_MANAGER = {}

SQL_MANAGER.Validate = function()
  local handle = SQL.Query("SELECT TABLE_NAME as name FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_SCHEMA=?", _CONFIG["db.dbname"])
  local result = SQL.Poll(handle, -1)
  local found = {}

  for k,v in pairs(result) do
    if(SQL_STRUCTURE[v["name"]])then
      found[v["name"]] = true
      SQL_MANAGER.ValidateTable(v["name"],SQL_STRUCTURE[v["name"]])
    end
  end

  for k,v in pairs(SQL_STRUCTURE) do
    if not found[k] then
      SQL_MANAGER.CreateTable(k,v)
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

  SQL.Exec(sql)
  Log.PrintSQL("created table", nil, name)
end

SQL_MANAGER.ValidateTable = function(name, structure)
    local shandle = SQL.Query(string.format("SHOW columns FROM `%s`.`%s`", _CONFIG["db.dbname"], name))
    local struc = SQL.Poll(shandle, -1)

    for k,v in pairs(structure) do
      local found;

      for k2,v2 in pairs(struc) do
        if(v2["Field"]==k)then
          found = k2
          break
        end
      end

      if found then
        local updateRequired = false

        if(v["datatype"])then
          if(v["length"])then
            if not (string.lower(struc[found]["Type"]) == string.lower(string.format("%s(%i)", v["datatype"], v["length"]))) then
              updateRequired = true
            end
          else
            local pos = string.find(struc[found]["Type"], "(", 1, true)
            if not string.lower(string.sub(struc[found]["Type"], 0, (#struc[found]["Type"] - pos + 2)*-1)) == string.lower(v["datatype"]) then
              updateRequired = true
            end
          end
        end

        if(v["notnull"])then
          if not struc[found]["Null"]=="NO" then
            updateRequired = true
          end
        else
          if not struc[found]["Null"]=="YES" then
            updateRequired = true
          end
        end

        if updateRequired then
          local sql = string.format("ALTER TABLE `%s`.`%s`", _CONFIG["db.dbname"], name)

          sql = sql..string.format(" CHANGE COLUMN `%s` `%s`", k, k)

          if(v["datatype"])then
              if(v["length"])then
                sql = sql..string.format(" %s(%i)", v["datatype"], v["length"])
              else
                sql = sql..string.format(" %s", v["datatype"])
              end
          end

          if(v["notnull"])then
            sql = sql.." NOT NULL"
          else
            sql = sql.." NULL"
          end

          if(v["autoincrement"])then
            sql = sql.." AUTO_INCREMENT"
          end

          sql = sql..";"

          SQL.Exec(sql)
          Log.PrintSQL("changed field", k, name)
        end
      else
        local sql = string.format("ALTER TABLE `%s`.`%s`", _CONFIG["db.dbname"], name)

        sql = sql..string.format(" ADD COLUMN `%s`", k)

        if(v["datatype"])then
            if(v["length"])then
              sql = sql..string.format(" %s(%i)", v["datatype"], v["length"])
            else
              sql = sql..string.format(" %s", v["datatype"])
            end
        end

        if(v["notnull"])then
          sql = sql.." NOT NULL"
        else
          sql = sql.." NULL"
        end

        if(v["autoincrement"])then
          sql = sql.." AUTO_INCREMENT"
        end

        sql = sql..";"

        SQL.Exec(sql)
        Log.PrintSQL("added field", k, name)
      end
    end
end
