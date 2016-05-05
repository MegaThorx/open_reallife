ElementData = {}
local data = {}
local sync = {}

ElementData.Set = function(theElement, key, value, synchronize)
  if not value then
    return ElementData.Delete(theElement, key, value)
  end

  if(synchronize)then
    if not sync[theElement] then
      sync[theElement] = {}
    end

    sync[theElement][key] = synchronize
    setElementData(theElement, key, value, synchronize)
  end

  if not data[theElement] then
    data[theElement] = {}
  end

  data[theElement][key] = value
end

ElementData.Get = function(theElement, key, inherit)
  if not data[theElement] then
    return false
  end

  if not data[theElement][key] then
    return false
  end

  return data[theElement][key]
end

ElementData.Delete = function(theElement, key)
  if not data[theElement] then
    return false
  end

  if not data[theElement][key] then
    return false
  end

  data[theElement][key] = nil

  if #data[theElement]==0 then
    data[theElement] = nil
  end

  if sync[theElement] then
    if sync[theElement][key] then
      sync[theElement][key] = nil
      setElementData(theElement, key, nil, true)
    end

    if #sync[theElement]==0 then
      sync[theElement] = nil
    end
  end

  return true
end
