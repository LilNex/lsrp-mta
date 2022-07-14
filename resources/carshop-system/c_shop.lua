localPlayer = getLocalPlayer()
function carshop_showInfo(carPrice, taxPrice)
	local isOverlayDisabled = getElementData(localPlayer, "hud:isOverlayDisabled")
	if isOverlayDisabled then
		outputChatBox("")
		outputChatBox("Concessionnaire")
		outputChatBox("============ Carshop-System ============", 255, 194, 14)
		outputChatBox("   - Marque: "..(getElementData(source, "brand") or getVehicleNameFromModel( getElementModel( source ) )), 255, 194, 14 )
		outputChatBox("   - Modèle: "..(getElementData(source, "maximemodel") or getVehicleNameFromModel( getElementModel( source ) )), 255, 194, 14 )
		--outputChatBox("   - Année: "..(getElementData(source, "year") or "2015"), 255, 194, 14 )

		if getVehicleType(source) ~= 'BMX' then
			--outputChatBox("   - Kilometreur: "..exports.global:formatMoney(getElementData(source, 'odometer') or 0) .. " kilomètres"  )
		end
		outputChatBox("   - Prix: $"..exports.global:formatMoney(carPrice), 255, 194, 14  )
		outputChatBox("   - Taxe: $"..exports.global:formatMoney(taxPrice), 255, 194, 14  )
		outputChatBox("   (( MTA Modèle: "..getVehicleNameFromModel( getElementModel( source ) ).."))", 255, 194, 14  )
		outputChatBox("Appuyez sur 'F' ou 'Entrée' pour acheter", 255, 194, 14)
		outputChatBox("====================================", 255, 194, 14)
	else
		local content = {}
		--table.insert(content, { getCarShopNicename(getElementData(source, "carshop")) , false, false, false, false, false, false, "title"} )
		--table.insert(content, {" " } )
		outputChatBox("============ Carshop-System ============", 255, 194, 14)
		outputChatBox("   - Marque: "..(getElementData(source, "brand") or getVehicleNameFromModel( getElementModel( source ) )), 255, 194, 14 )
		outputChatBox("   - Modèle: "..(getElementData(source, "maximemodel") or getVehicleNameFromModel( getElementModel( source ) )), 255, 194, 14 )
		--outputChatBox("   - Année: "..(getElementData(source, "year") or "2015"), 255, 194, 14 )
		if getVehicleType(source) ~= 'BMX' then
			--table.insert(content, {"   - Kilometreur: "..exports.global:formatMoney(getElementData(source, 'odometer') or 0) .. " kilomètres"})
		end
		outputChatBox("   - Prix: $"..exports.global:formatMoney(carPrice), 255, 194, 14  )
		outputChatBox("   - Taxe: $"..exports.global:formatMoney(taxPrice), 255, 194, 14  )
		outputChatBox("   (( MTA Modèle: "..getVehicleNameFromModel( getElementModel( source ) ).."))" , 255, 194, 14 )
		outputChatBox("Appuyez sur 'F' ou 'Entrée' pour acheter", 255, 194, 14)
		outputChatBox("====================================", 255, 194, 14)
		exports.hud:sendTopRightNotification( content, localPlayer, 240)
	end
end
addEvent("carshop:showInfo", true)
addEventHandler("carshop:showInfo", getRootElement(), carshop_showInfo)

local gui, theVehicle = {}
function carshop_buyCar(carPrice, cashEnabled, bankEnabled)
	if getElementData(getLocalPlayer(), "exclusiveGUI") then
		return false
	end

	if gui["_root"] then
		return
	end

	setElementData(getLocalPlayer(), "exclusiveGUI", true, false)

	theVehicle = source

	guiSetInputEnabled(true)
	local screenWidth, screenHeight = guiGetScreenSize()
	local windowWidth, windowHeight = 350, 190
	local left = screenWidth/2 - windowWidth/2
	local top = screenHeight/2 - windowHeight/2
	gui["_root"] = guiCreateStaticImage(left, top, windowWidth, windowHeight, ":resources/window_body.png", false)
	--guiWindowSetSizable(gui["_root"], false)

	gui["lblText1"] = guiCreateLabel(20, 25, windowWidth-40, 16, "Tu es sur le point d'acheter le véhicule:", false, gui["_root"])
	gui["lblVehicleName"] = guiCreateLabel(20, 45+5, windowWidth-40, 13, exports.global:getVehicleName(source) , false, gui["_root"])
	guiSetFont(gui["lblVehicleName"], "default-bold-small")
	gui["lblVehicleCost"] = guiCreateLabel(20, 45+15+5, windowWidth-40, 13, "Prix: $"..exports.global:formatMoney(carPrice), false, gui["_root"])
	guiSetFont(gui["lblVehicleCost"], "default-bold-small")
	gui["lblText2"] = guiCreateLabel(20, 45+15*2, windowWidth-40, 70, "En cliquant sur un bouton de paiement, vous acceptez qu'un remboursement ne soit pas possible. Merci de nous avoir choisi!", false, gui["_root"])
	guiLabelSetHorizontalAlign(gui["lblText2"], "left", true)
	guiLabelSetVerticalAlign(gui["lblText2"], "center", true)

	gui["btnCash"] = guiCreateButton(10, 140, 105, 41, "Payer en cache", false, gui["_root"])
	addEventHandler("onClientGUIClick", gui["btnCash"], carshop_buyCar_click, false)
	guiSetEnabled(gui["btnCash"], cashEnabled)


	gui["btnCancel"] = guiCreateButton(232, 140, 105, 41, "Annuler", false, gui["_root"])
	addEventHandler("onClientGUIClick", gui["btnCancel"], carshop_buyCar_close, false)
end
addEvent("carshop:buyCar", true)
addEventHandler("carshop:buyCar", getRootElement(), carshop_buyCar)

function carshop_buyCar_click()
	if exports.global:hasSpaceForItem(getLocalPlayer(), 3, 1) then
		local sourcestr = "cash"
		if (source == gui["btnBank"]) then
			sourcestr = "bank"
		end
		triggerServerEvent("carshop:buyCar", theVehicle, sourcestr)
	else
		outputChatBox("Vous n'avez pas assez de place dans votre inventaire pour la clé de votre véhicule.", 0, 255, 0)
	end
	carshop_buyCar_close()
end


function carshop_buyCar_close()
	if gui["_root"] then
		destroyElement(gui["_root"])
		gui = { }
	end
	guiSetInputEnabled(false)
	setElementData(getLocalPlayer(), "exclusiveGUI", false, false)
end
--PREVENT ABUSER TO CHANGE CHAR
addEventHandler ( "onSapphireXMBShow", getRootElement(), carshop_buyCar_close )
addEventHandler("onClientChangeChar", getRootElement(), carshop_buyCar_close)

function cleanUp()
	setElementData(getLocalPlayer(), "exclusiveGUI", false, false)
end
addEventHandler("onClientResourceStart", resourceRoot, cleanUp)
