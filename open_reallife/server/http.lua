HTTP = {}

HTTP.GetErrorLog = function()
  local start = getTickCount()
  local content = {}
  local result = {}
  local file
  if fileExists(Log.basedir.."error".."/"..Time.GetDateShort()..".json") then
    file = fileOpen(Log.basedir.."error".."/"..Time.GetDateShort()..".json", true)
    content = fileRead(file, fileGetSize(file))
    result.data = fromJSON(content)
    fileClose(file)
  end

  local diff = getTickCount() - start
  return result
end

HTTPGetErrorLog = HTTP.GetErrorLog
