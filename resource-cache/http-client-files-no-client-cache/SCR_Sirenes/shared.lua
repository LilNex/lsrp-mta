tune = {
	--- Objects
	elements = {
		["Sirene Model #1"] = {},
		["Sirene Model #2"] = {},
		["Sirene Model #3"] = {},
		["Sirene Model #4"] = {},
		["Sirene Model #5"] = {},
		

		
	},
	-- Remplace Objects 
	mods = {
		
		{"mods/migalka_1.txd", "mods/migalka_1.dff", 1919},
		{"mods/migalka_2.txd", "mods/migalka_2.dff", 1920},
		{"mods/migalka_4.txd", "mods/migalka_3.dff", 1921},
		{"mods/migalka_4.txd", "mods/migalka_4.dff", 1922},
		{"mods/taxi_4.txd", "mods/migalka_5.dff", 1923},
		
	}
}

tune.key = "sirenep" --- кнопка

tune.move = {}
---- ID объектов
tune.ID = {

		["Sirene Model #1"] = 1919,
		["Sirene Model #2"] = 1920,
		["Sirene Model #3"] = 1921,
		["Sirene Model #4"] = 1922,
		["Sirene Model #5"] = 1923,
		
}


function getTuneObjectID(name)
	return tune.ID[name]
end

