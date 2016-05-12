Translations = {}
Translations.texts = {}

Translations.Init = function()
  Translations.LoadTranslation(_CONFIG["defaultlanguage"])
  GUI.AddAjaxGetHandler("translate", Translations.Translate)
end


Translations.LoadTranslation = function(language)
  Translations.texts = {}

  if not fileExists("files/translations/"..language..".ini") then
    return false
  end
  local file = fileOpen("files/translations/"..language..".ini", true)
  local tmp = fileRead(file, fileGetSize(file))
  local tmp = split(tmp, '\n')

  for k,v in pairs(tmp) do
    local trans = split(v, '=')

    if Translations.texts[trans[1]] then
      outputDebugString("Duplicated translation entry for "..trans[1].." in language "..language)
    else
      Translations.texts[trans[1]] = trans[2]
    end
  end

  fileClose(file)
end

Translations.Translate = function(pharse)
  return Translations.texts[pharse]
end
