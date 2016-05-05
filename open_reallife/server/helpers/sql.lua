SQL = {}

SQL.Connect = function()
  local host = "host=".._CONFIG["db.host"]
  local options = ""

  if(_CONFIG["db.port"])then
    host = host..";port=".._CONFIG["db.port"]
  end

  if(_CONFIG["db.dbname"])then
    host = host..";dbname=".._CONFIG["db.dbname"]
  end

  if(_CONFIG["db.autoreconnect"])then
     if not options=="" then
       options = options..";"
     end
     options = options.."autoreconnect=1"
  end

  if(_CONFIG["db.charset"])then
     if not options=="" then
       options = options..";"
     end
     options = options.."autoreconnect=".._CONFIG["db.charset"]
  end

  SQL.connection = dbConnect(_CONFIG["db.type"], host, _CONFIG["db.username"], _CONFIG["db.password"], options)

  if(SQL.connection)then
    return true
  end

  return false
end

SQL.Query = function(query, ...)
  return dbQuery(SQL.connection, query, ...)
end

SQL.Poll = function(queryHandle, timeout, multipleResults)
  return dbPoll(queryHandle, timeout, multipleResults)
end

SQL.Free = function(queryHandle)
  return dbFree(queryHandle)
end

SQL.Exec = function(query, ...)
  return dbExec(SQL.connection, query, ...)
end
