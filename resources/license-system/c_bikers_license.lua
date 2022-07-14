local localPlayer = getLocalPlayer()

questionsBike = { 
	{"F ina jiha 3ndna l7ak nsoguo?", "Droite", "Gauche", "Bjoj", 1},
	{"3lach darori meni nkono f moto nlbsso lcasque ?", "Nchof lmanadir", "Protection men accidents", "Bax nakhod l'attention d bnadem", 2},
	{"Point li mikidroch les camions ichofok?", "Lor", "Lissar d camio", "Bjoj" , 3},
	{"F ina do khassna n7bsso?", "Vert", "Jaune", "Rouge" , 3},
	{"F autoroutes cheno minimun d moteur d vehicule dialek ?", "50cc", "125cc", "250cc" , 1},
	{"F trik b joj itijahat cheno khass lconducteur idir ?", "Isog finma kan", "igogue lissar", "Isogue f liman juste pour depasser", 3},
	{"3lach kanksso speed f xi hbta ?", "Nchof lmanadir b3la khatri", "Maykhssroch l pneus", "Bax ila kan dayz xi wa7ed n7bss", 3},
	{"3lach khassni nverifi l'moteur d moto kbal mandemari?", "Bax lmotor ibka nki", "Bach nt2akad bli  lmoteur en bon etat", "Bax ntya7 titiz" , 2},
	{"Morak tonobila d emergency talka sirene ach ghadir ?", "Nwkaf liman wnkhaliha doz", "nsslam 3lihom", "nkssiri bax nwerihom trik" , 1},
	{"Max speed f mdina howa ?", "40KM/h", "60KM/h", "90KM/h" , 1},
}

guiIntroLabel1B = nil
guiIntroProceedButtonB = nil
guiIntroWindowB = nil
guiQuestionLabelB = nil
guiQuestionAnswer1RadioB = nil
guiQuestionAnswer2RadioB = nil
guiQuestionAnswer3RadioB = nil
guiQuestionWindowB = nil
guiFinalPassTextLabelB = nil
guiFinalFailTextLabelB = nil
guiFinalRegisterButtonB = nil
guiFinalCloseButtonB = nil
guiFinishWindowB = nil

-- variable for the max number of possible questions
local NoQuestions = 10
local NoQuestionToAnswer = 7
local correctAnswers = 0
local passPercent = 80
		
selection = {}

-- functon makes the intro window for the quiz
function createlicenseBikeTestIntroWindow()
	showCursor(true)
	local screenwidth, screenheight = guiGetScreenSize ()
	
	local Width = 450
	local Height = 200
	local X = (screenwidth - Width)/2
	local Y = (screenheight - Height)/2
	
	guiIntroWindowB = guiCreateWindow ( X , Y , Width , Height , "Bike Theory Test" , false )
	
	guiCreateStaticImage (0.35, 0.1, 0.3, 0.2, "banner.png", true, guiIntroWindowB)
	
	guiIntroLabel1B = guiCreateLabel(0, 0.3,1, 0.5, [[You will now proceed with the motorcycle theory test. You will
be given seven questions based on basic driving theory. You must score
a minimum of 80 percent to pass.

Good luck.]], true, guiIntroWindowB)
	
	guiLabelSetHorizontalAlign ( guiIntroLabel1B, "center", true )
	guiSetFont ( guiIntroLabel1B,"default-bold-small")
	
	guiIntroProceedButtonB = guiCreateButton ( 0.4 , 0.75 , 0.2, 0.1 , "Start Test" , true ,guiIntroWindowB)
	
	addEventHandler ( "onClientGUIClick", guiIntroProceedButtonB,  function(button, state)
		if(button == "left" and state == "up") then
		
			-- start the quiz and hide the intro window
			startLicenceBikeTest()
			guiSetVisible(guiIntroWindowB, false)
		
		end
	end, false)
	
end

-- done bike up to here

-- function create the question window
function createBikeLicenseQuestionWindow(number)

	local screenwidth, screenheight = guiGetScreenSize ()
	
	local Width = 450
	local Height = 200
	local X = (screenwidth - Width)/2
	local Y = (screenheight - Height)/2
	
	-- create the window
	guiQuestionWindowB = guiCreateWindow ( X , Y , Width , Height , "Question "..number.." of "..NoQuestionToAnswer , false )
	
	guiQuestionLabelB = guiCreateLabel(0.1, 0.2, 0.9, 0.2, selection[number][1], true, guiQuestionWindowB)
	guiSetFont ( guiQuestionLabelB,"default-bold-small")
	guiLabelSetHorizontalAlign ( guiQuestionLabelB, "left", true)
	
	
	if not(selection[number][2]== "nil") then
		guiQuestionAnswer1RadioB = guiCreateRadioButton(0.1, 0.4, 0.9,0.1, selection[number][2], true,guiQuestionWindowB)
	end
	
	if not(selection[number][3] == "nil") then
		guiQuestionAnswer2RadioB = guiCreateRadioButton(0.1, 0.5, 0.9,0.1, selection[number][3], true,guiQuestionWindowB)
	end
	
	if not(selection[number][4]== "nil") then
		guiQuestionAnswer3RadioB = guiCreateRadioButton(0.1, 0.6, 0.9,0.1, selection[number][4], true,guiQuestionWindowB)
	end
	
	-- if there are more questions to go, then create a "next question" button
	if(number < NoQuestionToAnswer) then
		guiQuestionNextButtonB = guiCreateButton ( 0.4 , 0.75 , 0.2, 0.1 , "Next Question" , true ,guiQuestionWindowB)
		
		addEventHandler ( "onClientGUIClick", guiQuestionNextButtonB,  function(button, state)
			if(button == "left" and state == "up") then
				
				local selectedAnswer = 0
			
				-- check all the radio buttons and seleted the selectedAnswer variabe to the answer that has been selected
				if(guiRadioButtonGetSelected(guiQuestionAnswer1RadioB)) then
					selectedAnswer = 1
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer2RadioB)) then
					selectedAnswer = 2
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer3RadioB)) then
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
					guiSetVisible(guiQuestionWindowB, false)
					createBikeLicenseQuestionWindow(number+1)
				end
			end
		end, false)
		
	else
		guiQuestionSumbitButtonB = guiCreateButton ( 0.4 , 0.75 , 0.3, 0.1 , "Submit Answers" , true ,guiQuestionWindowB)
		
		-- handler for when the player clicks submit
		addEventHandler ( "onClientGUIClick", guiQuestionSumbitButtonB,  function(button, state)
			if(button == "left" and state == "up") then
				
				local selectedAnswer = 0
			
				-- check all the radio buttons and seleted the selectedAnswer variabe to the answer that has been selected
				if(guiRadioButtonGetSelected(guiQuestionAnswer1RadioB)) then
					selectedAnswer = 1
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer2RadioB)) then
					selectedAnswer = 2
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer3RadioB)) then
					selectedAnswer = 3
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer4RadioB)) then
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
					guiSetVisible(guiQuestionWindowB, false)
					createBikeTestFinishWindow()


				end
			end
		end, false)
	end
end


-- funciton create the window that tells the
function createBikeTestFinishWindow()

	local score = math.floor((correctAnswers/NoQuestionToAnswer)*100)

	local screenwidth, screenheight = guiGetScreenSize ()
		
	local Width = 450
	local Height = 200
	local X = (screenwidth - Width)/2
	local Y = (screenheight - Height)/2
		
	-- create the window
	guiFinishWindowB = guiCreateWindow ( X , Y , Width , Height , "End of test.", false )
	
	if(score >= passPercent) then
	
		guiCreateStaticImage (0.35, 0.1, 0.3, 0.2, "pass.png", true, guiFinishWindowB)
	
		guiFinalPassLabelB = guiCreateLabel(0, 0.3, 1, 0.1, "Congratulations! You have passed this section of the test.", true, guiFinishWindowB)
		guiSetFont ( guiFinalPassLabelB,"default-bold-small")
		guiLabelSetHorizontalAlign ( guiFinalPassLabelB, "center")
		guiLabelSetColor ( guiFinalPassLabelB ,0, 255, 0 )
		
		guiFinalPassTextLabelB = guiCreateLabel(0, 0.4, 1, 0.4, "You scored "..score.."%, and the pass mark is "..passPercent.."%. Well done!" ,true, guiFinishWindowB)
		guiLabelSetHorizontalAlign ( guiFinalPassTextLabelB, "center", true)
		
		guiFinalRegisterButtonB = guiCreateButton ( 0.35 , 0.8 , 0.3, 0.1 , "Continue" , true ,guiFinishWindowB)
		
		-- if the player has passed the quiz and clicks on register
		addEventHandler ( "onClientGUIClick", guiFinalRegisterButtonB,  function(button, state)
			if(button == "left" and state == "up") then
				-- set player date to say they have passed the theory.
				

				initiateBikeTest()
				-- reset their correct answers
				correctAnswers = 0
				toggleAllControls ( true )
				triggerEvent("onClientPlayerWeaponCheck", source)
				--cleanup
				destroyElement(guiIntroLabel1B)
				destroyElement(guiIntroProceedButtonB)
				destroyElement(guiIntroWindowB)
				destroyElement(guiQuestionLabelB)
				destroyElement(guiQuestionAnswer1RadioB)
				destroyElement(guiQuestionAnswer2RadioB)
				destroyElement(guiQuestionAnswer3RadioB)
				destroyElement(guiQuestionWindowB)
				destroyElement(guiFinalPassTextLabelB)
				destroyElement(guiFinalRegisterButtonB)
				destroyElement(guiFinishWindowB)
				guiIntroLabel1B = nil
				guiIntroProceedButtonB = nil
				guiIntroWindowB = nil
				guiQuestionLabelB = nil
				guiQuestionAnswer1RadioB = nil
				guiQuestionAnswer2RadioB = nil
				guiQuestionAnswer3RadioB = nil
				guiQuestionWindowB = nil
				guiFinalPassTextLabelB = nil
				guiFinalRegisterButtonB = nil
				guiFinishWindowB = nil
				
				correctAnswers = 0
				selection = {}
				
				showCursor(false)
			end
		end, false)
		
	else -- player has failed, 
	
		guiCreateStaticImage (0.35, 0.1, 0.3, 0.2, "fail.png", true, guiFinishWindowB)
	
		guiFinalFailLabelB = guiCreateLabel(0, 0.3, 1, 0.1, "Sorry, you have not passed this time.", true, guiFinishWindowB)
		guiSetFont ( guiFinalFailLabelB,"default-bold-small")
		guiLabelSetHorizontalAlign ( guiFinalFailLabelB, "center")
		guiLabelSetColor ( guiFinalFailLabelB ,255, 0, 0 )
		
		guiFinalFailTextLabelB = guiCreateLabel(0, 0.4, 1, 0.4, "You scored "..math.ceil(score).."%, and the pass mark is "..passPercent.."%." ,true, guiFinishWindowB)
		guiLabelSetHorizontalAlign ( guiFinalFailTextLabelB, "center", true)
		
		guiFinalCloseButtonB = guiCreateButton ( 0.2 , 0.8 , 0.25, 0.1 , "Close" , true ,guiFinishWindowB)
		
		-- if player click the close button
		addEventHandler ( "onClientGUIClick", guiFinalCloseButtonB,  function(button, state)
			if(button == "left" and state == "up") then
				destroyElement(guiIntroLabel1B)
				destroyElement(guiIntroProceedButtonB)
				destroyElement(guiIntroWindowB)
				destroyElement(guiQuestionLabelB)
				destroyElement(guiQuestionAnswer1RadioB)
				destroyElement(guiQuestionAnswer2RadioB)
				destroyElement(guiQuestionAnswer3RadioB)
				destroyElement(guiQuestionWindowB)
				destroyElement(guiFinalPassTextLabelB)
				destroyElement(guiFinalRegisterButtonB)
				destroyElement(guiFinishWindowB)
				guiIntroLabel1B = nil
				guiIntroProceedButtonB = nil
				guiIntroWindowB = nil
				guiQuestionLabelB = nil
				guiQuestionAnswer1RadioB = nil
				guiQuestionAnswer2RadioB = nil
				guiQuestionAnswer3RadioB = nil
				guiQuestionWindowB = nil
				guiFinalPassTextLabelB = nil
				guiFinalRegisterButtonB = nil
				guiFinishWindowB = nil
				
				selection = {}
				correctAnswers = 0
				
				showCursor(false)
			end
		end, false)
	end
	
end
 
 -- function starts the quiz
 function startLicenceBikeTest()
 
	-- choose a random set of questions
	chooseBikeTestQuestions()
	-- create the question window with question number 1
	createBikeLicenseQuestionWindow(1)
 
 end
 
 
 -- functions chooses the questions to be used for the quiz
 function chooseBikeTestQuestions()
 
	-- loop through selections and make each one a random question
	for i=1, 10 do
		-- pick a random number between 1 and the max number of questions
		local number = math.random(1, NoQuestions)
		
		-- check to see if the question has already been selected
		if(testBikeQuestionAlreadyUsed(number)) then
			repeat -- if it has, keep changing the number until it hasn't
				number = math.random(1, NoQuestions)
			until (testBikeQuestionAlreadyUsed(number) == false)
		end
		
		-- set the question to the random one
		selection[i] = questionsBike[number]
	end
 end
 
 
 -- function returns true if the queston is already used
 function testBikeQuestionAlreadyUsed(number)
 
	local same = 0
 
	-- loop through all the current selected questions
	for i, j in pairs(selection) do
		-- if a selected question is the same as the new question
		if(j[1] == questionsBike[number][1]) then
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
 
testBikeRoute = {
	{ 2069.4267578125, -1914.8720703125, 13.546875 },	-- Start, DoL Parking 
	{ 2084.1083984375, -1903.7255859375, 13.3828125 }, -- DoL exit, turning right
	{ 2074.392578125, -1809.734375, 13.3828125 }, -- Headed towards Governors office
	{ 1969.98046875, -1809.8056640625, 13.3828125 }, -- Riding towards Idlewood
	{ 1959.2919921875, -2008.1171875, 13.390586853027 }, -- ^^
	{ 1958.9873046875, -2157.71484375, 13.3828125 }, -- Turning towards PD
	{ 1880.68359375, -2164.01171875, 13.3828125 }, -- ^^
	{ 1752.8173828125, -2163.9697265625, 13.3828125 }, -- Stop at PD, turn right
	{ 1560.94140625, -2101.3310546875, 33.690002441406 }, -- Stop at SAN, turn left
	{ 1531.833984375, -1880.4296875, 13.3828125 }, -- ^^
	{ 1442.7421875, -1870.0439453125, 13.390607833862 }, -- End of SAN, behind PD turn left
	{ 1314.36328125, -1844.6416015625, 13.3828125 }, -- Heading past PD
	{ 1314.48828125, -1740.8564453125, 13.3828125 }, -- Next to PD
	{ 1314.1640625, -1584.1435546875, 13.3828125 }, -- At intersection on commerce
	{ 1347.1748046875, -1486.1630859375, 13.3828125 }, -- Stop @ St. Lawrence, turn right
	{ 1359.5556640625, -1416.2109375, 13.3828125 }, -- Turn left towards ASH @ speed cam
	{ 1270.837890625, -1392.6865234375, 13.172231674194 }, -- ^^
	{ 1207.716796875, -1387.390625, 13.214917182922 }, -- Next to ASH
	{ 1206.556640625, -1289.28515625, 13.389961242676 }, -- Heading down the road
	{ 1334.6015625, -1283.2412109375, 13.3828125 }, -- ^^
	{ 1359.81640625, -1225.74609375, 14.045049667358 }, -- Turn right at Vinyl Countdown
	{ 1365.4453125, -1143.1533203125, 23.649215698242 }, -- ^^
	{ 1450.7763671875, -1162.939453125, 23.664012908936 }, -- Heading towards Dillimore
	{ 1613.0166015625, -1163.4462890625, 23.898797988892 }, -- ^^
	{ 1704.5986328125, -1163.3203125, 23.65625 }, -- Turn left @ Dillimore road
	{ 1836.572265625, -1182.9794921875, 23.637483596802 }, -- ^^
	{ 1869.025390625, -1122.6923828125, 23.721828460693 }, -- Going towards Bank
	{ 1888.259765625, -1045.390625, 23.683940887451 }, -- ^^
	{ 1971.578125, -1052.396484375, 24.359525680542 }, -- Turn left at bank
	{ 2057.5947265625, -1086.671875, 24.744655609131 }, -- ^^
	{ 2167.3125, -1121.130859375, 25.419015884399 }, -- Going towards Beach
	{ 2263.794921875, -1148.5615234375, 26.824546813965 }, -- ^^
	{ 2268.6767578125, -1233.4384765625, 23.807760238647 }, -- ^^
	{ 2268.291015625, -1309.5205078125, 23.832864761353 }, -- Turn left into road
	{ 2268.71484375, -1375.8232421875, 23.828125 }, -- ^^
	{ 2210.1796875, -1392.08203125, 23.8203125 }, -- End of road, turn left
	{ 2197.279296875, -1632.5361328125, 15.30199432373 }, -- ^^
	{ 2220.92578125, -1652.7646484375, 15.222694396973 }, -- Heading back towards DoL
	{ 2213.9814453125, -1722.2197265625, 13.371579170227 }, -- ^^
	{ 2216.025390625, -1885.8193359375, 13.3828125 }, -- turn right towards DoL
	{ 2090.107421875, -1891.900390625, 13.3828125 }, -- ^^
	{ 2078.228515625, -1929.12109375, 13.328357696533 }, -- Turn left towards DoL
	{ 2054.455078125, -1922.2216796875, 13.546875 },	-- DoL End road
}

testBike = { [468]=true } -- Mananas need to be spawned at the start point.

local blip = nil
local marker = nil

function initiateBikeTest()
	triggerServerEvent("theoryBikeComplete", getLocalPlayer())
	local x, y, z = testBikeRoute[1][1], testBikeRoute[1][2], testBikeRoute[1][3]
	blip = createBlip(x, y, z, 0, 2, 0, 255, 0, 255)
	marker = createMarker(x, y, z, "checkpoint", 4, 0, 255, 0, 150) -- start marker.
	addEventHandler("onClientMarkerHit", marker, startBikeTest)
	
	outputChatBox("#FF9933You are now ready to take your practical driving examination. Collect a DoL test bike and begin the route.", 255, 194, 14, true)
	
end

function startBikeTest(element)
	if element == getLocalPlayer() then
		local vehicle = getPedOccupiedVehicle(getLocalPlayer())
		local id = getElementModel(vehicle)
		if not (testBike[id]) then
			outputChatBox("#FF9933You must be riding a DoL test bike when passing through the checkpoints.", 255, 0, 0, true ) -- Wrong  type.
		else
			destroyElement(blip)
			destroyElement(marker)
			
			local vehicle = getPedOccupiedVehicle ( getLocalPlayer() )
			setElementData(getLocalPlayer(), "drivingTest.marker", 2, false)

			local x1,y1,z1 = nil -- Setup the first checkpoint
			x1 = testBikeRoute[2][1]
			y1 = testBikeRoute[2][2]
			z1 = testBikeRoute[2][3]
			setElementData(getLocalPlayer(), "drivingTest.checkmarkers", #testBikeRoute, false)

			blip = createBlip(x1, y1 , z1, 0, 2, 255, 0, 255, 255)
			marker = createMarker( x1, y1,z1 , "checkpoint", 4, 255, 0, 255, 150)
				
			addEventHandler("onClientMarkerHit", marker, UpdateBikeCheckpoints)
				
			outputChatBox("#FF9933You will need to complete the route without damaging the test bike. Good luck and drive safe.", 255, 194, 14, true)
		end
	end
end

function UpdateBikeCheckpoints(element)
	if (element == localPlayer) then
		local vehicle = getPedOccupiedVehicle(getLocalPlayer())
		local id = getElementModel(vehicle)
		if not (testBike[id]) then
			outputChatBox("You must be on a DoL test bike when passing through the check points.", 255, 0, 0) -- Wrong car type.
		else
			destroyElement(blip)
			destroyElement(marker)
			blip = nil
			marker = nil
				
			local m_number = getElementData(getLocalPlayer(), "drivingTest.marker")
			local max_number = getElementData(getLocalPlayer(), "drivingTest.checkmarkers")
			
			if (tonumber(max_number-1) == tonumber(m_number)) then -- if the next checkpoint is the final checkpoint.
				outputChatBox("#FF9933Park your bike at the #FF66CCin the parking lot #FF9933to complete the test.", 255, 194, 14, true)
				
				local newnumber = m_number+1
				setElementData(getLocalPlayer(), "drivingTest.marker", newnumber, false)
					
				local x2, y2, z2 = nil
				x2 = testBikeRoute[newnumber][1]
				y2 = testBikeRoute[newnumber][2]
				z2 = testBikeRoute[newnumber][3]
				
				marker = createMarker( x2, y2, z2, "checkpoint", 4, 255, 0, 255, 150)
				blip = createBlip( x2, y2, z2, 0, 2, 255, 0, 255, 255)
				
				
				addEventHandler("onClientMarkerHit", marker, EndBikeTest)
			else
				local newnumber = m_number+1
				setElementData(getLocalPlayer(), "drivingTest.marker", newnumber, false)
						
				local x2, y2, z2 = nil
				x2 = testBikeRoute[newnumber][1]
				y2 = testBikeRoute[newnumber][2]
				z2 = testBikeRoute[newnumber][3]
						
				marker = createMarker( x2, y2, z2, "checkpoint", 4, 255, 0, 255, 150)
				blip = createBlip( x2, y2, z2, 0, 2, 255, 0, 255, 255)
				
				addEventHandler("onClientMarkerHit", marker, UpdateBikeCheckpoints)
			end
		end
	end
end

function EndBikeTest(element)
	if (element == localPlayer) then
		local vehicle = getPedOccupiedVehicle(getLocalPlayer())
		local id = getElementModel(vehicle)
		if not (testBike[id]) then
			outputChatBox("You must be on a DoL test bike when passing through the check points.", 255, 0, 0)
		else
			local vehicleHealth = getElementHealth ( vehicle )
			if (vehicleHealth >= 800) then
				----------
				-- PASS --
				----------
				outputChatBox("After inspecting the vehicle we can see no damage.", 255, 194, 14)
				triggerServerEvent("acceptBikeLicense", getLocalPlayer())
			
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