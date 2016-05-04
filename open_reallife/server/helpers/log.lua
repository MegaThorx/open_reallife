Log = {}

Log.Print = function(text, dir)
  local newLine = "\n"

  if not(fileExists(dir..Time.GetDateShort()..".txt")) then
  	fileCreate(dir..Time.GetDateShort()..".txt")
  	newLine = ""
  end

  local file = fileOpen(dir..Time.GetDateShort()..".txt")
  fileSetPos(file, fileGetSize(file))
  fileWrite(file, newLine..""..Time.GetTime()..": "..text)

  fileFlush(file)
  fileClose(file)
end

Log.PrintError = function(text, ...)
  Log.Print(string.format(text, ...), "logs/error/")
end

Log.PrintServer = function(text, ...)
  Console.Print(text, ...)
  Log.Print(string.format(text, ...), "logs/server/")
end
