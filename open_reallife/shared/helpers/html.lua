HTML = {}

HTML.Decode = function(str)
   str = string.gsub (str, "+", " ")
   str = string.gsub (str, "%%(%x%x)", function(h) return string.char(tonumber(h,16)) end)
   return str
end
