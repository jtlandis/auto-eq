
-- Reformat all heading text 
function Header(el)
  el.content = pandoc.Emph(el.content)
  return el
end

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
    
unnameCounter = 0
-- adapting from https://github.com/quarto-dev/quarto-cli/blob/56da834f07f5fdfab1e432f11aa3be6b26f4fd2a/src/resources/filters/crossref/equations.lua
function Para(element)
  print(element)
  
  local inlines = element.content
  
  if inlines:find_if(isDisplayMath) == nil then
    return element
  end
  
  if not hasEq(inlines) then
    --inlines:insert(pandoc.Space)
    inlines:insert(pandoc.Str("{#eq-unnamed-" .. unnameCounter .. "}"))
    --print(element)
    unnameCounter = unnameCounter + 1
  end
  
  return element
end