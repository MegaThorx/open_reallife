HTML = {}

HTML.Decode = function(str)
  if not str then return nil end
  
  str = string.gsub (str, "+", " ")
  str = string.gsub (str, "%%(%x%x)", function(h) return string.char(tonumber(h,16)) end)
  return str
end
