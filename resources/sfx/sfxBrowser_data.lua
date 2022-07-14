sfxBrowser = sfxBrowser or {}

-- The following data has been extracted from http://pdescobar.home.comcast.net/~pdescobar/gta/saat/sfx_dir.html
-- Regex: <tr><td>(.*?)</td><td>(.*?)</td><td>(.*?)</td><td>(.*?)</td><td>(.*?)</td></tr> ; Replace: {num = \3, desc = "\5"};
sfxBrowser.ms_Data = {
	feet = {
		{num = 9, desc = "??Individual Footfalls"};
		{num = 5, desc = "??Running on Water or Leaves"};
		{num = 5, desc = "??Walking on Water or Leaves"};
		{num = 5, desc = "??On Pier/sounds like a drum"};
		{num = 4, desc = "??More Water/Leaves type"};
		{num = 5, desc = "??Quicker drum-like footfalls"};
		{num = 5, desc = "??More echoing drum-like feet"};
	};
	genrl = {
		{num = 2, desc = "Engine Decelerate: Bravura, Cadrona, Elegy, Euros, Merit, Mesa, Nebula, Previon, Primo, Solair, Uranus, ZR-350"};
		{num = 3, desc = "Engine Accelerate: Bravura, Cadrona, Elegy, Euros, Merit, Mesa, Nebula, Previon, Primo, Solair, Uranus, ZR-350"};
		{num = 4, desc = "Unknown Prop Engines"};
		{num = 2, desc = "Engine Decelerate: Baggage, Tug"};
		{num = 3, desc = "Engine Accelerate: Baggage, Tug"};
		{num = 4, desc = "Helicopter Engines: Cargobob, Hunter, Leviathan, Raindance"};
		{num = 2, desc = "Unknown Helicopter Engines"};
		{num = 2, desc = "Unknown Engines"};
		{num = 3, desc = "Unknown Engines"};
		{num = 2, desc = "Engine Decelerate: Bullet, Glendale, Trashed Glendale, Oceanic, Tornado"};
		{num = 3, desc = "Engine Accelerate: Bullet, Glendale, Trashed Glendale, Oceanic, Tornado"};
		{num = 2, desc = "Engine Decelerate: Bike, BMX, Mountain Bike"};
		{num = 5, desc = "Engine Accelerate: Bike, BMX, Mountain Bike"};
		{num = 2, desc = "Unknown Engines (Very Deep Pitch)"};
		{num = 2, desc = "Engine Decelerate: Coastguard, Dinghy, Jetmax, Launch, Marquis, Predator, Reefer, Speeder, Squalo, Tropic"};
		{num = 1, desc = "Engine Accelerate: Coastguard, Dinghy, Jetmax, Launch, Marquis, Predator, Reefer, Speeder, Squalo, Tropic"};
		{num = 1, desc = "Unknown Plane Engine"};
		{num = 2, desc = "Unknown Heavy Engines"};
		{num = 2, desc = "Engine Decelerate: Cabbie, Fortune, Intruder, Picador, Sunrise, Vincent, Willard, Yosemite"};
		{num = 3, desc = "Engine Accelerate: Cabbie, Fortune, Intruder, Picador, Sunrise, Vincent, Willard, Yosemite"};
		{num = 24, desc = "Ricochets and Shell Casings"};
		{num = 3, desc = "Bullets Whizzing Past"};
		{num = 3, desc = "Bullets Whizzing Past"};
		{num = 3, desc = "Bullets Whizzing Past"};
		{num = 3, desc = "Bullets Whizzing Past"};
		{num = 2, desc = "Engine Decelerate: Bus, Coach, DFT-30"};
		{num = 3, desc = "Engine Accelerate: Bus, Coach, DFT-30"};
		{num = 2, desc = "Engine Decelerate: Broadway, Hermes, Remington"};
		{num = 3, desc = "Engine Accelerate: Broadway, Hermes, Remington"};
		{num = 3, desc = "Engine Accelerate: RC Bandit"};
		{num = 2, desc = "Engine Decelerate: Alpha, Buffalo, Hotring Racer (A), Hotring Racer (B), Infernus"};
		{num = 3, desc = "Engine Accelerate: Alpha, Buffalo, Hotring Racer (A), Hotring Racer (B), Infernus"};
		{num = 72, desc = "Bangs; Crashes; Stuff Breaking"};
		{num = 2, desc = "Engine Decelerate: HPV1000, Wayfarer"};
		{num = 3, desc = "Engine Accelerate: HPV1000, Wayfarer"};
		{num = 2, desc = "Unknown Engines"};
		{num = 3, desc = "Unknown Engines"};
		{num = 5, desc = "Unknown Engines and ??Trailer Hitch??"};
		{num = 2, desc = "Engine Decelerate: Blade, Buccaneer, Clover, Sabre, Savanna, Stallion, Voodoo"};
		{num = 3, desc = "Engine Accelerate: Blade, Buccaneer, Clover, Sabre, Savanna, Stallion, Voodoo"};
		{num = 2, desc = "Engine Decelerate: Quadbike, Sanchez"};
		{num = 3, desc = "Engine Accelerate: Quadbike, Sanchez"};
		{num = 2, desc = "Unknown Engines"};
		{num = 3, desc = "Unknown Engines"};
		{num = 3, desc = "Doors Opening and Closing"};
		{num = 5, desc = "??Fire and Explosions??"};
		{num = 2, desc = "Engine Accelerate: Rustler, Stuntplane"};
		{num = 2, desc = "Engine Decelerate: Cropduster, Dodo, Rustler, Skimmer, Stuntplane"};
		{num = 2, desc = "Unknown Engines"};
		{num = 3, desc = "Unknown Engines"};
		{num = 3, desc = "Engine Decelerate: Forklift"};
		{num = 3, desc = "Engine Accelerate: Forklift"};
		{num = 31, desc = "001-004 Static<br>005-009 Interface<br>010 Modshop Power Wrench<br>011-012 Clicks (??Gun Empty??)<br>013-020 Interface<br>021-025 Clicks (??Gun Reload??)<br>026-029 Interface<br>030-031 Hums (??Engines??)"};
		{num = 9, desc = "Interface"};
		{num = 2, desc = "Engine Accelerate: Kart, Mower"};
		{num = 3, desc = "Engine Decelerate: Kart, Mower"};
		{num = 2, desc = "Engine Accelerate: Caddy"};
		{num = 3, desc = "Engine Decelerate: Caddy"};
		{num = 2, desc = "Helicopter Power On/Power Off"};
		{num = 2, desc = "Barber Scissors and Clippers"};
		{num = 2, desc = "Barber Scissors and Clippers"};
		{num = 2, desc = "Engine Decelerate: Combine Harvester"};
		{num = 5, desc = "Engine Accelerate: Combine Harvester"};
		{num = 2, desc = "Engine Decelerate: Bloodring Banger, Monster (all 3 types)"};
		{num = 3, desc = "Engine Accelerate: Bloodring Banger, Monster (all 3 types)"};
		{num = 2, desc = "Unknown Engines"};
		{num = 3, desc = "Unknown Engines"};
		{num = 14, desc = "001 Bicycle Bell<br>002-010 Car/Truck Horns<br>011-012 Sirens<br>013-014 Ship Horns or Foghorns"};
		{num = 2, desc = "Engine Decelerate: BF Injection, Hotknife, Hustler, Slamvan"};
		{num = 3, desc = "Engine Accelerate: BF Injection, Hotknife, Hustler, Slamvan"};
		{num = 2, desc = "Engine Decelerate: Vortex"};
		{num = 3, desc = "Engine Accelerate: Vortex"};
		{num = 4, desc = "001-003 Engine Accelerate: Mr Whoopee<br>004 Mr Whoopee Song Loop"};
		{num = 2, desc = "Engine Decelerate: Barracks, Dune, Enforcer, FBI Truck, Flatbed, S.W.A.T., Trashmaster"};
		{num = 3, desc = "Engine Accelerate: Barracks, Dune, Enforcer, FBI Truck, Flatbed, S.W.A.T., Trashmaster"};
		{num = 8, desc = "Loading Screen Theme Music"};
		{num = 2, desc = "Engine Decelerate: Benson, Cement Truck, Dumper, Fire Truck (both types), Linerunner, Packer, Rhino, Roadtrain, Tanker"};
		{num = 3, desc = "Engine Accelerate: Benson, Cement Truck, Dumper, Fire Truck (both types), Linerunner, Packer, Rhino, Roadtrain, Tanker"};
		{num = 4, desc = "Helicopter Engines: Maverick, News Chopper, Police Maverick"};
		{num = 2, desc = "Engine Decelerate: Admiral, Elegant, Emperor, Police (all 3 types), Premier, Sentinel, Stafford, Stratum, Stretch, Sultan, Taxi"};
		{num = 3, desc = "Engine Accelerate: Admiral, Elegant, Emperor, Police (all 3 types), Premier, Sentinel, Stafford, Stratum, Stretch, Sultan, Taxi"};
		{num = 2, desc = "Engine Decelerate: Dozer, Tractor, Walton"};
		{num = 3, desc = "Engine Accelerate: Dozer, Tractor, Walton"};
		{num = 2, desc = "Unknown Engines"};
		{num = 3, desc = "Unknown Engines"};
		{num = 2, desc = "Engine Decelerate: Blista Compact, Club, Esperanto, Feltzer, Flash, Jester, Majestic, Tahoma"};
		{num = 3, desc = "Engine Accelerate: Blista Compact, Club, Esperanto, Feltzer, Flash, Jester, Majestic, Tahoma"};
		{num = 2, desc = "Engine Decelerate: Bobcat, Greenwood, Manana, Moonbeam, Perennial, Regina, Romero, Sadler, Trashed Sadler, Tampa, Virgo, Washington"};
		{num = 3, desc = "Engine Accelerate: Bobcat, Greenwood, Manana, Moonbeam, Perennial, Regina, Romero, Sadler, Trashed Sadler, Tampa, Virgo, Washington"};
		{num = 2, desc = "Unknown Engines"};
		{num = 3, desc = "Unknown Engines"};
		{num = 2, desc = "Engine Decelerate: FBI Rancher, Huntley, Landstalker, Patriot, Rancher (both types), Ranger, Sandking"};
		{num = 3, desc = "Engine Accelerate: FBI Rancher, Huntley, Landstalker, Patriot, Rancher (both types), Ranger, Sandking"};
		{num = 2, desc = "Engine Decelerate: Hotring Racer (C), Phoenix, Windsor"};
		{num = 3, desc = "Engine Accelerate: Hotring Racer (C), Phoenix, Windsor"};
		{num = 2, desc = "Engine Decelerate: Banshee, Cheetah, Comet, Super GT, Turismo"};
		{num = 3, desc = "Engine Accelerate: Banshee, Cheetah, Comet, Super GT, Turismo"};
		{num = 4, desc = "Helicopter Engines: Seasparrow, Sparrow"};
		{num = 16, desc = "??Clicks and Bangs??"};
		{num = 1, desc = "Engine Decelerate: RC Baron"};
		{num = 1, desc = "Engine Accelerate: RC Baron"};
		{num = 1, desc = "Engine Decelerate: RC Goblin, RC Raider"};
		{num = 2, desc = "Engine Accelerate: RC Goblin, RC Raider"};
		{num = 1, desc = "Unknown Engines"};
		{num = 3, desc = "Unknown Engines"};
		{num = 1, desc = "Engine Decelerate: RC Tiger"};
		{num = 1, desc = "Engine Accelerate: RC Tiger"};
		{num = 2, desc = "Engine Decelerate: Bandito, FCR-900"};
		{num = 3, desc = "Engine Accelerate: Bandito, FCR-900"};
		{num = 2, desc = "Unknown Engines"};
		{num = 3, desc = "Unknown Engines"};
		{num = 2, desc = "Engine Decelerate: Faggio, Pizza Boy, RC Bandit"};
		{num = 3, desc = "Engine Accelerate: Faggio, Pizza Boy"};
		{num = 2, desc = "Engine Accelerate: Cropduster, Dodo, Skimmer"};
		{num = 6, desc = "??Wind and Assorted Clicks??"};
		{num = 2, desc = "Unknown Engines"};
		{num = 3, desc = "Unknown Engines"};
		{num = 2, desc = "Engine Decelerate: BF-400, NRG-500, PCJ-600"};
		{num = 3, desc = "Engine Accelerate: BF-400, NRG-500, PCJ-600"};
		{num = 3, desc = "Engine Decelerate: Sweeper"};
		{num = 3, desc = "Engine Accelerate: Sweeper"};
		{num = 5, desc = "Splashing"};
		{num = 2, desc = "Engine Decelerate: Baggage Stairs, Baggage Trailer (both types), Farm Plough"};
		{num = 3, desc = "Engine Accelerate: Baggage Stairs, Baggage Trailer (both types), Farm Plough"};
		{num = 6, desc = "Engine Decelerate: Brown Streak, Freight, Train cars (all 3 types)"};
		{num = 10, desc = "Engine Accelerate: Brown Streak, Freight, Train cars (all 3 types), Tram"};
		{num = 6, desc = "Engine Decelerate: Tram"};
		{num = 2, desc = "Engine Accelerate: Beagle, Nevada"};
		{num = 2, desc = "Engine Decelerate: Beagle, Nevada"};
		{num = 2, desc = "Engine Decelerate: Ambulance, Berkeley's RC Van, Boxville (Burglar), Burrito, Journey, Mule, Newsvan, Pony, Securicar, Towtruck, Utility Van"};
		{num = 3, desc = "Engine Accelerate: Ambulance, Berkeley's RC Van, Boxville (Burglar), Burrito, Journey, Mule, Newsvan, Pony, Securicar, Towtruck, Utility Van"};
		{num = 45, desc = "001-003 Mechanical Sounds<br>004-024 Air Vehicle Engines<br>025-026 Tire Squeals<br>027-031 Air Vehicle Engines<br>032-037 Doors (??Closing??)<br>038 Engine Starting<br>039-044 Doors (??Locked??)<br>045 Engine Failing to Start"};
		{num = 2, desc = "Engine Decelerate: Freeway"};
		{num = 3, desc = "Engine Accelerate: Freeway"};
		{num = 2, desc = "Engine Decelerate: Boxville (Regular), Camper, Hotdog, Rumpo, Yankee"};
		{num = 3, desc = "Engine Accelerate: Boxville (Regular), Camper, Hotdog, Rumpo, Yankee"};
		{num = 89, desc = "Weapon and Tool Sounds:"};
	};
	pain_a = {
		{num = 169, desc = "VOICE_PAIN_CARL\n001-014 Breathing Hard\n015-025 Coughing\n026-034 Groans of Pain\n035-040 Underwater Groans\n041-064 Grunts of Exertion\n065-079 Falling Exclamations\n080-113 Groans of Pain\n114-122 Grunts of Exertion\n123-134 Breathing Hard\n135-144 Vomiting\n145-156 Grunts of Exertion\n157-163 ??Sighs??\n164-169 Catching Breath"};
		{num = 131, desc = "VOICE_PAIN_FEMALE\n001-025 Coughing\n\n026-088 Short Groans of Pain\n089-131 Screams of Pain"};
		{num = 101, desc = "VOICE_PAIN_MALE\n001-007 Coughing\n008-069 Short Groans of Pain\n070-101 Screams of Pain"};
	};
	script = {
		{num = 164, mission = "2000 -  2163", desc = "Place names for crime reports"};
		{num = 15, mission = "2200 -  2214", desc = "Vehicle colors for crime reports"};
		{num = 5, mission = "2400 -  2404", desc = "Directions for crime reports"};
		{num = 9, mission = "2600 -  2608", desc = "Locations for crime reports"};
		{num = 14, mission = "2800 -  2813", desc = "10-code pieces for crime reports"};
		{num = 58, mission = "3000 -  3057", desc = "Vehicle types for crime reports"};
		{num = 2, mission = "3200 -  3201", desc = "Air horn (heard in stadium)"};
		{num = 2, mission = "3400 -  3401", desc = "Air Conditioner & Fire Alarm"};
		{num = 1, mission = "3600 ", desc = "Cellphone Dialing"};
		{num = 1, mission = "3800 ", desc = "Videotape Noise"};
		{num = 2, mission = "4000 -  4001", desc = "Balla taunts from Cleaning the Hood"};
		{num = 4, mission = "4200 -  4203", desc = "Slot Machine SFX"};
		{num = 1, mission = "4400 ", desc = "Haircut clippers"};
		{num = 5, mission = "4600 -  4604", desc = "Basketball Minigame SFX"};
		{num = 8, mission = "4800 -  4807", desc = "Gym Challenge Dialogue (Black Boxer)"};
		{num = 15, mission = "5000 -  5014", desc = "Catalina race taunts"};
		{num = 7, mission = "5200 -  5206", desc = "Let's Get Ready to Bumble SFX"};
		{num = 65, mission = "5400 -  5464", desc = "Female Croupier 1 Dialogue (Roulette/WOF)"};
		{num = 3, mission = "5600 -  5602", desc = "Bike Package Throw SFX"};
		{num = 57, mission = "5800 -  5856", desc = "Male Croupier Dialogue (BlackJack)"};
		{num = 4, mission = "6000 -  6003", desc = "Area 69 SFX"};
		{num = 6, mission = "6200 -  6205", desc = "Boat School Dialogue (Unused?)"};
		{num = 3, mission = "6400 -  6402", desc = "Door and Claxon SFX"};
		{num = 4, mission = "6600 -  6603", desc = "House falling apart SFX"};
		{num = 3, mission = "6800 -  6802", desc = "Cargo Plane door"};
		{num = 67, mission = "7000 -  7066", desc = "Fender Ketchup Dialogue"};
		{num = 40, mission = "7200 -  7239", desc = "Saint Mark's Bistro Dialogue"};
		{num = 22, mission = "7400 -  7421", desc = "Explosive Situation Dialogue"};
		{num = 13, mission = "7600 -  7612", desc = "You've Had Your Chips Dialogue"};
		{num = 103, mission = "7800 -  7902", desc = "Don Peyote Dialogue"};
		{num = 18, mission = "8000 -  8017", desc = "Intensive Care Dialogue"};
		{num = 79, mission = "8200 -  8278", desc = "Meat Business Dialogue"};
		{num = 13, mission = "8400 -  8412", desc = "Freefall Dialogue"};
		{num = 139, mission = "8600 -  8738", desc = "Extra Catalina Dialogue 1"};
		{num = 41, mission = "8800 -  8840", desc = "Local Liquor Store Dialogue"};
		{num = 32, mission = "9000 -  9031", desc = "Against All Odds Dialogue"};
		{num = 2, mission = "9200 -  9201", desc = "'Security Alarm' / 'Wooden Door Breach'"};
		{num = 52, mission = "9400 -  9451", desc = "Tanker Commander Dialogue"};
		{num = 77, mission = "9600 -  9676", desc = "Small Town Bank Dialogue"};
		{num = 115, mission = "9800 -  9914", desc = "Extra Catalina Dialogue 2"};
		{num = 16, mission = "10000 - 10015", desc = "High Stakes, Low Rider Dialoge"};
		{num = 15, mission = "10200 - 10214", desc = "Impounded Dialogue (Unused)"};
		{num = 10, mission = "10400 - 10409", desc = "Extra Cesar Dialogue"};
		{num = 64, mission = "10600 - 10663", desc = "Burning Desire Dialogue"};
		{num = 33, mission = "10800 - 10832", desc = "Doberman Dialogue (Much Unused)"};
		{num = 11, mission = "11000 - 11010", desc = "Gray Imports Dialogue"};
		{num = 1, mission = "11200 ", desc = "'Hatch Lock'"};
		{num = 56, mission = "11400 - 11455", desc = "Dance Dialogue (Great Move)"};
		{num = 56, mission = "11600 - 11655", desc = "Dance Dialogue (Bad Move)"};
		{num = 56, mission = "11800 - 11855", desc = "Dance Dialogue (Okay Move)"};
		{num = 56, mission = "12000 - 12055", desc = "Dance Dialogue (Awful Move)"};
		{num = 2, mission = "12200 - 12201", desc = "Da Nang Thang SFX"};
		{num = 12, mission = "12400 - 12411", desc = "Madd Dogg Dialogue (Crowd)"};
		{num = 6, mission = "12600 - 12605", desc = "Deconstruction SFX"};
		{num = 33, mission = "12800 - 12832", desc = "Monster Dialogue"};
		{num = 39, mission = "13000 - 13038", desc = "Hijack Dialogue"};
		{num = 17, mission = "13200 - 13216", desc = "Interdiction Dialogue"};
		{num = 20, mission = "13400 - 13419", desc = "N.O.E. Dialogue"};
		{num = 47, mission = "13600 - 13646", desc = "Black Project Dialogue"};
		{num = 4, mission = "13800 - 13803", desc = "Stowaway Dialogue"};
		{num = 42, mission = "14000 - 14041", desc = "Madd Dogg Dialogue (Dogg and CJ)"};
		{num = 1, mission = "14200 ", desc = "'Pissing'"};
		{num = 11, mission = "14400 - 14410", desc = "Duality Game SFX"};
		{num = 1, mission = "14600 ", desc = "'Swat Wall Break'"};
		{num = 1, mission = "14800 ", desc = "Detonation Siren"};
		{num = 29, mission = "15000 - 15028", desc = "T-Bone Mendez Dialogue"};
		{num = 59, mission = "15200 - 15258", desc = "Mike Toreno Dialogue"};
		{num = 9, mission = "15400 - 15408", desc = "Ran Fa Li Dialogue"};
		{num = 4, mission = "15600 - 15603", desc = "Lure Dialogue"};
		{num = 151, mission = "15800 - 15950", desc = "Reuniting the Families Dialogue"};
		{num = 19, mission = "16000 - 16018", desc = "Green Sabre Dialogue"};
		{num = 1, mission = "16200 ", desc = "'Plane Door Kick'"};
		{num = 105, mission = "16400 - 16504", desc = "Wear Flowers in Your Hair Dialogue"};
		{num = 15, mission = "16600 - 16614", desc = "Deconstruction Dialogue"};
		{num = 4, mission = "16800 - 16803", desc = "Airport Gate Guard Dialogue"};
		{num = 7, mission = "17000 - 17006", desc = "GoGo Space Monkey SFX"};
		{num = 1, mission = "17200 ", desc = "'Heavy Crate Land'"};
		{num = 56, mission = "17400 - 17455", desc = "Beat Down on B-Dup Dialogue"};
		{num = 23, mission = "17600 - 17622", desc = "Grove 4 Life Dialogue"};
		{num = 8, mission = "17800 - 17807", desc = "Gym SFX"};
		{num = 26, mission = "18000 - 18025", desc = "Architectural Espionage Dialogue"};
		{num = 17, mission = "18200 - 18216", desc = "Dam and Blast Dialogue"};
		{num = 35, mission = "18400 - 18434", desc = "Key to Her Heart Dialogue"};
		{num = 17, mission = "18600 - 18616", desc = "Cop Wheels Dialogue"};
		{num = 8, mission = "18800 - 18807", desc = "Up, Up, and Away Dialogue"};
		{num = 136, mission = "19000 - 19135", desc = "Breaking the Bank Dialogue"};
		{num = 20, mission = "19200 - 19219", desc = "Architectural Espionage Dialogue 2"};
		{num = 4, mission = "19400 - 19403", desc = "'Truck Smash Vehicle'"};
		{num = 5, mission = "19600 - 19604", desc = "Alarm Clock and Snores"};
		{num = 1, mission = "19800 ", desc = "House Party Bass Loop"};
		{num = 73, mission = "20000 - 20072", desc = "Big Smoke Dialogue"};
		{num = 49, mission = "20200 - 20248", desc = "Ryder Dialogue"};
		{num = 25, mission = "20400 - 20424", desc = "Extra Jizzy Dialogue"};
		{num = 1, mission = "20600 ", desc = "Car Phone Ring"};
		{num = 5, mission = "20800 - 20804", desc = "Wardrobe-related sfx"};
		{num = 3, mission = "21000 - 21002", desc = "Keypad SFX"};
		{num = 8, mission = "21200 - 21207", desc = "Gym Challenge Dialogue (Kung Fu)"};
		{num = 57, mission = "21400 - 21456", desc = "Life's a Beach Dialogue"};
		{num = 67, mission = "21600 - 21666", desc = "Beach Party Dialogue"};
		{num = 9, mission = "21800 - 21808", desc = "Madd Dogg's Rhymes Dialogue"};
		{num = 40, mission = "22000 - 22039", desc = "Management Issues Dialogue"};
		{num = 18, mission = "22200 - 22217", desc = "House Party Dialogue"};
		{num = 7, mission = "22400 - 22406", desc = "Extra OG Loc Dialogue"};
		{num = 1, mission = "22600 ", desc = "Mourners Crying"};
		{num = 40, mission = "22800 - 22839", desc = "Cesar Vialpando and Low-Rider Dialogue"};
		{num = 1, mission = "23000 ", desc = "Cellphone Ring"};
		{num = 10, mission = "23200 - 23209", desc = "Extra Maccer Dialogue"};
		{num = 1, mission = "23400 ", desc = "'Crate Landing'"};
		{num = 1, mission = "23600 ", desc = "Cutscene Video Game SFX"};
		{num = 36, mission = "23800 - 23835", desc = "A Home in the Hills Dialogue"};
		{num = 64, mission = "24000 - 24063", desc = "Vertical Bird Dialogue"};
		{num = 20, mission = "24200 - 24219", desc = "Homecoming Dialogue"};
		{num = 34, mission = "24400 - 24433", desc = "Cut Throat Business Dialogue"};
		{num = 1, mission = "24600 ", desc = "Locked Vehicle Door"};
		{num = 30, mission = "24800 - 24829", desc = "Barbara Cellphone Calls"};
		{num = 48, mission = "25000 - 25047", desc = "Catalina Cellphone Calls"};
		{num = 120, mission = "25200 - 25319", desc = "Cesar Cellphone Calls"};
		{num = 24, mission = "25400 - 25423", desc = "Denise Cellphone Calls"};
		{num = 5, mission = "25600 - 25604", desc = "Meat Business Abattoir SFX"};
		{num = 2, mission = "25800 - 25801", desc = "Yay Ka-Boom-Boom Bomb Shop SFX"};
		{num = 10, mission = "26000 - 26009", desc = "Extra Mechanic Dialogue"};
		{num = 24, mission = "26200 - 26223", desc = "Helena Cellphone Calls"};
		{num = 13, mission = "26400 - 26412", desc = "Hernandez Cellphone Calls"};
		{num = 34, mission = "26600 - 26633", desc = "Jethro Cellphone Calls"};
		{num = 12, mission = "26800 - 26811", desc = "Jizzy Cellphone Calls"};
		{num = 19, mission = "27000 - 27018", desc = "Kendl Cellphone Calls"};
		{num = 6, mission = "27200 - 27205", desc = "Kent Paul Cellphone Calls"};
		{num = 23, mission = "27400 - 27422", desc = "OG Loc Cellphone Calls"};
		{num = 22, mission = "27600 - 27621", desc = "Michelle Cellphone Calls"};
		{num = 34, mission = "27800 - 27833", desc = "Millie Cellphone Calls"};
		{num = 1, mission = "28000 ", desc = "'Reverb Car Screech'"};
		{num = 5, mission = "28200 - 28204", desc = "Pulaski Cellphone Calls"};
		{num = 28, mission = "28400 - 28427", desc = "Rosenberg Cellphone Calls"};
		{num = 23, mission = "28600 - 28622", desc = "Salvatore Cellphone Calls"};
		{num = 12, mission = "28800 - 28811", desc = "Big Smoke Cellphone Calls"};
		{num = 156, mission = "29000 - 29155", desc = "Sweet Cellphone Calls"};
		{num = 18, mission = "29200 - 29217", desc = "Tenpenny Cellphone Calls"};
		{num = 14, mission = "29400 - 29413", desc = "Guppy Cellphone Calls"};
		{num = 66, mission = "29600 - 29665", desc = "Toreno Cellphone Calls"};
		{num = 26, mission = "29800 - 29825", desc = "Truth Cellphone Calls"};
		{num = 83, mission = "30000 - 30082", desc = "Woozie Cellphone Calls"};
		{num = 22, mission = "30200 - 30221", desc = "Katie Cellphone Calls"};
		{num = 17, mission = "30400 - 30416", desc = "Zero Cellphone Calls"};
		{num = 1, mission = "30600 ", desc = "'Radar Level Warning'"};
		{num = 4, mission = "30800 - 30803", desc = "??Pickups or Something; Maybe Menu Select??"};
		{num = 2, mission = "31000 - 31001", desc = "Doorbell, 'Window Rattle Bang'"};
		{num = 6, mission = "31200 - 31205", desc = "ITB Machine SFX"};
		{num = 1, mission = "31400 ", desc = "Heavy Breathing"};
		{num = 6, mission = "31600 - 31605", desc = "Pool Minigame Dialogue"};
		{num = 11, mission = "31800 - 31810", desc = "Pool Minigame SFX"};
		{num = 1, mission = "32000 ", desc = "Tire-changing Ratchet"};
		{num = 2, mission = "32200 - 32201", desc = "Eating and Puking"};
		{num = 3, mission = "32400 - 32402", desc = "Reuniting the Families SFX"};
		{num = 1, mission = "32600 ", desc = "Trailer Hookup"};
		{num = 48, mission = "32800 - 32847", desc = "Riot Dialogue"};
		{num = 89, mission = "33000 - 33088", desc = "Los Desperados Dialogue"};
		{num = 105, mission = "33200 - 33304", desc = "End of the Line Dialogue"};
		{num = 4, mission = "33400 - 33403", desc = "Roulette SFX"};
		{num = 77, mission = "33600 - 33676", desc = "Home Invasion Dialogue"};
		{num = 90, mission = "33800 - 33889", desc = "Robbing Uncle Sam Dialogue"};
		{num = 68, mission = "34000 - 34067", desc = "Catalyst"};
		{num = 74, mission = "34200 - 34273", desc = "Extra Ryder Dialogue"};
		{num = 16, mission = "34400 - 34415", desc = "555-WE-TIP Dialogue"};
		{num = 7, mission = "34600 - 34606", desc = "Ammunation Shooting Range SFX"};
		{num = 32, mission = "34800 - 34831", desc = "Mafia Debt Cellphone Calls"};
		{num = 76, mission = "35000 - 35075", desc = "OG Loc Dialogue"};
		{num = 41, mission = "35200 - 35240", desc = "Running Dog Dialogue"};
		{num = 89, mission = "35400 - 35488", desc = "Wrong Side of the Tracks Dialogue"};
		{num = 134, mission = "35600 - 35733", desc = "Just Business Dialogue"};
		{num = 84, mission = "35800 - 35883", desc = "Extra Big Smoke Dialogue"};
		{num = 1, mission = "36000 ", desc = "'Officer in need of backup'"};
		{num = 6, mission = "36200 - 36205", desc = "Crowd Awws/Cheers"};
		{num = 2, mission = "36400 - 36401", desc = "Stinger Strips Deploy and Reload"};
		{num = 5, mission = "36600 - 36604", desc = "Zeroing In Dialogue"};
		{num = 61, mission = "36800 - 36860", desc = "Test Drive Dialogue"};
		{num = 36, mission = "37000 - 37035", desc = "Customs Fast Track Dialogue"};
		{num = 46, mission = "37200 - 37245", desc = "Puncture Wounds and Test Drive Dialogue"};
		{num = 95, mission = "37400 - 37494", desc = "Tagging Up Turf and Cleaning the Hood Dialogue"};
		{num = 82, mission = "37600 - 37681", desc = "Drive Thru Dialogue"};
		{num = 74, mission = "37800 - 37873", desc = "Nines and AK's Dialogue"};
		{num = 61, mission = "38000 - 38060", desc = "Drive-By Dialogue"};
		{num = 39, mission = "38200 - 38238", desc = "Sweet's Girl Dialogue"};
		{num = 72, mission = "38400 - 38471", desc = "Los Sepulcros Dialogue"};
		{num = 45, mission = "38600 - 38644", desc = "Extra Sweet Dialogue"};
		{num = 55, mission = "38800 - 38854", desc = "Photo Opportunity Dialogue"};
		{num = 79, mission = "39000 - 39078", desc = "Jizzy Dialogue"};
		{num = 24, mission = "39200 - 39223", desc = "Outrider Dialogue"};
		{num = 14, mission = "39400 - 39413", desc = "Ice Cold Killa Dialogue"};
		{num = 68, mission = "39600 - 39667", desc = "Pier 69 Dialogue"};
		{num = 16, mission = "39800 - 39815", desc = "Yay Ka Boom-Boom Dialogue"};
		{num = 1, mission = "40000 ", desc = "Tattoo needle"};
		{num = 39, mission = "40200 - 40238", desc = "Extra T-Bone Dialogue"};
		{num = 9, mission = "40400 - 40408", desc = "They Come From Uranus SFX"};
		{num = 1, mission = "40600 ", desc = "'Green Goo Hum'"};
		{num = 21, mission = "40800 - 40820", desc = "Extra Toreno Dialogue"};
		{num = 43, mission = "41000 - 41042", desc = "Body Harvest Dialogue"};
		{num = 73, mission = "41200 - 41272", desc = "Are You Going to San Fierro Dialogue"};
		{num = 33, mission = "41400 - 41432", desc = "Extra Truth Dialogue"};
		{num = 5, mission = "41600 - 41604", desc = "Blast Door SFX"};
		{num = 1, mission = "41800 ", desc = "Security Alarm"};
		{num = 12, mission = "42000 - 42011", desc = "Valet Dialogue"};
		{num = 9, mission = "42200 - 42208", desc = "Misappropriation Dialogue"};
		{num = 25, mission = "42400 - 42424", desc = "High Noon Dialogue"};
		{num = 2, mission = "42600 - 42601", desc = "Snack Machine SFX"};
		{num = 4, mission = "42800 - 42803", desc = "Lift Sounds and Security Alarm"};
		{num = 2, mission = "43000 - 43001", desc = "Video Poker SFX"};
		{num = 7, mission = "43200 - 43206", desc = "New Game Voiceovers"};
		{num = 8, mission = "43400 - 43407", desc = "Gym Challenge Dialogue (White Boxer)"};
		{num = 65, mission = "43600 - 43664", desc = "Female Croupier 2 Dialogue (Roulette/WOF)"};
		{num = 106, mission = "43800 - 43905", desc = "Mountain Cloud Boys Dialogue"};
		{num = 108, mission = "44000 - 44107", desc = "Amphibious Assault Dialogue"};
		{num = 48, mission = "44200 - 44247", desc = "The Da Nang Thang Dialogue"};
		{num = 45, mission = "44400 - 44444", desc = "Extra Woozie Dialogue"};
		{num = 32, mission = "44600 - 44631", desc = "Air Raid Dialogue"};
		{num = 21, mission = "44800 - 44820", desc = "Supply Lines Dialogue"};
		{num = 12, mission = "45000 - 45011", desc = "Tanked Up Dialogue (Unused)"};
		{num = 56, mission = "45200 - 45255", desc = "New Model Army Dialogue"};
		{num = 1, mission = "45400 ", desc = "'Blip Detected'"};
	};
	spc_ea = {
		{num = 37, desc = "VOICE_EMG_ARMY1"};
		{num = 38, desc = "VOICE_EMG_ARMY2"};
		{num = 41, desc = "VOICE_EMG_ARMY3"};
		{num = 62, desc = "VOICE_EMG_EMT1"};
		{num = 62, desc = "VOICE_EMG_EMT2"};
		{num = 68, desc = "VOICE_EMG_EMT3"};
		{num = 54, desc = "VOICE_EMG_EMT4"};
		{num = 37, desc = "VOICE_EMG_EMT5"};
		{num = 37, desc = "VOICE_EMG_FBI2"};
		{num = 51, desc = "VOICE_EMG_FBI3"};
		{num = 53, desc = "VOICE_EMG_FBI4"};
		{num = 42, desc = "VOICE_EMG_FBI5"};
		{num = 42, desc = "VOICE_EMG_FBI6"};
		{num = 110, desc = "VOICE_EMG_LAPD1"};
		{num = 78, desc = "VOICE_EMG_LAPD2"};
		{num = 126, desc = "VOICE_EMG_LAPD3"};
		{num = 95, desc = "VOICE_EMG_LAPD4"};
		{num = 95, desc = "VOICE_EMG_LAPD5"};
		{num = 134, desc = "VOICE_EMG_LAPD6"};
		{num = 126, desc = "VOICE_EMG_LAPD7"};
		{num = 94, desc = "VOICE_EMG_LAPD8"};
		{num = 121, desc = "VOICE_EMG_LVPD1"};
		{num = 134, desc = "VOICE_EMG_LVPD2"};
		{num = 93, desc = "VOICE_EMG_LVPD3"};
		{num = 97, desc = "VOICE_EMG_LVPD4"};
		{num = 81, desc = "VOICE_EMG_LVPD5"};
		{num = 93, desc = "VOICE_EMG_MCOP1"};
		{num = 89, desc = "VOICE_EMG_MCOP2"};
		{num = 86, desc = "VOICE_EMG_MCOP3"};
		{num = 62, desc = "VOICE_EMG_MCOP4"};
		{num = 86, desc = "VOICE_EMG_MCOP5"};
		{num = 83, desc = "VOICE_EMG_MCOP6"};
		{num = 27, desc = "VOICE_EMG_PULASKI"};
		{num = 108, desc = "VOICE_EMG_RCOP1"};
		{num = 113, desc = "VOICE_EMG_RCOP2"};
		{num = 111, desc = "VOICE_EMG_RCOP3"};
		{num = 113, desc = "VOICE_EMG_RCOP4"};
		{num = 72, desc = "VOICE_EMG_SFPD1"};
		{num = 111, desc = "VOICE_EMG_SFPD2"};
		{num = 74, desc = "VOICE_EMG_SFPD3"};
		{num = 121, desc = "VOICE_EMG_SFPD4"};
		{num = 140, desc = "VOICE_EMG_SFPD5"};
		{num = 51, desc = "VOICE_EMG_SWAT1"};
		{num = 45, desc = "VOICE_EMG_SWAT2"};
		{num = 30, desc = "VOICE_EMG_SWAT4"};
		{num = 22, desc = "VOICE_EMG_SWAT6"};
	};
	spc_fa = {
		{num = 380, desc = "VOICE_GFD_BARBARA"};
		{num = 41, desc = "VOICE_GFD_BMOBAR (Old Reece)"};
		{num = 46, desc = "VOICE_GFD_BMYBARB (Macisla Barber)"};
		{num = 60, desc = "VOICE_GFD_BMYTATT (Tattoo Guy)"};
		{num = 99, desc = "VOICE_GFD_CATALINA"};
		{num = 349, desc = "VOICE_GFD_DENISE"};
		{num = 373, desc = "VOICE_GFD_HELENA"};
		{num = 299, desc = "VOICE_GFD_KATIE"};
		{num = 383, desc = "VOICE_GFD_MICHELLE"};
		{num = 308, desc = "VOICE_GFD_MILLIE"};
		{num = 108, desc = "VOICE_GFD_POL_ANN (Heli/Boat Cops)"};
		{num = 34, desc = "VOICE_GFD_WFYBURG (Burger Shot)"};
		{num = 35, desc = "VOICE_GFD_WFYCLOT (Female Clothier)"};
		{num = 75, desc = "VOICE_GFD_WMYAMMO (Ammunation)"};
		{num = 46, desc = "VOICE_GFD_WMYBARB (Epsilon Barber)"};
		{num = 38, desc = "VOICE_GFD_WMYBELL (Cluckin Bell)"};
		{num = 25, desc = "VOICE_GFD_WMYCLOT (Male Clothier)"};
		{num = 42, desc = "VOICE_GFD_WMYPIZZ (Pizza Stack)"};
	};
	spc_ga = {
		{num = 76, desc = "VOICE_GEN_BBDYG1"};
		{num = 75, desc = "VOICE_GEN_BBDYG2"};
		{num = 243, desc = "VOICE_GEN_BFORI"};
		{num = 225, desc = "VOICE_GEN_BFOST"};
		{num = 111, desc = "VOICE_GEN_BFYBE"};
		{num = 214, desc = "VOICE_GEN_BFYBU"};
		{num = 15, desc = "VOICE_GEN_BFYCRP"};
		{num = 238, desc = "VOICE_GEN_BFYPRO"};
		{num = 229, desc = "VOICE_GEN_BFYRI"};
		{num = 239, desc = "VOICE_GEN_BFYST"};
		{num = 142, desc = "VOICE_GEN_BIKDRUG"};
		{num = 142, desc = "VOICE_GEN_BIKERA"};
		{num = 117, desc = "VOICE_GEN_BIKERB"};
		{num = 82, desc = "VOICE_GEN_BMOCD"};
		{num = 198, desc = "VOICE_GEN_BMORI"};
		{num = 100, desc = "VOICE_GEN_BMOSEC"};
		{num = 209, desc = "VOICE_GEN_BMOST"};
		{num = 143, desc = "VOICE_GEN_BMOTR1"};
		{num = 195, desc = "VOICE_GEN_BMYAP"};
		{num = 125, desc = "VOICE_GEN_BMYBE"};
		{num = 99, desc = "VOICE_GEN_BMYBOUN"};
		{num = 37, desc = "VOICE_GEN_BMYBOX"};
		{num = 246, desc = "VOICE_GEN_BMYBU"};
		{num = 15, desc = "VOICE_GEN_BMYCG"};
		{num = 42, desc = "VOICE_GEN_BMYCON"};
		{num = 227, desc = "VOICE_GEN_BMYCR"};
		{num = 161, desc = "VOICE_GEN_BMYDJ"};
		{num = 164, desc = "VOICE_GEN_BMYDRUG"};
		{num = 45, desc = "VOICE_GEN_BMYMOUN"};
		{num = 20, desc = "VOICE_GEN_BMYPOL1"};
		{num = 20, desc = "VOICE_GEN_BMYPOL2"};
		{num = 228, desc = "VOICE_GEN_BMYRI"};
		{num = 217, desc = "VOICE_GEN_BMYST"};
		{num = 167, desc = "VOICE_GEN_BYMPI"};
		{num = 132, desc = "VOICE_GEN_CWFOFR"};
		{num = 111, desc = "VOICE_GEN_CWFOHB"};
		{num = 183, desc = "VOICE_GEN_CWFYFR1"};
		{num = 151, desc = "VOICE_GEN_CWFYFR2"};
		{num = 164, desc = "VOICE_GEN_CWFYHB1"};
		{num = 177, desc = "VOICE_GEN_CWMOFR1"};
		{num = 103, desc = "VOICE_GEN_CWMOHB1"};
		{num = 178, desc = "VOICE_GEN_CWMOHB2"};
		{num = 218, desc = "VOICE_GEN_CWMYFR"};
		{num = 187, desc = "VOICE_GEN_CWMYHB1"};
		{num = 142, desc = "VOICE_GEN_CWMYHB2"};
		{num = 148, desc = "VOICE_GEN_DNFOLC1"};
		{num = 129, desc = "VOICE_GEN_DNFOLC2"};
		{num = 202, desc = "VOICE_GEN_DNFYLC"};
		{num = 187, desc = "VOICE_GEN_DNMOLC1"};
		{num = 213, desc = "VOICE_GEN_DNMOLC2"};
		{num = 205, desc = "VOICE_GEN_DNMYLC"};
		{num = 179, desc = "VOICE_GEN_DWFOLC"};
		{num = 206, desc = "VOICE_GEN_DWFYLC1"};
		{num = 170, desc = "VOICE_GEN_DWFYLC2"};
		{num = 177, desc = "VOICE_GEN_DWMOLC1"};
		{num = 143, desc = "VOICE_GEN_DWMOLC2"};
		{num = 128, desc = "VOICE_GEN_DWMYLC1"};
		{num = 190, desc = "VOICE_GEN_DWMYLC2"};
		{num = 142, desc = "VOICE_GEN_HFORI"};
		{num = 181, desc = "VOICE_GEN_HFOST"};
		{num = 134, desc = "VOICE_GEN_HFYBE"};
		{num = 190, desc = "VOICE_GEN_HFYPRO"};
		{num = 233, desc = "VOICE_GEN_HFYRI"};
		{num = 215, desc = "VOICE_GEN_HFYST"};
		{num = 248, desc = "VOICE_GEN_HMORI"};
		{num = 222, desc = "VOICE_GEN_HMOST"};
		{num = 133, desc = "VOICE_GEN_HMYBE"};
		{num = 15, desc = "VOICE_GEN_HMYCM"};
		{num = 239, desc = "VOICE_GEN_HMYCR"};
		{num = 161, desc = "VOICE_GEN_HMYDRUG"};
		{num = 236, desc = "VOICE_GEN_HMYRI"};
		{num = 233, desc = "VOICE_GEN_HMYST"};
		{num = 223, desc = "VOICE_GEN_IMYST"};
		{num = 155, desc = "VOICE_GEN_IRFYST"};
		{num = 135, desc = "VOICE_GEN_IRMYST"};
		{num = 20, desc = "VOICE_GEN_MAFFA"};
		{num = 17, desc = "VOICE_GEN_MAFFB"};
		{num = 235, desc = "VOICE_GEN_MALE01"};
		{num = 1, desc = "VOICE_GEN_NOVOICE"};
		{num = 111, desc = "VOICE_GEN_OFORI"};
		{num = 190, desc = "VOICE_GEN_OFOST"};
		{num = 194, desc = "VOICE_GEN_OFYRI"};
		{num = 231, desc = "VOICE_GEN_OFYST"};
		{num = 8, desc = "VOICE_GEN_OMOBOAT"};
		{num = 22, desc = "VOICE_GEN_OMOKUNG"};
		{num = 248, desc = "VOICE_GEN_OMORI"};
		{num = 109, desc = "VOICE_GEN_OMOST"};
		{num = 236, desc = "VOICE_GEN_OMYRI"};
		{num = 249, desc = "VOICE_GEN_OMYST"};
		{num = 222, desc = "VOICE_GEN_SBFORI"};
		{num = 183, desc = "VOICE_GEN_SBFOST"};
		{num = 182, desc = "VOICE_GEN_SBFYPRO"};
		{num = 138, desc = "VOICE_GEN_SBFYRI"};
		{num = 238, desc = "VOICE_GEN_SBFYST"};
		{num = 13, desc = "VOICE_GEN_SBFYSTR"};
		{num = 74, desc = "VOICE_GEN_SBMOCD"};
		{num = 189, desc = "VOICE_GEN_SBMORI"};
		{num = 181, desc = "VOICE_GEN_SBMOST"};
		{num = 166, desc = "VOICE_GEN_SBMOTR1"};
		{num = 126, desc = "VOICE_GEN_SBMOTR2"};
		{num = 238, desc = "VOICE_GEN_SBMYCR"};
		{num = 207, desc = "VOICE_GEN_SBMYRI"};
		{num = 182, desc = "VOICE_GEN_SBMYST"};
		{num = 141, desc = "VOICE_GEN_SBMYTR3"};
		{num = 211, desc = "VOICE_GEN_SFYPRO"};
		{num = 255, desc = "VOICE_GEN_SHFYPRO"};
		{num = 263, desc = "VOICE_GEN_SHMYCR"};
		{num = 250, desc = "VOICE_GEN_SMYST"};
		{num = 223, desc = "VOICE_GEN_SMYST2"};
		{num = 133, desc = "VOICE_GEN_SOFORI"};
		{num = 237, desc = "VOICE_GEN_SOFOST"};
		{num = 180, desc = "VOICE_GEN_SOFYBU"};
		{num = 144, desc = "VOICE_GEN_SOFYRI"};
		{num = 184, desc = "VOICE_GEN_SOFYST"};
		{num = 148, desc = "VOICE_GEN_SOMOBU"};
		{num = 208, desc = "VOICE_GEN_SOMORI"};
		{num = 164, desc = "VOICE_GEN_SOMOST"};
		{num = 131, desc = "VOICE_GEN_SOMYAP"};
		{num = 155, desc = "VOICE_GEN_SOMYBU"};
		{num = 190, desc = "VOICE_GEN_SOMYRI"};
		{num = 189, desc = "VOICE_GEN_SOMYST"};
		{num = 228, desc = "VOICE_GEN_SWFOPRO"};
		{num = 137, desc = "VOICE_GEN_SWFORI"};
		{num = 206, desc = "VOICE_GEN_SWFOST"};
		{num = 235, desc = "VOICE_GEN_SWFYRI"};
		{num = 250, desc = "VOICE_GEN_SWFYST"};
		{num = 13, desc = "VOICE_GEN_SWFYSTR"};
		{num = 80, desc = "VOICE_GEN_SWMOCD"};
		{num = 135, desc = "VOICE_GEN_SWMORI"};
		{num = 243, desc = "VOICE_GEN_SWMOST"};
		{num = 159, desc = "VOICE_GEN_SWMOTR1"};
		{num = 105, desc = "VOICE_GEN_SWMOTR2"};
		{num = 135, desc = "VOICE_GEN_SWMOTR3"};
		{num = 158, desc = "VOICE_GEN_SWMOTR4"};
		{num = 170, desc = "VOICE_GEN_SWMOTR5"};
		{num = 242, desc = "VOICE_GEN_SWMYCR"};
		{num = 215, desc = "VOICE_GEN_SWMYHP1"};
		{num = 142, desc = "VOICE_GEN_SWMYHP2"};
		{num = 212, desc = "VOICE_GEN_SWMYRI"};
		{num = 234, desc = "VOICE_GEN_SWMYST"};
		{num = 180, desc = "VOICE_GEN_VBFYPRO"};
		{num = 14, desc = "VOICE_GEN_VBFYST2"};
		{num = 85, desc = "VOICE_GEN_VBMOCD"};
		{num = 238, desc = "VOICE_GEN_VBMYCR"};
		{num = 165, desc = "VOICE_GEN_VBMYELV"};
		{num = 205, desc = "VOICE_GEN_VHFYPRO"};
		{num = 14, desc = "VOICE_GEN_VHFYST3"};
		{num = 225, desc = "VOICE_GEN_VHMYCR"};
		{num = 159, desc = "VOICE_GEN_VHMYELV"};
		{num = 197, desc = "VOICE_GEN_VIMYELV"};
		{num = 234, desc = "VOICE_GEN_VWFYPRO"};
		{num = 13, desc = "VOICE_GEN_VWFYST1"};
		{num = 21, desc = "VOICE_GEN_VWFYWAI"};
		{num = 175, desc = "VOICE_GEN_VWMOTR1"};
		{num = 144, desc = "VOICE_GEN_VWMOTR2"};
		{num = 135, desc = "VOICE_GEN_VWMYAP"};
		{num = 15, desc = "VOICE_GEN_VWMYBJD"};
		{num = 81, desc = "VOICE_GEN_VWMYCD"};
		{num = 183, desc = "VOICE_GEN_VWMYCR"};
		{num = 5, desc = "VOICE_GEN_WFOPJ"};
		{num = 239, desc = "VOICE_GEN_WFORI"};
		{num = 169, desc = "VOICE_GEN_WFOST"};
		{num = 126, desc = "VOICE_GEN_WFYBE"};
		{num = 244, desc = "VOICE_GEN_WFYBU"};
		{num = 9, desc = "VOICE_GEN_WFYCRK"};
		{num = 15, desc = "VOICE_GEN_WFYCRP"};
		{num = 88, desc = "VOICE_GEN_WFYJG"};
		{num = 135, desc = "VOICE_GEN_WFYLG"};
		{num = 211, desc = "VOICE_GEN_WFYPRO"};
		{num = 241, desc = "VOICE_GEN_WFYRI"};
		{num = 168, desc = "VOICE_GEN_WFYRO"};
		{num = 206, desc = "VOICE_GEN_WFYST"};
		{num = 28, desc = "VOICE_GEN_WFYSTEW"};
		{num = 39, desc = "VOICE_GEN_WMOMIB"};
		{num = 7, desc = "VOICE_GEN_WMOPJ"};
		{num = 15, desc = "VOICE_GEN_WMOPREA"};
		{num = 188, desc = "VOICE_GEN_WMORI"};
		{num = 27, desc = "VOICE_GEN_WMOSCI"};
		{num = 230, desc = "VOICE_GEN_WMOST"};
		{num = 175, desc = "VOICE_GEN_WMOTR1"};
		{num = 105, desc = "VOICE_GEN_WMYBE"};
		{num = 42, desc = "VOICE_GEN_WMYBMX"};
		{num = 89, desc = "VOICE_GEN_WMYBOUN"};
		{num = 37, desc = "VOICE_GEN_WMYBOX"};
		{num = 104, desc = "VOICE_GEN_WMYBP"};
		{num = 209, desc = "VOICE_GEN_WMYBU"};
		{num = 107, desc = "VOICE_GEN_WMYCD1"};
		{num = 98, desc = "VOICE_GEN_WMYCD2"};
		{num = 56, desc = "VOICE_GEN_WMYCH"};
		{num = 233, desc = "VOICE_GEN_WMYCON"};
		{num = 254, desc = "VOICE_GEN_WMYCONB"};
		{num = 210, desc = "VOICE_GEN_WMYCR"};
		{num = 139, desc = "VOICE_GEN_WMYDRUG"};
		{num = 40, desc = "VOICE_GEN_WMYGAR"};
		{num = 88, desc = "VOICE_GEN_WMYGOL1"};
		{num = 72, desc = "VOICE_GEN_WMYGOL2"};
		{num = 84, desc = "VOICE_GEN_WMYJG"};
		{num = 33, desc = "VOICE_GEN_WMYLG"};
		{num = 67, desc = "VOICE_GEN_WMYMECH"};
		{num = 45, desc = "VOICE_GEN_WMYMOUN"};
		{num = 29, desc = "VOICE_GEN_WMYPLT"};
		{num = 254, desc = "VOICE_GEN_WMYRI"};
		{num = 70, desc = "VOICE_GEN_WMYRO"};
		{num = 91, desc = "VOICE_GEN_WMYSGRD"};
		{num = 76, desc = "VOICE_GEN_WMYSKAT"};
		{num = 241, desc = "VOICE_GEN_WMYST"};
		{num = 213, desc = "VOICE_GEN_WMYTX1"};
		{num = 212, desc = "VOICE_GEN_WMYTX2"};
		{num = 49, desc = "VOICE_GEN_WMYVA"};
	};
	spc_na = {
		{num = 294, desc = "VOICE_GNG_BALLAS1"};
		{num = 341, desc = "VOICE_GNG_BALLAS2"};
		{num = 268, desc = "VOICE_GNG_BALLAS3"};
		{num = 289, desc = "VOICE_GNG_BALLAS4"};
		{num = 339, desc = "VOICE_GNG_BALLAS5"};
		{num = 83, desc = "VOICE_GNG_BIG_BEAR"};
		{num = 188, desc = "VOICE_GNG_CESAR"};
		{num = 384, desc = "VOICE_GNG_DNB1"};
		{num = 350, desc = "VOICE_GNG_DNB2"};
		{num = 335, desc = "VOICE_GNG_DNB3"};
		{num = 355, desc = "VOICE_GNG_DNB5"};
		{num = 39, desc = "VOICE_GNG_DWAINE"};
		{num = 350, desc = "VOICE_GNG_FAM1"};
		{num = 377, desc = "VOICE_GNG_FAM2"};
		{num = 395, desc = "VOICE_GNG_FAM3"};
		{num = 374, desc = "VOICE_GNG_FAM4"};
		{num = 398, desc = "VOICE_GNG_FAM5"};
		{num = 42, desc = "VOICE_GNG_JIZZY"};
		{num = 388, desc = "VOICE_GNG_LSV1"};
		{num = 334, desc = "VOICE_GNG_LSV2"};
		{num = 392, desc = "VOICE_GNG_LSV3"};
		{num = 323, desc = "VOICE_GNG_LSV4"};
		{num = 336, desc = "VOICE_GNG_LSV5"};
		{num = 43, desc = "VOICE_GNG_MACCER"};
		{num = 27, desc = "VOICE_GNG_MAFBOSS"};
		{num = 30, desc = "VOICE_GNG_OGLOC"};
		{num = 101, desc = "VOICE_GNG_RYDER"};
		{num = 372, desc = "VOICE_GNG_SFR1"};
		{num = 357, desc = "VOICE_GNG_SFR2"};
		{num = 299, desc = "VOICE_GNG_SFR3"};
		{num = 200, desc = "VOICE_GNG_SFR4"};
		{num = 284, desc = "VOICE_GNG_SFR5"};
		{num = 98, desc = "VOICE_GNG_SMOKE"};
		{num = 142, desc = "VOICE_GNG_STRI1"};
		{num = 151, desc = "VOICE_GNG_STRI2"};
		{num = 133, desc = "VOICE_GNG_STRI4"};
		{num = 146, desc = "VOICE_GNG_STRI5"};
		{num = 127, desc = "VOICE_GNG_SWEET"};
		{num = 71, desc = "VOICE_GNG_TBONE"};
		{num = 53, desc = "VOICE_GNG_TORENO"};
		{num = 77, desc = "VOICE_GNG_TRUTH"};
		{num = 349, desc = "VOICE_GNG_VLA1"};
		{num = 387, desc = "VOICE_GNG_VLA2"};
		{num = 373, desc = "VOICE_GNG_VLA3"};
		{num = 353, desc = "VOICE_GNG_VLA4"};
		{num = 389, desc = "VOICE_GNG_VLA5"};
		{num = 142, desc = "VOICE_GNG_VMAFF1"};
		{num = 136, desc = "VOICE_GNG_VMAFF2"};
		{num = 146, desc = "VOICE_GNG_VMAFF3"};
		{num = 136, desc = "VOICE_GNG_VMAFF4"};
		{num = 136, desc = "VOICE_GNG_VMAFF5"};
		{num = 91, desc = "VOICE_GNG_WOOZIE"};
	};
	spc_pa = {
		{num = 128, desc = "VOICE_PLY_AG (CJ Responses)<br>001-005: Apologies<br>006-015: to Police<br>016-030: Fighting and Traffic Accidents<br>031-038: to Drug Dealers<br>039-056: More fighting and/or dealers<br>057-062: Bike-jacking<br>063-076: Car-jacking<br>077-082: Recruiting<br>083-098: ??Directing Recruits<br>099-103: Taking money<br>104-106: GSF Declarations<br>107-111: Threats<br>112-117: Taunts<br>118-121: Pointing something out<br>122-124: Negatives<br>125-128: Positives"};
		{num = 124, desc = "VOICE_PLY_AG2 (CJ Responses) similar layout to first bank but not always the same number of sounds"};
		{num = 157, desc = "VOICE_PLY_AR (CJ Responses) similar layout to first bank but not always the same number of sounds)"};
		{num = 145, desc = "VOICE_PLY_AR2 (CJ Responses) see above, includes date starting comments and gambling)"};
		{num = 293, desc = "VOICE_PLY_CD (CJ Responses) like bank 4"};
		{num = 267, desc = "VOICE_PLY_CD2 (Fat CJ Responses)"};
		{num = 285, desc = "VOICE_PLY_CF (Fat CJ Responses)"};
		{num = 253, desc = "VOICE_PLY_CF2 (Fat CJ Responses)"};
		{num = 361, desc = "VOICE_PLY_CG (CJ Responses)"};
		{num = 331, desc = "VOICE_PLY_CG2 (CJ Responses)"};
		{num = 400, desc = "VOICE_PLY_CR (CJ Responses)"};
		{num = 400, desc = "VOICE_PLY_CR2 (CJ Responses)"};
		{num = 8, desc = "VOICE_PLY_PG (??Directing Recruits)"};
		{num = 8, desc = "VOICE_PLY_PG2 (??Directing Recruits)"};
		{num = 85, desc = "VOICE_PLY_PR (CJ Responses)"};
		{num = 76, desc = "VOICE_PLY_PR2 (CJ Responses)"};
		{num = 201, desc = "VOICE_PLY_WG (CJ Responses)"};
		{num = 187, desc = "VOICE_PLY_WG2 (CJ Responses)"};
		{num = 203, desc = "VOICE_PLY_WR (CJ Responses)"};
		{num = 196, desc = "VOICE_PLY_WR2 (CJ Responses)"};
	};
}