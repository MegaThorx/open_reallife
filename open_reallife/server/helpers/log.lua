Log = {}
Log.basedir = "logs/"

Log.PrintOld = function(text, dir)
  local newLine = "\n"

  if not(fileExists(Log.basedir..dir.."/"..Time.GetDateShort()..".txt")) then
  	fileCreate(Log.basedir..dir.."/"..Time.GetDateShort()..".txt")
  	newLine = ""
  end

  local file = fileOpen(Log.basedir..dir.."/"..Time.GetDateShort()..".txt")
  fileSetPos(file, fileGetSize(file))
  fileWrite(file, newLine..""..Time.GetTime()..": "..text)

  fileFlush(file)
  fileClose(file)
end

Log.PrintServer = function(text, ...)
  Console.Print(text, ...)
  Log.PrintOld(string.format(text, ...), "server")
end

Log.PrintSQL = function(text, ...)
  Console.Print(text, ...)
  Log.PrintOld(string.format(text, ...), "sql")
end

Log.PrintCheat = function(text, ...)
  Console.Print(text, ...)
  Log.PrintOld(string.format(text, ...), "cheat")
end


Log.Print = function(entry, dir)
  local content = {}
  local file
  if not(fileExists(Log.basedir..dir.."/"..Time.GetDateShort()..".json")) then
  	file = fileCreate(Log.basedir..dir.."/"..Time.GetDateShort()..".json")
  else
    file = fileOpen(Log.basedir..dir.."/"..Time.GetDateShort()..".json")
    content = fromJSON(fileRead(file, fileGetSize(file)))

    fileClose(file)
    fileDelete(Log.basedir..dir.."/"..Time.GetDateShort()..".json")
    file = fileCreate(Log.basedir..dir.."/"..Time.GetDateShort()..".json")
  end

  entry["timestamp"] = Time.GetTimestamp()

  table.insert(content, entry)

  fileSetPos(file, 0)
  fileWrite(file, toJSON(content))

  fileFlush(file)
  fileClose(file)
end

addEventHandler("onDebugMessage", root, function(message, level, file, line)
  Log.Print({["message"] = message, ["level"] = level, ["file"] = file, ["line"] = line, ["traceback"] = Log.Traceback()}, "error")
end)

Log.Traceback = function()
  local level = 4
  local result = {}

  while true do
    local info = debug.getinfo(level, "Sln")
    if not info then break end
    if info.what ~= "C" then
      table.insert(result, {["src"] = info.short_src, ["line"] = info.currentline, ["function"] = info.name})
    end
    level = level + 1
  end

  return result
end
