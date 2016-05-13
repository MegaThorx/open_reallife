Random = {}
Random.stringAllowed = { { 48, 57 }, { 65, 90 }, { 97, 122 } }


Random.GenerateString = function(length)
  if tonumber ( length ) then
    math.randomseed ( getTickCount () )

    local str = ""
    for i = 1, length do
      local charlist = Random.stringAllowed[math.random ( 1, 3 )]
      str = str .. string.char ( math.random ( charlist[1], charlist[2] ) )
    end
    return str
  end
  return false
end

Random.GenerateASCIIString = function(length)
	local str = ""
	for i = 1, length do
		str = str..(string.format("%c", math.random(32, 126)))
	end
	return str
end
