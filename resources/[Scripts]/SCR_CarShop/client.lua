-- @denetim

local screenW, screenH = guiGetScreenSize()
local x, y = (screenW/1366), (screenH/768)
local page = nil
Veiculo = {}
local isInShop = false
local pickupId = 1274
local positions = {
    ["enter"] = {1780.34765625, -1692.7802734375, 13.65625},
}
local dim = getElementData(localPlayer,"account:character:id")

local components = { "weapon", "ammo", "health", "clock", "money", "breath", "armour", "wanted", "radar" }
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()),
function ()
	for _, component in ipairs( components ) do
		setPlayerHudComponentVisible( component, false )
	end
    local pickup = createPickup(tonumber(positions["enter"][1]), tonumber(positions["enter"][2]), tonumber(positions["enter"][3]), 3, tonumber(pickupId))
    setElementData(pickup, "VehicleShop->enter", true)
end)
addEventHandler("onClientPickupHit", getRootElement(),
    function(hitElement, dim)
        if hitElement == localPlayer and dim and getElementData(source, "VehicleShop->enter") then
            if isInShop then return end
            startClient()
        end
    end 
)

function clientSide()
    page = "Los Santos RP  | Shop"
    roundedRectangle(screenW * 0.7725, screenH * 0.1978, screenW * 0.2181, screenH * 0.7189, tocolor(0, 0, 0, 148),tocolor(0, 0, 0, 148), false)
    roundedRectangle(screenW * 0.7725, screenH * 0.1978, screenW * 0.2181, screenH * 0.1578, tocolor(0, 0, 0, 148),tocolor(0, 0, 0, 148), false)
    dxDrawImage(screenW * 0.831, screenH * 0.18, screenW * 0.1,  screenW * 0.1, "images/logo.png", 0, 0, 0, tocolor(255,255,255, 255), false)

    if isCursorOnElement(screenW * 0.7788, screenH * 0.8567, screenW * 0.10065, screenH * 0.0522) then
        dxDrawImage(screenW * 0.7788, screenH * 0.8567, screenW * 0.10065, screenH * 0.0522, "images/botao.png", 0, 0, 0, tocolor(254, 216, 2, 255), false)
    else
        dxDrawImage(screenW * 0.7788, screenH * 0.8567, screenW * 0.10065, screenH * 0.0522, "images/botao.png", 0, 0, 0, tocolor(254, 216, 2, 120), false)
    end

    if isCursorOnElement(screenW * 0.8850, screenH * 0.8567, screenW * 0.10065, screenH * 0.0522) then
        dxDrawImage(screenW * 0.8850, screenH * 0.8567, screenW * 0.10065, screenH * 0.0522, "images/botao1.png", 0, 0, 0, tocolor(254, 216, 2, 255), false)
    else
        dxDrawImage(screenW * 0.8850, screenH * 0.8567, screenW * 0.10065, screenH * 0.0522, "images/botao1.png", 0, 0, 0, tocolor(254, 216, 2, 120), false)
    end

    --dxDrawText("Buy", screenW * 0.9, screenH * 0.8667, screenW * 0.9800, screenH * 0.8989, tocolor(255, 255, 255, 255), 1.00, exports.fonts:getFont('Roboto',11), "center", "center", false, false, false, false, false)
    --dxDrawText("Close", screenW * 0.8930, screenH * 0.8667, screenW * 0.9800, screenH * 0.8989, tocolor(255, 255, 255, 255), 1.00, exports.fonts:getFont('Roboto',11), "center", "center", false, false, false, false, false)
end

function roundedRectangle(x, y, w, h, borderColor, bgColor, postGUI)
	if (x and y and w and h) then
		if (not borderColor) then
			borderColor = tocolor(24,24,24, 180)
		end
		if (not bgColor) then
			bgColor = borderColor
		end
		dxDrawRectangle(x, y, w, h, bgColor, postGUI);
		dxDrawRectangle(x + 2, y - 1, w - 4, 1, borderColor, postGUI);
		dxDrawRectangle(x + 2, y + h, w - 4, 1, borderColor, postGUI);
		dxDrawRectangle(x - 1, y + 2, 1, h - 4, borderColor, postGUI);
		dxDrawRectangle(x + w, y + 2, 1, h - 4, borderColor, postGUI);
        
        --Sarkokba pötty:
        dxDrawRectangle(x + 0.5, y + 0.5, 1, 2, borderColor, postGUI);
        dxDrawRectangle(x + 0.5, y + h - 1.5, 1, 2, borderColor, postGUI);
        dxDrawRectangle(x + w - 0.5, y + 0.5, 1, 2, borderColor, postGUI);
        dxDrawRectangle(x + w - 0.5, y + h - 1.5, 1, 2, borderColor, postGUI);
	end
end

addEventHandler("onClientResourceStart", resourceRoot,
function ()
Gridlist = dxGridW:Create(1240, 330, 340, 430)
Gridlist:AddColumn("Vehicle Name", 180)
Gridlist:AddColumn("Price", 160)
Gridlist:AddColumn("Vehlib", 250)
Gridlist:AddColumn("ID", 250)
Gridlist:SetVisible(false)

for i, Veiculos in ipairs (VeiculosAVenda) do 
    Gridlist:AddItem(1, Veiculos[2].."") -- araç ismi
    Gridlist:AddItem(2, ""..Veiculos[3].."") -- araç fiyatı
    Gridlist:AddItem(3, ""..Veiculos[4].."") -- vehlib
    Gridlist:AddItem(4, ""..Veiculos[1].."") -- brand
  end
end)

Timer = {}
function click ( _,state )
local gridItem = Gridlist:GetSelectedItem()
if state == "down" then 
    if isCursorOnElement(screenW * 0.7788, screenH * 0.8567, screenW * 0.10065, screenH * 0.0522) and page == "Galeri Açık Gardaşım" then 
        playSound("sounds/beep.mp3")

        if gridItem == -1 then
            outputChatBox("please select a vehicle.")
        return end
        if gridItem then
        local carName = Gridlist:GetItemDetails(1, gridItem, 1) 
        local carID = Gridlist:GetItemDetails(4, gridItem, 4) 
        local carPrice = Gridlist:GetItemDetails(2, gridItem, 2) 
        local carVehlib = Gridlist:GetItemDetails(3, gridItem, 3) 
        triggerServerEvent("serverSide",localPlayer,localPlayer,carID, carPrice,  carName, carVehlib)
        closeGallery()
        setCameraTarget (localPlayer)
        end
    elseif isCursorOnElement(screenW * 0.8850, screenH * 0.8567, screenW * 0.10065, screenH * 0.0522) and page == "Galeri Açık Gardaşım" then 
        setCameraTarget (localPlayer)
        closeGallery()
        playSound("sounds/beep.mp3")
    elseif isCursorOnElement(screenW * 0.7850, screenH * 0.40,screenW * 0.2, screenH * 0.44) and page == "Galeri Açık Gardaşım" then 
        if isElement(Veiculo[localPlayer]) then destroyElement(Veiculo[localPlayer]) end
                if gridItem then
                    local IDDoCarro = Gridlist:GetItemDetails(4, gridItem, 4) 
                        if isTimer(Timer[localPlayer]) then killTimer(Timer[localPlayer]) end
                            Veiculo[localPlayer] = createVehicle(IDDoCarro, 561.8251953125, -1283.1162109375, 16.952306747437) -- Satın Alma Ekranında Aracın Prewiev olduğu ekran'da spawn pointi
                            setCameraMatrix(552.2685546875, -1285.6630859375, 18.421157836914, 561.8251953125, -1283.1162109375, 16.952306747437) --- kamera açıs
                            playSound("sounds/bubble.mp3")
                            Loop(localPlayer)
                        end
                end
        end
end
addEventHandler ( "onClientClick", root, click )

function startClient()
    if page == "Galeri Açık Gardaşım" then return end
        if getDistanceBetweenPoints3D(1780.2646484375, -1692.8671875, 13.65625, getElementPosition(localPlayer)) < 3 then
            addEventHandler('onClientRender', root, clientSide)
            Gridlist:SetVisible(true)
            showCursor(true)
            isInShop = true
            playSound("sounds/beep.mp3")
        end
end
--addCommandHandler('buycar',startClient)

function closeGallery()
    if page == "Galeri Açık Gardaşım" then 
        removeEventHandler('onClientRender', root, clientSide)
        Gridlist:SetVisible(false)
        showCursor(false)
        isInShop = false
        if isElement(Veiculo[localPlayer]) then destroyElement(Veiculo[localPlayer]) end
        page = nil
        setElementPosition(localPlayer,552.23046875, -1291.1591796875, 17.248237609863)
    end
end

function Loop(source)
    Timer[source] = setTimer(function()
    if not isElement(Veiculo[source]) then return end
    local Rot1, Rot2, Rot3 = getElementRotation(Veiculo[source])
    setElementRotation(Veiculo[source], Rot1 , Rot2, Rot3+1)
    end ,7, 0)
end 
