showCursor(true)

local win = Window(0, 0, 800, 600, 'Dx Gui Demo')
win:on("close",function() showCursor(false) end)
win:align('center')

local tp = TabPanel(0, 0, 800, 570)
tp:setParent(win)
local tab1 = tp:addTab('First')
local tab2 = tp:addTab('Second')

local btn1 = Button(50, 50, 120, 45, 'click me')
btn1:setParent(tab1)
btn1:once('mouseup', function() btn1.value = 'clicked' end)

local btn2 = Button(50, 110, 120, 45, 'click me')
btn2:setParent(tab1)
btn2:on('mouseup', function()
	if btn2.value == 'click me' then
		btn2.value = 'click me again'
	else
		btn2.value = 'click me'
	end
end)

local checked = false
local checkbox = Checkbox(190, 50, 160, 25, 'Check me'):setParent(tab1)
checkbox:on('mouseup', function()
	checked = not checked
	checkbox.value = checked and 'Checked!' or 'Check me'
end)

local radiobtn1 = RadioButton(190, 100, 160, 25, 'Check me'):setParent(tab1)
local radiobtn2 = RadioButton(190, 130, 160, 25, 'Check me'):setParent(tab1)

local tp2 = TabPanel(0, 200, 700, 300)
tp2:setParent(tab1)
tp2:align('centerX')
local tab4 = tp2:addTab('First')
local tab5 = tp2:addTab('Second')
local tab6 = tp2:addTab('Third')

local img = Image(25, 25, 180, 180, 'item-system/63.png')
img:setParent(tab5)
img:setDraggable(true)

local lbl = Label(300, 55, 300, 25, 'Drag the image around', 2):setParent(tab5)

local win3 = Window(15, 15, 550, 250, 'Window within a window'):setParent(tab4)
local win4 = Window(15, 15, 440, 170, 'Window within a window within a window'):setParent(win3)


local win2 = Window(0, 0, 700, 500, 'Another window')
win2:align('center')

local list = Gridlist(360, 25, 300, 420)
list:setParent(win2)
list:addColumn('Random')
list:addColumn('Data')
list:setItemHeight(37.5)

for i=1, 20 do
	list:addItem({math.random(99), math.random(999)})
end

list:sort(1)

local btn3 = Button(180, 25, 150, 45, 'Delete Selected')
btn3:setParent(win2)
btn3:on('mouseup', function()
	local index = list:getSelectedItem()
	if index then
		Alert('Are you sure about that?', function()
			list:removeItem(index)
		end)
	end
end)


local pb = ProgressBar(25,245,300,25)
pb:setParent(win2)

setTimer(function()
	local val = pb:getProgress() + 0.01
	pb:setProgress(val)
	if val >= 1 then
		killTimer(sourceTimer)
	end
end, 800, 0)

local input = Input(25, 190, 300, 30)
input:setParent(win2)

local slider = Slider(25,122,300,40)
slider:setParent(win2)
slider:setMinMax(0, 100)
slider:setSeekerPosition(30)

slider:on('change', function(pos)
	input.value = pos
	pb:setProgress(pos/100)
end)

local btn4 = Button(25,25,130,45,'Get Slider Pos')
btn4:on('mouseup', function() outputChatBox(slider:getSeekerPosition()) end)
btn4:setParent(win2)


ColorPicker():on('change', function(r,g,b,a)
	local veh = localPlayer.vehicle
	if veh then
		veh:setColor(r,g,b)
	end
end)


bindKey("K","down",function()
win:draw()

end)
addEventHandler("onClientHUDRender",localPlayer,function()
	win:draw()
end)