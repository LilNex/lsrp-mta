local sx,sy      = guiGetScreenSize()
local font 	 	 = dxCreateFont(":Hk_KSA-DxLibrary/hk_fonts/hkfontMed.ttf", 10)
local state 	 = true

local right_anim = {}
local left_anim  = {}
local info 		 = {}

-- addCommandHandler("add", function(a,tip)
	-- local slot = getFreeSlot()
	-- if not slot then return end
	-- info[slot] = {msg = "Igen de nem mivel soha de neha!", type = tip, tickStart = getTickCount(), alpha = 125, timeToShow = 5000}
	-- right_anim[slot] = - 300
	-- left_anim[slot] = false
-- end)

function getFreeSlot()
	if not info[1] then return 1 end
	if not info[2] then return 2 end
	if not info[3] then return 3 end
	if not info[4] then return 4 end
	if not info[5] then return 5 end
	if not info[6] then return 6 end
	return false
end

function drawInfobox()
	for k, v in ipairs(info) do
		if info[k] then
			local x = 0
			if right_anim[k] then
				if right_anim[k] < 0 then
					right_anim[k] = right_anim[k] + 10
				end
				if v.tickStart + v.timeToShow < getTickCount() then
					left_anim[k] = right_anim[k]
					right_anim[k] = nil
				end
				x = right_anim[k]
			end
			if left_anim[k] then
				if left_anim[k] > -300 then
					left_anim[k] = left_anim[k] - 10
				end
				if left_anim[k] == -300 then
					left_anim[k] = nil
					info[k] = false
				end
				x = left_anim[k]
			end
			local w = dxGetTextWidth(removeHex(v.msg), 1, "defaults")
			roundedRectangle((tonumber(x) or - 400) - 5, 300 + k * 40, w + 45, 35, tocolor(0, 0, 0, v.alpha), true)
			dxDrawImage((tonumber(x) or - 400), 300 + k * 40, 35, 35, "types/" .. v.type .. ".png", 0, 0, 0, tocolor(75, 255, 0, 155), true)			
			dxDrawText(v.msg, (tonumber(x) or - 400) + 35, 300 + k * 40, 300, 35 + 300 + k * 40, tocolor(255,255,255,255), 1, font, "left", "center", false, false, true, true)
		end
	end
end
addEventHandler("onClientRender", root, drawInfobox)

function show_box(message, tip, timeToShow)
	if not tip then tip = "info" end
	if not timeToShow then timeS = 5000 else timeS = timeToShow end
	local slot = getFreeSlot()
	if not slot then return end
	info[slot] = {msg = message, type = tip, tickStart = getTickCount(), alpha = 125, timeToShow = timeS}
	right_anim[slot] = - 300
	left_anim[slot] = false
	playSound("types/success.mp3")
end
addEvent("Info->box_KSA", true)
addEventHandler("Info->box_KSA", getRootElement(), show_box)

function removeHex (text)
    return type(text)=="string" and string.gsub(text, "#%x%x%x%x%x%x", "") or text
end

function roundedRectangle(x, y, w, h, borderColor, postGUI, bgColor )
    if (x and y and w and h) then
        if (not borderColor) then
            borderColor = tocolor(0, 0, 0, 200);
        end
        
        if (not bgColor) then
            bgColor = borderColor;
        end
        
        --> Background
        dxDrawRectangle(x, y, w, h, bgColor, true);
        
        --> Border
        dxDrawRectangle(x + 2, y - 1, w - 4, 1, borderColor, true); -- top
        dxDrawRectangle(x + 2, y + h, w - 4, 1, borderColor, true); -- bottom
        dxDrawRectangle(x - 1, y + 2, 1, h - 4, borderColor, true); -- left
        dxDrawRectangle(x + w, y + 2, 1, h - 4, borderColor, true); -- right
    end
end