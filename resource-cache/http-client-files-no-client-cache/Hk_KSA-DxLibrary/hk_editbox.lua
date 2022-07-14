function isMouseInPosition ( x, y, width, height )
    if ( not isCursorShowing( ) ) then
        return false
    end
    local sx, sy = guiGetScreenSize ( )
    local cx, cy = getCursorPosition ( )
    local cx, cy = ( cx * sx ), ( cy * sy )
    if ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) then
        return true
    else
        return false
    end
end

---------------------------------


local Edits = {}


local selected = nil
local sp = nil
local a = 100
local tick

local defaultFont = "default-bold"
local defaultScale = 1
local lineSize = 2

addEvent("onClientDXMouseEnter", true)
addEvent("onClientDXMouseLeave", true)
addEvent("onClientDXCharacter", true)
addEvent("onClientDXClick", true)
addEvent("onClientDXFocus", true)
addEvent("onClientDXBlur", true)

local hkFont = dxCreateFont("hk_editbox_files/hkfont.ttf", 12)


addEventHandler("onClientRender", root,
function ()
  for k,v in pairs(Edits) do
    if v.visible then
      local br, bg, bb, ba = unpack(v.bcolor)
      local tr, tg, tb, ta = unpack(v.tcolor)
    --  dxDrawImage(v.x+v.w-v.h*0.5, v.y+(v.h*0.5/2), v.h*0.5, v.h*0.5, v.icon, 0, 0, 0, tocolor(br, bg, bb, ba), true)
     -- dxDrawRectangle(v.x, v.y+v.h-(v.h*0.05), v.w, v.h*0.05, tocolor(br, bg, bb, ba), true)
      if v.text ~= "" then
        txt = v.masked and string.rep("#",string.len(v.text)) or v.text
      else
        txt = v.cache
        ta = ta/2
      end
      dxDrawText(" "..txt, v.x-(v.h*0.5)-8, v.y+5, v.x + v.w-(v.h*0.5)-8, v.y + v.h, tocolor(255, 255, 255, 200), v.scale, v.font, "right", "center", false, false, true, false, true)
    end
  end
end)


addEventHandler("onClientRender", root,
function()
  if selected and Edits[selected].visible then
    tick = tick or getTickCount()
    if (getTickCount() - tick)>=500 then
      if a == 0 then a = 180 else a = 0 end
      tick = getTickCount()
    end
    if bs and (getTickCount() - bs)>=20 then
      backspace()
      bs = getTickCount()
    end
    if lm and (getTickCount() - lm)>=20 then
      -- arrowLeft()
      lm = getTickCount()
    end
    if rm and (getTickCount() - rm)>=20 then
      -- arrowRight()
      rm = getTickCount()
    end
    local x = Edits[selected].x
    local y = Edits[selected].y
    local w = Edits[selected].w
    local h = Edits[selected].h
    
    -- guiSetText(EditBoxs[SelectedEdit].label, string.sub(EditBoxs[SelectedEdit].text,0,sp) )
    local txt = Edits[selected].masked and string.rep("#",string.len(Edits[selected].text)) or Edits[selected].text
    local fontW = dxGetTextWidth ( " "..string.sub(txt,0,sp), Edits[selected].scale,Edits[selected].font)
    local fontH = dxGetFontHeight ( Edits[selected].scale, Edits[selected].font)
    -- guiSetText(EditBoxs[SelectedEdit].label, EditBoxs[SelectedEdit].text )
    --if fontW > w-5 then fontW = w-10 end
    -- local a = (h-fontH)/2
    -- dxDrawLine(x+fontW+35, y+5, x+fontW+35 , y+h-5, tocolor(255, 255, 255, a), 2, true)
  end
end
)

function hkCreateEdit( id, x, y, w, h, cache,icon)

  Edits[id] = {}

  Edits[id].id = id
  Edits[id].x = x
  Edits[id].y = y
  Edits[id].w = w
  Edits[id].h = h
  Edits[id].text = ""
  Edits[id].cache = cache or ""
 -- Edits[id].icon = icon or "hk_editbox_files/hk_user.png" 
 
  Edits[id].bcolor = {75, 255, 0,100}
  Edits[id].tcolor = {255,255,255,100}
  Edits[id].font = hkFont
  Edits[id].scale = defaultScale

  Edits[id].enable = true
  Edits[id].visible = true
  Edits[id].masked = false

end

local hover = false



addEventHandler("onClientCursorMove", root,
function ( x, y )
  --outputChatBox("z")
  local hid = false
  for k,v in pairs(Edits) do
    if v.visible then
      if isMouseInPosition(v.x, v.y, v.w, v.h) then
        hid = v.id
      end
    end
  end
  if (not hover) and hid then
    triggerEvent("onClientDXMouseEnter", root, hid)
    hover = hid
  elseif (hover) and (not hid) then
      triggerEvent("onClientDXMouseLeave", root, hover)
      hover = false
  elseif hover and hid and (hover ~= hid) then
    triggerEvent("onClientDXMouseLeave", root, hover)
    triggerEvent("onClientDXMouseEnter", root, hid)
    hover = hid
  end
end
)

addEventHandler("onClientClick", root,
function ( _,state )

  --if selected and selected ~= hover then dxSetAlpha( selected, 200 ) end
  if hover then
    triggerEvent("onClientDXClick", root, hover, selected)
    if selected then
      if selected ~= hover then
        triggerEvent("onClientDXFocus", root, hover)
        triggerEvent("onClientDXBlur", root, selected)
      end
    else
        triggerEvent("onClientDXFocus", root, hover)
    end
    selected = hover
    sp = string.len(Edits[selected].text)
    resetline()
  elseif selected then
    triggerEvent("onClientDXBlur", root, selected)
    selected = nil
  end
end)



local char = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
"1","2","3","4","5","6","7","8","9","-","/","*","+","0",".","@","`", "'","\"",",",":",">","<","?","#","$","%","^","&","(",")","_","[","]","{","}"," "}

addEventHandler("onClientCharacter", root,
function(c)
  if selected then
    for i,v in ipairs(char) do
      if c == v then
        local txt = hkGetEditText(selected)
        if dxGetTextWidth ( " "..txt, Edits[selected].scale,Edits[selected].font ) < Edits[selected].w-5 then
          local stat = triggerEvent("onClientDXCharacter", localPlayer, selected, c)
          if not stat then return end

          txt = string.sub(txt,0,sp)..c..string.sub(txt,sp+1,string.len(txt))
          -- hkSetEditText(SelectedEdit, txt..c)
          hkSetEditText(selected, txt)
          sp = sp + 1
          resetline()
      end
      break
    end
    end
  end
end)


function backspace()
  if selected then
    if sp > 0 then
      --local stat = triggerEvent("onClientdxCharacter", localPlayer, selected, " ")
      --if not stat then
      --  hkSetEditText(selected, txt)
      --  return
      --end
      local txt = hkGetEditText(selected)
      hkSetEditText(selected, string.sub(txt, 1, sp-1)..""..string.sub(txt, sp+1,string.len(txt)))
      sp = sp - 1
      resetline()
      
    end
  end
end

-- function arrowLeft()
  -- if sp > 0 then
    -- sp = sp - 1
  -- end
  -- resetline()
-- end

-- function arrowRight()
  -- if sp < string.len(Edits[selected].text) then
    -- sp = sp + 1
  -- end
  -- resetline()
-- end


local BSTimer = false
local ALTimer = false
local ARTimer = false


addEventHandler("onClientKey", root,
  function ( button, press )
    if button == "backspace" then
      if press then
          backspace()
          BSTimer = setTimer(
        function()
          bs = getTickCount()
        end,500,1)
      else
        if isTimer(BSTimer) then killTimer(BSTimer) end
        bs = nil
      end
    elseif button == "arrow_l" then
        if press then
          -- arrowLeft()
          ALTimer = setTimer(
          function()
            lm = getTickCount()
          end,500,1)
        else
          if isTimer(ALTimer) then killTimer(ALTimer) end
          lm = nil
        end
    elseif button == "arrow_r" then
          if press then
            -- arrowRight()
            ARTimer = setTimer(
            function()
              rm = getTickCount()
            end,500,1)
          else
            if isTimer(ARTimer) then killTimer(ARTimer) end
            rm = nil
          end   
    end
  end)







function resetline()
  a = 100
  tick = getTickCount()
end







function hkSetVisible( edit, state)
  Edits[edit].visible = state 
end


function hkGetEditText( edit )
  return Edits[edit].text
end

function hkSetEditText( edit, text)
  Edits[edit].text = text
end

function hkSetBackgroundAlpha( id, alpha )
  local br, bg, bb = unpack(Edits[id].bcolor)
  Edits[id].bcolor = {br, bg, bb, alpha}
end

function hkSetBackgroundColor(id, br, bg, bb)
  local _,_,_,alpha = unpack(Edits[id].bcolor)
  Edits[id].bcolor = {br, bg, bb, alpha}
end

function hkSetTextAlpha( id, alpha )
  local tr, tg, tb = unpack(Edits[id].tcolor)
  Edits[id].tcolor = {tr, tg, tb, alpha}
end

function hkSetTextColor(id, tr, tg, tb)
  local _,_,_,alpha = unpack(Edits[id].tcolor)
  Edits[id].tcolor = {tr, tg, tb, alpha}
end

function hkSetMasked( edit, state ) 
  Edits[edit].masked = state
end


addEventHandler("onClientDXMouseEnter", root,
function ( id )
if selected ~= id then   
  hkSetBackgroundAlpha( id, 155 )
  end
end)

addEventHandler("onClientDXMouseLeave", root,
function ( id ) 
  if selected ~= id then
    hkSetBackgroundAlpha( id, 100 )
  end
end)


addEventHandler("onClientDXFocus", root,
function ( id )
  hkSetBackgroundAlpha( id, 200 )
  hkSetBackgroundColor( id, 75, 255, 0 )
end)

addEventHandler("onClientDXBlur", root,
function ( id )
  hkSetBackgroundAlpha( id, 100 )
  hkSetBackgroundColor( id, 75, 255, 0 )
end)
