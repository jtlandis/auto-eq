
--print("Starting auto-eq.lua")

function isDisplayMath(el)
  return el.t == "Math" and el.mathtype == "DisplayMath"
end


function hasEq(el)
  
  for i, e in ipairs(el) do
    if e.t == "Str" then
      return true
    end
  end

  return false
  
end

function removeNoEq(el)
  
  for i, e in ipairs(el) do
    if e.t == "Str" and e.text == "{#no-eq}" then
      el.remove(el, i)
    end
  end
  
  return el
end
    
unnameCounter = 0
-- adapting from https://github.com/quarto-dev/quarto-cli/blob/56da834f07f5fdfab1e432f11aa3be6b26f4fd2a/src/resources/filters/crossref/equations.lua

-- ^ they also have a function set for Plain group as well
--   Maybe I should add this function for this group too?
function Para(element)
  
  local inlines = element.content
  
  if inlines:find_if(isDisplayMath) == nil then
    return element
  end
  
  --print(element)
  
  if not hasEq(inlines) then
    inlines:insert(pandoc.Str("{#eq-unnamed-" .. unnameCounter .. "}"))
    unnameCounter = unnameCounter + 1
    return element
  else
    removeNoEq(inlines)
  end
  
  
  return element
end