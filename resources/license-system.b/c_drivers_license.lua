local localPlayer = getLocalPlayer()

questions = { 

	{"La l9iti chi Accident chno khsk dir ?", "N3yt l Police w Tbib", "Ndir rassi machft walo o nmchi", "N3awn hadok li tay7in ", 1},
	{"Ina jiha dyal chari3 khsk tsoug ?", "Finma kan", "3la Liser", "3la Limen", 3}, 
	{"Ila s9ti f Permis ch7al khsk tsayn bach t3awd dwzo ", "7أيام", "30 يوما", "أسبوعين على الأقل", 3},
	{"Khsna nb9aw ndiro 7izam salama bach : ", "N7miw ryosna men adrar dyal les accidents ", "7it ana mowatin sali7", "Mra ndirha mra la", 1},
	{"Chnahwa Limite dyal sor3a li khsk tmchi bih wst lmdina", "55", "75", "120", 1},
	{"Mni tkon sayg chno khsk tkon haz m3ak", "Jawaz Safar dyali w La carte bancaire", "Carte nationale w Permis w Rokhsa dyal Tomobil", "Zrwata o Bidoun dyal L'essence" , 2},
	{"A7san tari9a bach tdwi m3a Chauffeur whd akhor chno hya ?", "استخدام بوق سيارتك (الكلاكس) او الأضواء", "انزل زجاج النافذة و صيح", "شاور بيديك", 1},
	{"F Feu rouge ina dow khsk tw9f fih ?", "Orange", "Vert", "Rouge", 3},
	{"Chno ki 3niw dok lkhtot lboyd li kaynin f chari3 ", "Nw9f o nsayn icharat l moror o nkhli nas ydozo", "Blasa fin kaychdo Tobis", "Mamnou3 ndouz mn tma", 1},
	{"La w9fni Policier chno khsni ndir ?", "Nw9f 3la limen o nsayn wst tomobil tayji 3ndi ", "Mandihach fih", "Nsayno taynzel mn tomobil o nhrb", 1}
}

guiIntroLabel1 = nil
guiIntroProceedButton = nil
guiIntroWindow = nil
guiQuestionLabel = nil
guiQuestionAnswer1Radio = nil
guiQuestionAnswer2Radio = nil
guiQuestionAnswer3Radio = nil
guiQuestionWindow = nil
guiFinalPassTextLabel = nil
guiFinalFailTextLabel = nil
guiFinalRegisterButton = nil
guiFinalCloseButton = nil
guiFinishWindow = nil

-- variable for the max number of possible questions
local NoQuestions = 10
local NoQuestionToAnswer = 7
local correctAnswers = 0
local passPercent = 80
		
selection = {}

-- functon makes the intro window for the quiz
function createlicenseTestIntroWindow()
	
	showCursor(true)
	
	local screenwidth, screenheight = guiGetScreenSize ()
	
	local Width = 450
	local Height = 200
	local X = (screenwidth - Width)/2
	local Y = (screenheight - Height)/2
	
	guiIntroWindow = guiCreateWindow ( X , Y , Width , Height , "Driving Theory Test" , false )
	
	guiCreateStaticImage (0.35, 0.1, 0.3, 0.2, "banner.png", true, guiIntroWindow)
	
	guiIntroLabel1 = guiCreateLabel(0, 0.3,1, 0.5, [[You will now proceed with the driving theory test. You will
be given seven questions based on basic driving theory. You must score
a minimum of 80 percent to pass.

Good luck.]], true, guiIntroWindow)
	
	guiLabelSetHorizontalAlign ( guiIntroLabel1, "center", true )
	guiSetFont ( guiIntroLabel1,"default-bold-small")
	
	guiIntroProceedButton = guiCreateButton ( 0.4 , 0.75 , 0.2, 0.1 , "Start Test" , true ,guiIntroWindow)
	
	addEventHandler ( "onClientGUIClick", guiIntroProceedButton,  function(button, state)
		if(button == "left" and state == "up") then
		
			-- start the quiz and hide the intro window
			startLicenceTest()
			guiSetVisible(guiIntroWindow, false)
		
		end
	end, false)
	
end


-- function create the question window
function createLicenseQuestionWindow(number)

	local screenwidth, screenheight = guiGetScreenSize ()
	
	local Width = 450
	local Height = 200
	local X = (screenwidth - Width)/2
	local Y = (screenheight - Height)/2
	
	-- create the window
	guiQuestionWindow = guiCreateWindow ( X , Y , Width , Height , "Question "..number.." of "..NoQuestionToAnswer , false )
	
	guiQuestionLabel = guiCreateLabel(0.1, 0.2, 0.9, 0.2, selection[number][1], true, guiQuestionWindow)
	guiSetFont ( guiQuestionLabel,"default-bold-small")
	guiLabelSetHorizontalAlign ( guiQuestionLabel, "left", true)
	
	
	if not(selection[number][2]== "nil") then
		guiQuestionAnswer1Radio = guiCreateRadioButton(0.1, 0.4, 0.9,0.1, selection[number][2], true,guiQuestionWindow)
	end
	
	if not(selection[number][3] == "nil") then
		guiQuestionAnswer2Radio = guiCreateRadioButton(0.1, 0.5, 0.9,0.1, selection[number][3], true,guiQuestionWindow)
	end
	
	if not(selection[number][4]== "nil") then
		guiQuestionAnswer3Radio = guiCreateRadioButton(0.1, 0.6, 0.9,0.1, selection[number][4], true,guiQuestionWindow)
	end
	
	-- if there are more questions to go, then create a "next question" button
	if(number < NoQuestionToAnswer) then
		guiQuestionNextButton = guiCreateButton ( 0.4 , 0.75 , 0.2, 0.1 , "Next Question" , true ,guiQuestionWindow)
		
		addEventHandler ( "onClientGUIClick", guiQuestionNextButton,  function(button, state)
			if(button == "left" and state == "up") then
				
				local selectedAnswer = 0
			
				-- check all the radio buttons and seleted the selectedAnswer variabe to the answer that has been selected
				if(guiRadioButtonGetSelected(guiQuestionAnswer1Radio)) then
					selectedAnswer = 1
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer2Radio)) then
					selectedAnswer = 2
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer3Radio)) then
					selectedAnswer = 3
				else
					selectedAnswer = 0
				end
				
				-- don't let the player continue if they havn't selected an answer
				if(selectedAnswer ~= 0) then
					
					-- if the selection is the same as the correct answer, increase correct answers by 1
					if(selectedAnswer == selection[number][5]) then
						correctAnswers = correctAnswers + 1
					end
				
					-- hide the current window, then create a new window for the next question
					guiSetVisible(guiQuestionWindow, false)
					createLicenseQuestionWindow(number+1)
				end
			end
		end, false)
		
	else
		guiQuestionSumbitButton = guiCreateButton ( 0.4 , 0.75 , 0.3, 0.1 , "Submit Answers" , true ,guiQuestionWindow)
		
		-- handler for when the player clicks submit
		addEventHandler ( "onClientGUIClick", guiQuestionSumbitButton,  function(button, state)
			if(button == "left" and state == "up") then
				
				local selectedAnswer = 0
			
				-- check all the radio buttons and seleted the selectedAnswer variabe to the answer that has been selected
				if(guiRadioButtonGetSelected(guiQuestionAnswer1Radio)) then
					selectedAnswer = 1
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer2Radio)) then
					selectedAnswer = 2
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer3Radio)) then
					selectedAnswer = 3
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer4Radio)) then
					selectedAnswer = 4
				else
					selectedAnswer = 0
				end
				
				-- don't let the player continue if they havn't selected an answer
				if(selectedAnswer ~= 0) then
					
					-- if the selection is the same as the correct answer, increase correct answers by 1
					if(selectedAnswer == selection[number][5]) then
						correctAnswers = correctAnswers + 1
					end
				
					-- hide the current window, then create the finish window
					guiSetVisible(guiQuestionWindow, false)
					createTestFinishWindow()


				end
			end
		end, false)
	end
end


-- funciton create the window that tells the
function createTestFinishWindow()

	local score = math.floor((correctAnswers/NoQuestionToAnswer)*100)

	local screenwidth, screenheight = guiGetScreenSize ()
		
	local Width = 450
	local Height = 200
	local X = (screenwidth - Width)/2
	local Y = (screenheight - Height)/2
		
	-- create the window
	guiFinishWindow = guiCreateWindow ( X , Y , Width , Height , "End of test.", false )
	
	if(score >= passPercent) then
	
		guiCreateStaticImage (0.35, 0.1, 0.3, 0.2, "pass.png", true, guiFinishWindow)
	
		guiFinalPassLabel = guiCreateLabel(0, 0.3, 1, 0.1, "Congratulations! You have passed this section of the test.", true, guiFinishWindow)
		guiSetFont ( guiFinalPassLabel,"default-bold-small")
		guiLabelSetHorizontalAlign ( guiFinalPassLabel, "center")
		guiLabelSetColor ( guiFinalPassLabel ,0, 255, 0 )
		
		guiFinalPassTextLabel = guiCreateLabel(0, 0.4, 1, 0.4, "You scored "..score.."%, and the pass mark is "..passPercent.."%. Well done!" ,true, guiFinishWindow)
		guiLabelSetHorizontalAlign ( guiFinalPassTextLabel, "center", true)
		
		guiFinalRegisterButton = guiCreateButton ( 0.35 , 0.8 , 0.3, 0.1 , "Continue" , true ,guiFinishWindow)
		
		-- if the player has passed the quiz and clicks on register
		addEventHandler ( "onClientGUIClick", guiFinalRegisterButton,  function(button, state)
			if(button == "left" and state == "up") then
				-- set player date to say they have passed the theory.
				

				initiateDrivingTest()
				-- reset their correct answers
				correctAnswers = 0
				toggleAllControls ( true )
				triggerEvent("onClientPlayerWeaponCheck", source)
				--cleanup
				destroyElement(guiIntroLabel1)
				destroyElement(guiIntroProceedButton)
				destroyElement(guiIntroWindow)
				destroyElement(guiQuestionLabel)
				destroyElement(guiQuestionAnswer1Radio)
				destroyElement(guiQuestionAnswer2Radio)
				destroyElement(guiQuestionAnswer3Radio)
				destroyElement(guiQuestionWindow)
				destroyElement(guiFinalPassTextLabel)
				destroyElement(guiFinalRegisterButton)
				destroyElement(guiFinishWindow)
				guiIntroLabel1 = nil
				guiIntroProceedButton = nil
				guiIntroWindow = nil
				guiQuestionLabel = nil
				guiQuestionAnswer1Radio = nil
				guiQuestionAnswer2Radio = nil
				guiQuestionAnswer3Radio = nil
				guiQuestionWindow = nil
				guiFinalPassTextLabel = nil
				guiFinalRegisterButton = nil
				guiFinishWindow = nil
				
				correctAnswers = 0
				selection = {}
				
				showCursor(false)
			end
		end, false)
		
	else -- player has failed, 
	
		guiCreateStaticImage (0.35, 0.1, 0.3, 0.2, "fail.png", true, guiFinishWindow)
	
		guiFinalFailLabel = guiCreateLabel(0, 0.3, 1, 0.1, "Sorry, you have not passed this time.", true, guiFinishWindow)
		guiSetFont ( guiFinalFailLabel,"default-bold-small")
		guiLabelSetHorizontalAlign ( guiFinalFailLabel, "center")
		guiLabelSetColor ( guiFinalFailLabel ,255, 0, 0 )
		
		guiFinalFailTextLabel = guiCreateLabel(0, 0.4, 1, 0.4, "You scored "..math.ceil(score).."%, and the pass mark is "..passPercent.."%." ,true, guiFinishWindow)
		guiLabelSetHorizontalAlign ( guiFinalFailTextLabel, "center", true)
		
		guiFinalCloseButton = guiCreateButton ( 0.2 , 0.8 , 0.25, 0.1 , "Close" , true ,guiFinishWindow)
		
		-- if player click the close button
		addEventHandler ( "onClientGUIClick", guiFinalCloseButton,  function(button, state)
			if(button == "left" and state == "up") then
				destroyElement(guiIntroLabel1)
				destroyElement(guiIntroProceedButton)
				destroyElement(guiIntroWindow)
				destroyElement(guiQuestionLabel)
				destroyElement(guiQuestionAnswer1Radio)
				destroyElement(guiQuestionAnswer2Radio)
				destroyElement(guiQuestionAnswer3Radio)
				destroyElement(guiQuestionWindow)
				destroyElement(guiFinalFailTextLabel)
				destroyElement(guiFinalCloseButton)
				destroyElement(guiFinishWindow)
				guiIntroLabel1 = nil
				guiIntroProceedButton = nil
				guiIntroWindow = nil
				guiQuestionLabel = nil
				guiQuestionAnswer1Radio = nil
				guiQuestionAnswer2Radio = nil
				guiQuestionAnswer3Radio = nil
				guiQuestionWindow = nil
				guiFinalFailTextLabel = nil
				guiFinalCloseButton = nil
				guiFinishWindow = nil
				
				selection = {}
				correctAnswers = 0
				
				showCursor(false)
			end
		end, false)
	end
	
end
 
 -- function starts the quiz
 function startLicenceTest()
 
	-- choose a random set of questions
	chooseTestQuestions()
	-- create the question window with question number 1
	createLicenseQuestionWindow(1)
 
 end
 
 
 -- functions chooses the questions to be used for the quiz
 function chooseTestQuestions()
 
	-- loop through selections and make each one a random question
	for i=1, 10 do
		-- pick a random number between 1 and the max number of questions
		local number = math.random(1, NoQuestions)
		
		-- check to see if the question has already been selected
		if(testQuestionAlreadyUsed(number)) then
			repeat -- if it has, keep changing the number until it hasn't
				number = math.random(1, NoQuestions)
			until (testQuestionAlreadyUsed(number) == false)
		end
		
		-- set the question to the random one
		selection[i] = questions[number]
	end
 end
 
 
 -- function returns true if the queston is already used
 function testQuestionAlreadyUsed(number)
 
	local same = 0
 
	-- loop through all the current selected questions
	for i, j in pairs(selection) do
		-- if a selected question is the same as the new question
		if(j[1] == questions[number][1]) then
			same = 1 -- set same to 1
		end
		
	end
	
	-- if same is 1, question already selected to return true
	if(same == 1) then
		return true
	else
		return false
	end
 end

---------------------------------------
------ Practical Driving Test ---------
---------------------------------------
 
testRoute = {
	{ 2070.5126953125, -1913.87890625, 13.546875 },	-- Start, DoL Parking 
	{ 2103.47265625, -1896.50390625, 13.341691970825 },	-- San Andreas Boulevard DoL near Exit
	{ 2208.06640625, -1895.8564453125, 13.471145629883 }, -- San Andreas Boulevard DoL Exiting turning left
	{ 2220.6318359375, -1974.5546875, 13.418573379517 }, 	-- Constituion Ave
	{ 2405.2978515625, -1974.3076171875, 13.408428192139 }, -- Constituion Ave, turn to St. Lawrence Blvd
	{ 2415.62890625, -1889.2373046875, 13.349864959717 }, -- St. Lawrence Blvd
	{ 2415.98046875, -1740.7939453125, 13.3828125 }, 	-- St. Lawrence Blvd, going to Panopticon Ave
	{ 2344.5419921875, -1724.6796875, 13.376621246338 }, 	-- St. Lawrence Blvd, going to Panopticon Ave
	{ 2344.9853515625, -1572.154296875, 23.833515167236 }, 	-- St. Lawrence Blvd, going to Panopticon Ave
	{ 2344.9296875, -1392.916015625, 23.822311401367 },	-- St. Lawrence Blvd, turning on to Panopticon Ave
	{ 2306.9794921875, -1376.58203125, 23.8671875 },	-- Panopticon Ave
	{ 2306.095703125, -1160.248046875, 26.7890625 },	-- Panopticon Ave back on to the opposite side of St. Lawrence Blvd
	{ 2156.54296875, -1114.5400390625, 25.350477218628 },		-- St. Lawrence Blvd
	{ 2065.7255859375, -1095.8408203125, 24.806316375732 },	-- Turning on to City Hall Road
	{ 2059.51953125, -1259.0185546875, 23.8203125 },	-- City Hall Road
	{ 1860.4072265625, -1258.6044921875, 13.384706497192 },	-- City Hall Road
	{ 1845.62109375, -1450.7685546875, 13.404946327209 },	-- City Hall Road
	{ 1819.4560546875, -1603.251953125, 13.375343322754 },	-- City Hall Road
	{ 1819.640625, -1769.5517578125, 13.3828125 },	-- City Hall Road
	{ 1814.28125, -1829.6728515625, 13.4140625 },	-- City Hall Road
	{ 1697.98046875, -1810.0244140625, 13.372961997986 }, 	-- City Hall Road turning towards IGS
	{ 1682.09375, -1856.6767578125, 13.390607833862 }, 	-- 
	{ 1578.8251953125, -1869.921875, 13.3828125 }, 	-- 
	{ 1375.5068359375, -1868.75, 13.3828125 }, 	-- IGS
	{ 1233.9755859375, -1849.7724609375, 13.3828125 }, 	-- IGS
	{ 1181.7177734375, -1844.7216796875, 13.409471511841 }, -- IGS
	{ 1181.74609375, -1720.7373046875, 13.546186447144 }, 			-- Mulholland parking, Turn to East Vinewood Blvd
	{ 1152.3603515625, -1700.681640625, 13.78125 }, 	-- East Vinewood Blvd, turn to Sunset Blvd
	{ 1151.8642578125, -1580.6416015625, 13.2734375 }, 	-- Sunset Blvd
	{ 1045.0908203125, -1569.5107421875, 13.3828125 }, 	-- Sunset Blvd
	{ 1064.908203125, -1414.513671875, 13.412287712097 }, 	-- Sunset Blvd
	{ 1230.0693359375, -1408.6416015625, 13.084007263184 }, 	-- Sunset Blvd, Turn to St. Lawrence Blvd
	{ 1333.9443359375, -1408.51953125, 13.373888969421 }, 	-- St. Lawrence Blvd
	{ 1365.2109375, -1408.2763671875, 13.409864425659 }, 	-- St. Lawrence Blvd, turn to West Broadway
	{ 1446.029296875, -1442.94140625, 13.3828125 }, 	-- West Broadway
	{ 1427.4453125, -1583.84375, 13.373676300049 }, -- West Broadway
	{ 1427.4794921875, -1723.4755859375, 13.3828125 }, 	-- Interstate 25
	{ 1557.5380859375, -1734.7509765625, 13.3828125 }, 	-- Interstate 25
	{ 1680.9765625, -1734.6923828125, 13.388912200928 }, 	-- Interstate 125
	{ 1813.220703125, -1734.3349609375, 13.3828125 }, 	-- Interstate 125
	{ 1819.244140625, -1842.2822265625, 13.4140625 }, -- Interstate 125
	{ 1820.8525390625, -1934.2060546875, 13.376926422119 }, -- Interstate 125
	{ 1951.8212890625, -1934.845703125, 13.3828125 }, 	-- Interstate 125
	{ 1964.9189453125, -1760.982421875, 13.3828125 }, 		-- Interstate 125, turn to Saints Blvd
	{ 1943.8505859375, -1741.3427734375, 13.3828125 }, 	-- Saints Blvd, turn to St Anthony St.
	{ 1940.0927734375, -1611.49609375, 13.3828125 }, 		-- St Anthony St, turn to Saints Blvd
	{ 1830.3828125, -1609.92578125, 13.378843307495 }, 	-- Saints Blvd
	{ 1841.8818359375, -1558.24609375, 13.372302055359 }, 	-- Saints Blvd
	{ 1924.919921875, -1519.642578125, 3.2886357307434 }, -- Saints Blvd, turn to Caesar Rd
	{ 2042.3271484375, -1520.3837890625, 3.321569442749 }, 		-- mid turn
	{ 2158.205078125, -1555.1044921875, 2.2916688919067 }, 	-- Caesar Rd
	{ 2288.8544921875, -1610.2275390625, 3.8594613075256 }, 	-- Caesar Rd
	{ 2458.876953125, -1621.1640625, 15.329563140869 }, 	-- Caesar Rd, turn to Freedom St
	{ 2607.466796875, -1622.6376953125, 19.631643295288 }, -- Freedom St
	{ 2713.8173828125, -1626.787109375, 12.868648529053 }, 	-- Freedom St, turn to Carson St
	{ 2720.666015625, -1648.8876953125, 13.058265686035 }, 	-- Carson St
	{ 2652.0185546875, -1654.9638671875, 10.704069137573 }, 		-- Carson St, turn to Atlantica Ave
	{ 2640.830078125, -1766.0517578125, 10.71875 }, -- Atlantica Ave
	{ 2669.5859375, -1870.9345703125, 10.90088558197 }, 	-- Atlantica Ave, turn to Pilon St
	{ 2766.96875, -1901.423828125, 10.945479393005 }, 	-- Pilon St
	{ 2766.775390625, -1985.8369140625, 13.383580207825 }, -- Pilon St
	{ 2721.8173828125, -1992.181640625, 13.402125358582 },	-- St. Joseph St
	{ 2706.7177734375, -2046.8525390625, 13.401507377625 },	-- St. Joseph St
	{ 2379.1552734375, -2046.8779296875, 14.750169754028 },	-- St. Joseph St
	{ 2288.025390625, -2072.681640625, 13.417743682861 },	-- St. Joseph St, turn to Fremont St
	{ 2194.890625, -2158.3134765625, 13.390596389771 },	-- Fremont St, turn to Fame St
	{ 2103.64453125, -2107.4140625, 13.295400619507 },	-- Fame St
	{ 1970.205078125, -2107.6572265625, 13.3828125 },	-- ROUTE FIX
	{ 1963.54296875, -1940.998046875, 13.3828125 },	-- ROUTE FIX
	{ 2021.7119140625, -1934.591796875, 13.334049224854 },	-- ROUTE FIX
	{ 2054.9091796875, -1914.548828125, 13.546875 },	-- DoL End road
}

testVehicle = { [410]=true } -- Mananas need to be spawned at the start point.

local blip = nil
local marker = nil

function initiateDrivingTest()
	triggerServerEvent("theoryComplete", getLocalPlayer())
	local x, y, z = testRoute[1][1], testRoute[1][2], testRoute[1][3]
	blip = createBlip(x, y, z, 0, 2, 0, 255, 0, 255)
	marker = createMarker(x, y, z, "checkpoint", 4, 0, 255, 0, 150) -- start marker.
	addEventHandler("onClientMarkerHit", marker, startDrivingTest)
	
	outputChatBox("#FF9933You are now ready to take your practical driving examination. Collect a DoL test car and begin the route.", 255, 194, 14, true)
	
end

function startDrivingTest(element)
	if element == getLocalPlayer() then
		local vehicle = getPedOccupiedVehicle(getLocalPlayer())
		local id = getElementModel(vehicle)
		if not (testVehicle[id]) then
			outputChatBox("#FF9933You must be in a DoL test car when passing through the checkpoints.", 255, 0, 0, true ) -- Wrong car type.
		else
			destroyElement(blip)
			destroyElement(marker)
			
			local vehicle = getPedOccupiedVehicle ( getLocalPlayer() )
			setElementData(getLocalPlayer(), "drivingTest.marker", 2, false)

			local x1,y1,z1 = nil -- Setup the first checkpoint
			x1 = testRoute[2][1]
			y1 = testRoute[2][2]
			z1 = testRoute[2][3]
			setElementData(getLocalPlayer(), "drivingTest.checkmarkers", #testRoute, false)

			blip = createBlip(x1, y1 , z1, 0, 2, 255, 0, 255, 255)
			marker = createMarker( x1, y1,z1 , "checkpoint", 4, 255, 0, 255, 150)
				
			addEventHandler("onClientMarkerHit", marker, UpdateCheckpoints)
				
			outputChatBox("#FF9933You will need to complete the route without damaging the test car. Good luck and drive safe.", 255, 194, 14, true)
		end
	end
end

function UpdateCheckpoints(element)
	if (element == localPlayer) then
		local vehicle = getPedOccupiedVehicle(getLocalPlayer())
		local id = getElementModel(vehicle)
		if not (testVehicle[id]) then
			outputChatBox("You must be in a DoL test car when passing through the check points.", 255, 0, 0) -- Wrong car type.
		else
			destroyElement(blip)
			destroyElement(marker)
			blip = nil
			marker = nil
				
			local m_number = getElementData(getLocalPlayer(), "drivingTest.marker")
			local max_number = getElementData(getLocalPlayer(), "drivingTest.checkmarkers")
			
			if (tonumber(max_number-1) == tonumber(m_number)) then -- if the next checkpoint is the final checkpoint.
				outputChatBox("#FF9933Park your car at the #FF66CCin the parking lot #FF9933to complete the test.", 255, 194, 14, true)
				
				local newnumber = m_number+1
				setElementData(getLocalPlayer(), "drivingTest.marker", newnumber, false)
					
				local x2, y2, z2 = nil
				x2 = testRoute[newnumber][1]
				y2 = testRoute[newnumber][2]
				z2 = testRoute[newnumber][3]
				
				marker = createMarker( x2, y2, z2, "checkpoint", 4, 255, 0, 255, 150)
				blip = createBlip( x2, y2, z2, 0, 2, 255, 0, 255, 255)
				
				
				addEventHandler("onClientMarkerHit", marker, EndTest)
			else
				local newnumber = m_number+1
				setElementData(getLocalPlayer(), "drivingTest.marker", newnumber, false)
						
				local x2, y2, z2 = nil
				x2 = testRoute[newnumber][1]
				y2 = testRoute[newnumber][2]
				z2 = testRoute[newnumber][3]
						
				marker = createMarker( x2, y2, z2, "checkpoint", 4, 255, 0, 255, 150)
				blip = createBlip( x2, y2, z2, 0, 2, 255, 0, 255, 255)
				
				addEventHandler("onClientMarkerHit", marker, UpdateCheckpoints)
			end
		end
	end
end

function EndTest(element)
	if (element == localPlayer) then
		local vehicle = getPedOccupiedVehicle(getLocalPlayer())
		local id = getElementModel(vehicle)
		if not (testVehicle[id]) then
			outputChatBox("You must be in a DoL test car when passing through the check points.", 255, 0, 0)
		else
			local vehicleHealth = getElementHealth ( vehicle )
			if (vehicleHealth >= 800) then
				----------
				-- PASS --
				----------
				outputChatBox("After inspecting the vehicle we can see no damage.", 255, 194, 14)
				triggerServerEvent("acceptCarLicense", getLocalPlayer())
			else
				----------
				-- Fail --
				----------
				outputChatBox("After inspecting the vehicle we can see that it's damage.", 255, 194, 14)
				outputChatBox("You have failed the practical driving test.", 255, 0, 0)
			end
			
			destroyElement(blip)
			destroyElement(marker)
			blip = nil
			marker = nil
		end
	end
end