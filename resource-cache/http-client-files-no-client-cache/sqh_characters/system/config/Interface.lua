
--[[

░░██╗  ░██████╗░██████╗░██╗░░░██╗░█████╗░░██████╗██╗░░██╗   ░█████╗░░█████╗░██████╗░███████╗░██████╗ ░░░░██╗ ██╗░░
░██╔╝  ██╔════╝██╔═══██╗██║░░░██║██╔══██╗██╔════╝██║░░██║   ██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝ ░░░██╔╝ ╚██╗░
██╔╝░  ╚█████╗░██║██╗██║██║░░░██║███████║╚█████╗░███████║   ██║░░╚═╝██║░░██║██║░░██║█████╗░░╚█████╗░ ░░██╔╝ ░░╚██╗
╚██╗░  ░╚═══██╗╚██████╔╝██║░░░██║██╔══██║░╚═══██╗██╔══██║   ██║░░██╗██║░░██║██║░░██║██╔══╝░░░╚═══██╗ ░██╔╝ ░░░██╔╝
░╚██╗  ██████╔╝░╚═██╔═╝░╚██████╔╝██║░░██║██████╔╝██║░░██║   ╚█████╔╝╚█████╔╝██████╔╝███████╗██████╔╝ ██╔╝░ ░░██╔╝░
░░╚═╝  ╚═════╝░░░░╚═╝░░░░╚═════╝░╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝   ░╚════╝░░╚════╝░╚═════╝░╚══════╝╚═════╝░ ╚═╝░░ ░░╚═╝░░
]]--

--[[
	Caso precise de qualquer suporte com a config, crie um ticket em nosso discord que responderemos o mais rápido possível
]]

interface = {
	messagesConfig = {
		typeMessage = 'Chat', --[[ 'Exports' ou 'Chat']]
		notifyServer = function(source, message, type) -- Coloque aqui a função de infobox do seu servidor  Coloque o exports do lado client!
			exports["infobox"]:callInfo(source, type, message)
		end, 
		notifyClient = function(message, type) -- Coloque aqui a função de infobox do seu servidor / Coloque o exports do lado server!
			exports["infobox"]:callInfo(type, message)
		end,
	},

	creationpanel = {
		rgbselected = {95, 21, 191, 255}, -- R,G,B de quando alguma roupa / customização estiver selecionada 
		rgbprincipal = {129, 89, 247, 200}, -- R, G, B, ALPHA principal do painel 
		rgbsecundario = {255, 255, 255}, -- R, G, B secundário do painel 
		rgbbackground = {23, 23, 23, 170}, -- R, G, B, ALPHA background do painel 
		rgbrectangle = {0, 0, 0, 170}, -- R, G, B, ALPHA dos retangulos do painel 

		cameraposition = {  x = 377.73001098633, y = -2028.4830322266, z = 8.4961004257202, rx = 378.7297668457, ry = -2028.4970703125, rz = 8.4789133071899 }, --[[ Posição da câmera ]]
		camerazoomposition = {x = 382.1462097168, y = -2028.4344482422, z = 8.5340995788574, rx = 383.125, ry = -2028.6278076172, rz = 8.4664249420166 },
		pedposition = { x = 384.331, y = -2028.710, z = 7.836 }, -- Posição no mapa do jogador 
		pedrotation = { x = -0, y = 0 , z = 91.917610168457 }, -- Posição no mapa do jogador 
		confirmposition = { x = 823.00513, y =  -1352.86414, z = 13.53490, dim = 0, int = 0}, -- Posição que o jogador será setado após criar o personagem

		messages = { -- Você pode usar códigos HEX 
			accountcreated = {'#FFFFFFSua conta foi criada com sucesso', 'success'}, -- Mensagem quando o jogador clicar em confirmar no painel de criação do personagem
			genderselected = {'#FFFFFFVocê escolheu seu gênero com sucesso, agora customize seu personagem', 'success'} -- Mensagem quando o jogador escolher o genêro na criação do personagem
		},

		circles = {
			skintone = {
				['1'] = { 253, 208, 183 }, -- Cor do círculo da skintone 01
				['2'] = { 237, 180, 156 },-- Cor do círculo da skintone 02
				['3'] = { 142, 90, 71 },-- Cor do círculo da skintone 03
				['4'] = { 105, 69, 56 },-- Cor do círculo da skintone 04
				['5'] = { 75, 54, 46 },-- Cor do círculo da skintone 05
				['6'] = { 56, 43, 38 }-- Cor do círculo da skintone 06
			},
		},

		customizeoptions = {
			['male'] = {
				[1] = {
					title = 'Cor dos olhos',
					options = { -- Name // Parte do corpo // Modelo // Textura
						{'Verde-escuro', 'facehead', 'eyes', 1, true},
						{'Azul-escuro ', 'facehead', 'eyes', 2, true},
						{'Castanho', 'facehead', 'eyes', 3, true},
						{'Verde-claro', 'facehead', 'eyes', 4, true},
						{'Lilás', 'facehead', 'eyes', 5, true},
						{'Cinza', 'facehead', 'eyes', 6, true},
						{'Branco', 'facehead', 'eyes', 7, true},
					},
				},
				[2] = {
					title = 'Pelos faciais',
					options = { -- Name // Parte do corpo // Modelo // Textura 
						{'Nenhum', 'head', 0, 0, true},
						{'Trançado grande', 'head', 'Cabelo1', 1, true},
						{'Moicano médio', 'head', 'Cabelo2', 1, true},
						{'Liso médio', 'head', 'Cabelo4', 1, true},
					},
				},
				[3] = {
					title = false,
					options = { -- Name // Parte do corpo // Modelo // Textura
						{'Nenhum', 'facehead', 'beard', 0, true},
						{'Barba 01', 'facehead', 'beard', 1, true},
						{'Barba 02', 'facehead', 'beard', 2, true},
						{'Barba 03', 'facehead', 'beard', 3, true},
						{'Barba 04', 'facehead', 'beard', 4, true},
						{'Barba 05', 'facehead', 'beard', 5, true},
						{'Barba 06', 'facehead', 'beard', 6, true},
						{'Barba 07', 'facehead', 'beard', 7, true},
						{'Barba 08', 'facehead', 'beard', 8, true},
						{'Barba 09', 'facehead', 'beard', 9, true},
						{'Barba 10', 'facehead', 'beard', 10, true},
						{'Barba 11', 'facehead', 'beard', 11, true},
						{'Barba 12', 'facehead', 'beard', 12, true},
						{'Barba 13', 'facehead', 'beard', 13, true},
						{'Barba 14', 'facehead', 'beard', 14, true},
					},
				},
				[4] = {
					title = false,
					options = { -- Name // Parte do corpo // Modelo // Textura
						{'Nenhum', 'facehead', 'eyebrow', 0, true},
						{'Sombrancelha 01', 'facehead', 'eyebrow', 1, true},
						{'Sombrancelha 02', 'facehead', 'eyebrow', 2, true},
						{'Sombrancelha 03', 'facehead', 'eyebrow', 3, true},
						{'Sombrancelha 04', 'facehead', 'eyebrow', 4, true},
						{'Sombrancelha 05', 'facehead', 'eyebrow', 5, true},
						{'Sombrancelha 06', 'facehead', 'eyebrow', 6, true},
						{'Sombrancelha 07', 'facehead', 'eyebrow', 7, true},
						{'Sombrancelha 08', 'facehead', 'eyebrow', 8, true},
						{'Sombrancelha 09', 'facehead', 'eyebrow', 9, true},
					},
				},
				[5] = {
					title = 'Roupas iniciais',
					options = { -- Name // Parte do corpo // Modelo // Textura
						{'Nenhum', 'torso', 0, 0, false},
						{'Polo preta', 'torso', 'camisa.polo', 6, false},
						{'Manga-longa preta', 'torso', 'camisa.media', 1, false},
						{'Regata listrada', 'torso', 'camisa.regata', 2, false},
						{'Praiana c/ estampa', 'torso', 'camisa.praia', 1, false},
						{'Frank xadrez', 'torso', 'camisa.frank', 1, false},
						{'Moletom Diamond LS', 'torso', 'casaco.moletom', 6, false},
						{'Casaco azul', 'torso', 'casaco.frio', 7, false},
						{'Jaqueta preta', 'torso', 'casaco.jaqueta', 1, false},
					},
				},
				[6] = {
					title = false,
					options = { -- Name // Parte do corpo // Modelo // Textura
						{'Nenhum', 'legs', 'body.cueca', 1, false},
						{'Bermuda xadrez', 'legs', 'bermuda.padrao', 1, false},
						{'Bermuda cargo', 'legs', 'bermuda.camo', 3, false},
						{'Calça jeans', 'legs', 'calca.jeans', 6, false},
						{'Calça esportiva', 'legs', 'calca.larga', 2, false},
					},
				},
				[7] = {
					title = false,
					options = { -- Name // Parte do corpo // Modelo // Textura
						{'Nenhum', 'feet', 0, 0, false},
						{'Chinelo preto', 'feet', 'pe.chinelo', 1, false},
						{'Sandália cinza', 'feet', 'pe.sandalia', 6, false},
						{'Old School preto', 'feet', 'pe.tenis2', 4, false},
						{'Harg branco', 'feet', 'pe.tenis1', 1, false},
						{'Sapato social', 'feet', 'pe.sapatosocial', 1, false},
					},
				},
			},
			['female'] = {
				[1] = {
					title = 'Cor dos olhos',
					options = { -- Name // Parte do corpo // Modelo // Textura
						{'Padrão', 'facehead', 0, 0, true},
						{'Verde-Marinho', 'facehead', 'eyes', 1, true},
						{'Azul-Marinho', 'facehead', 'eyes', 2, true},
						{'Verde-claro', 'facehead', 'eyes', 3, true},
						{'Castanho', 'facehead', 'eyes', 4, true},
						{'Lilás', 'facehead', 'eyes', 5, true},
						{'Cinza', 'facehead', 'eyes', 6, true},
						{'Branco', 'facehead', 'eyes', 7, true},
					},
				},
				[2] = {
					title = 'Pelos faciais',
					options = { -- Name // Parte do corpo // Modelo // Textura
						{'Nenhum', 'head', 0, 0, true},
						{'Cabelo 01', 'head', 'hair.1', 1, true},
						{'Cabelo 02', 'head', 'hair.3', 1, true},
						{'Cabelo 03', 'head', 'hair.4', 1, true},
					},
				},
				[3] = {
					title = false,
					options = { -- Name // Parte do corpo // Modelo // Textura
						{'Nenhum', 'facehead', 'eyebrow', 0, true},
						{'Sombrancelha 01', 'facehead', 'eyebrow', 1, true},
						{'Sombrancelha 02', 'facehead', 'eyebrow', 2, true},
						{'Sombrancelha 03', 'facehead', 'eyebrow', 3, true},
						{'Sombrancelha 04', 'facehead', 'eyebrow', 4, true},
						{'Sombrancelha 05', 'facehead', 'eyebrow', 5, true},
						{'Sombrancelha 06', 'facehead', 'eyebrow', 6, true},
					},
				},
				[4] = {
					title = 'Maquiagem',
					options = { -- Name // Parte do corpo // Modelo // Textura
						{'Nenhum', 'facehead', 'lipstick', 0, true},
						{'Batom Preto', 'facehead', 'lipstick', 1, true},
						{'Batom Lilás', 'facehead', 'lipstick', 2, true},
						{'Batom Castanho', 'facehead', 'lipstick', 3, true},
						{'Batom Vermelho', 'facehead', 'lipstick', 4, true},
						{'Batom Vermelho-Choque', 'facehead', 'lipstick', 5, true},
						{'Batom Laranja', 'facehead', 'lipstick', 6, true},
						{'Batom Nude', 'facehead', 'lipstick', 8, true},
						{'Batom Vinho', 'facehead', 'lipstick', 9, true},
						{'Batom Roxo', 'facehead', 'lipstick', 10, true},
					},
				},
				[5] = {
					title = false,
					options = { -- Name // Parte do corpo // Modelo // Textura
						{'Nenhum', 'facehead', 'blush', 0, true},
						{'Blush 01', 'facehead', 'blush', 1, true},
						{'Blush 02', 'facehead', 'blush', 2, true},
						{'Blush 03', 'facehead', 'blush', 3, true},
						{'Sardas 01', 'facehead', 'blush', 4, true},
					},
				},
				[6] = {
					title = 'Roupas iniciais',
					options = { -- Name // Parte do corpo // Modelo // Textura
						{'Nenhum', 'torso', 0, 0, false},
						{'Camiseta Branca LOVE', 'torso', 'camisa.padrao', 11, false},
						{'Camiseta Preta Trasher', 'torso', 'camisa.padrao', 8, false},
						{'Topless Squash', 'torso', 'camisa.pequena', 9, false},
						{'Topless Guffy Cinza', 'torso', 'camisa.pequena', 1, false},
						{'Regata Roxa Ghost', 'torso', 'camisa.regata', 6, false},
						{'Regata Preta', 'torso', 'camisa.regata', 1, false},
					},
				},
				[7] = {
					title = false,
					options = { -- Name // Parte do corpo // Modelo // Textura
						{'Nenhum', 'legs', 0, 0, false},
						{'Saia Preta', 'legs', 'saia.padrao', 1, false},
						{'Saia Branca', 'legs', 'saia.padrao', 2, false},
						{'Calça Camo Branca', 'legs', 'calca.padrao', 3, false},
						{'Calça Camo Padrão', 'legs', 'calca.padrao', 1, false},
						{'Calça Jeans', 'legs', 'calca.padrao', 4, false},
					},
				},
				[8] = {
					title = false,
					options = { -- Name // Parte do corpo // Modelo // Textura
						{'Nenhum', 'feet', 0, 0, false},
						{'Yeazzy Boost', 'feet', 'Yeazzy', 1, false},
						{'Sandália', 'feet', 'pe.sandalia', 1, false},
						{'Bota Marrom', 'feet', 'pe.bota', 1, false},
						{'Bota Preta', 'feet', 'pe.bota', 2, false},
					},
				},
				[9] = {
					title = false,
					options = { -- Name // Parte do corpo // Modelo // Textura
						{'Nenhum', 'extra2', 0, 0, true},
						{'Óculos Branco/Preto ', 'extra2', 'oculos.padrao', 1, true},
						{'Óculos Preto/Dourado', 'extra2', 'oculos.padrao', 2, true},
						{'Óculos Preto/Rosa', 'extra2', 'oculos.padrao', 3, true},
						{'Juliete Lente Rosa', 'extra2', 'oculos.juliet', 1, true},
						{'Juliete Lente Amarela', 'extra2', 'oculos.juliet', 8, true},
						{'Juliete Lente Cinza', 'extra2', 'oculos.juliet', 6, true},
					},
				},
			},
		},
	},


	storepanel = {
		
		rgbselected = {95, 21, 191, 255}, --[[ R,G,B de quando alguma roupa / customização estiver selecionada ]]
		rgbprincipal = {129, 89, 247, 200}, --[[ R, G, B, ALPHA principal do painel ]]
		rgbsecundario = {255, 255, 255}, --[[ R, G, B secundário do painel ]]
		rgbbackground = {23, 23, 23, 170}, --[[ R, G, B, ALPHA background do painel ]]
		rgbbackground2 = {48, 48, 48, 170}, --[[ R, G, B, ALPHA background do painel ]]
		rgbheader = {15, 14, 14, 170}, --[[ R, G, B, ALPHA dos retangulos do painel ]]

		cameraposition = {  x = 377.73001098633, y = -2028.4830322266, z = 8.4961004257202, rx = 378.7297668457, ry = -2028.4970703125, rz = 8.4789133071899 }, --[[ Posição da câmera ]]
		pedposition = { x = 384.331, y = -2028.710, z = 7.836 }, --[[ Posição no mapa do jogador ]]
		pedrotation = { x = -0, y = 0 , z = 91.917610168457 }, --[[ Posição no mapa do jogador ]]

		messages = { -- Você pode usar códigos HEX 
			-- Não mexa = {'Mensagem', 'Tipo do aviso da infobox, caso esteja usando!'}
			cartempy = {'#FFFFFFColoque algo no carrinho para comprar', 'warning'}, -- Mensagem quando o jogador apertar enter e não tiver nenhuma roupa no carrinho
			buySuccessful = {'#FFFFFFVocê comprou sua roupa com sucesso', 'success'}, -- Mensagem quando a compra das roupas for bem sucedida
			notMoney = {'#FFFFFFVocê não possui dinheiro suficiente para isso', 'error'}, -- Mensagem quando o jogador não possui dinheiro suficiente para comprar as roupas
			notcompatible = {'#FFFFFFVocê não pode colocar essa roupa sem estar usando um Blazer', 'error'}, -- Mensagem quando o jogador tentar colocar a parte do meio do terno sem estar usando um blazer
		},

		storeoptions = {
			
			enterMarker = { -- X, Y, Z, Interior, Dimensão, {R, G, B, A}
				[1] = {2779, 2453, 11, 0, 0, {129, 89, 247, 200}},
				[2] = {2244.39746, -1664.97461, 15.47656, 0, 0, {129, 89, 247, 200}},
				[3] = {-1882.53687, 866.28107, 35.17188, 0, 0, {129, 89, 247, 200}},
			},
			
			enterPosition = { -- X, Y, Z, Interior, Dimensão
				[1] = {203.76163, -48.29527, 1000.91370, 1, 2}, 
				[2] = {207.62039, -109.19683, 1005.13281, 15, 2},
				[3] = {160.85002, -94.31634, 1001.80469 + 1, 18, 2},
			},

			leaveMarker = { -- X, Y, Z, Interior, Dimensão, {R, G, B, A}
				[1] = {203.96118, -50.14730, 1001.80469, 1, 2, {129, 89, 247, 200}},
				[2] = {207.77580, -111.13270, 1005.13281, 15, 2, {129, 89, 247, 200}},
				[3] = {161.30772, -97.10416, 1001.80469, 18, 2, {129, 89, 247, 200}},
			},

			leavePosition = { -- X, Y, Z, Interior, Dimensão
				[1] = {2779, 2451, 11, 0, 0}, 
				[2] = {2245, -1662, 15, 0, 0},
				[3] = {-1884, 863, 35, 0, 0},
			},

			openMarker = { -- X, Y, Z, Interior, Dimensão, {R, G, B, A}
				[1] = {203.17682, -43.27431, 1001.80469, 1, 2, {129, 89, 247, 200}},
				[2] = {206.49759, -100.46308, 1005.25781, 15, 2, {129, 89, 247, 200}},
				[3] = {159.78752, -83.25415, 1001.80469, 18, 2, {129, 89, 247, 200}}
			},

			openLeavePosition = {
				[1] = {212, -42, 1003,-0, 0, 89.086288452148, 1, 2},
				[2] = {217.15936, -100.50900, 1005.25781, -0,0,90.509590148926, 15, 2},
				[3] = {179.12054, -88.21897, 1002.02344, -0, 0, 85.929969787598, 18, 2}
			},

			pedPosition = { -- X, Y, Z, RX, RY, RZ, Interior, Dimensão
				[1] = {212, -42, 1003,-0, 0, 89.086288452148, 1, 2},
				[2] = {217.15936, -100.50900, 1005.25781, -0,0,90.509590148926, 15, 2},
				[3] = {179.12054, -88.21897, 1002.02344, -0, 0, 85.929969787598, 18, 2}
			},

			pedCamera = { -- Cam X, Cam Y, Cam Z, Cam RX, Cam RY, Cam, RZ
				[1] = {207.60639953613,-41.873199462891,1002.3941040039,208.60575866699,-41.838081359863,1002.4016723633}, -- Cam X, Cam Y, Cam Z, Cam RX, Cam RY, Cam, RZ
				[2] = {213.09970092773,-100.48930358887,1005.8607177734,214.09925842285,-100.45945739746,1005.8585205078}, -- Cam X, Cam Y, Cam Z, Cam RX, Cam RY, Cam, RZ
				[3] = {175.20329284668,-88.357696533203,1002.3449707031,176.20217895508,-88.335266113281,1002.3863525391}, -- Cam X, Cam Y, Cam Z, Cam RX, Cam RY, Cam, RZ
			},

		
			blip = true, -- Caso esteja ativado, os blips serão criados na mesma posição dos markers de entrada da loja
			blipid = 45, -- ID do Blip
			blipdistance = 100,
		},

		-- Argumentos da tabela pages:
		-- (Index da Roupa) = {'pngfile', preço, {desctbody}}
		pages = {
			['male'] = {
				['Camisetas'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Camisa', 0, '0', '0', 'torso', false},
					[2] = {'Camiseta Will Smith (Preta)', 150, 'camisa.padrao', 1, 'torso', false},
					[3] = {'Camiseta AC/DC (Preta)', 150, 'camisa.padrao', 2, 'torso', false},
					[4] = {'Camiseta Adidas Graffiti (Preta) ', 150, 'camisa.padrao', 3, 'torso', false},
					[5] = {'Camiseta VAMTAC Eyes (Preta) ', 150, 'camisa.padrao', 4, 'torso', false},
					[6] = {'Camiseta Trasher (Preta) ', 150, 'camisa.padrao', 5, 'torso', false},
					[7] = {'Camiseta Pink Floyd (Preta) ', 150, 'camisa.padrao', 9, 'torso', false},
					[8] = {'Camiseta Trasher Espadas (Branca) ', 150, 'camisa.padrao', 6, 'torso', false},
					[9] = {'Camiseta Dragon Ball Z (Branca) ', 150, 'camisa.padrao', 7, 'torso', false},
					[10] = {'Camiseta Nike Jordan (Rosa) ', 150, 'camisa.padrao', 8, 'torso', false},
					[11] = {'Camiseta Squash Codes (Multicolor) ', 150, 'camisa.padrao', 10, 'torso', false},
					[12] = {'Camiseta Gato Renascentista (Preta)', 150, 'camisa.padrao', 11, 'torso', false},
					[13] = {'Camiseta Flamengo BS2 (Branca) ', 150, 'camisa.padrao', 12, 'torso', false},
					[14] = {'Camiseta Real Madrid (Branca)', 150, 'camisa.padrao', 13, 'torso', false},
				},
				['Camisetas manga-longa'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Camisa', 0, '0', '0', 'torso', false},
					[2] = {'Manga-longa Preta', 150, 'camisa.media', 1, 'torso', false},
					[3] = {'Manga-longa Branco/Cinza ', 150, 'camisa.media', 2, 'torso', false},
					[4] = {'Manga-longa Azul/Branco ', 150, 'camisa.media', 3, 'torso', false},
					[5] = {'Manga-longa Rosa/Branco', 150, 'camisa.media', 4, 'torso', false},
					[6] = {'Manga-longa Laranja/Branco', 150, 'camisa.media', 5, 'torso', false},
					[7] = {'Manga-longa Vermelha/Branco', 150, 'camisa.media', 6, 'torso', false},
					[8] = {'Manga-longa Ciano/Branco', 150, 'camisa.media', 7, 'torso', false},
					[9] = {'Manga-longa Amarelo/Branco', 150, 'camisa.media', 8, 'torso', false},
				},
				['Moletons'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Camisa', 0, '0', '0', 'torso', false},
					[2] = {'Moletom Lacoste (Azul)', 200, 'casaco.moletom', 1, 'torso', false},
					[3] = {'Moletom Bigness (Vermelho)', 200, 'casaco.moletom', 2, 'torso', false},
					[4] = {'Moletom Bigness (Cinza)', 200, 'casaco.moletom', 4, 'torso', false},
					[5] = {'Moletom Flying Bravo (Branco)', 200, 'casaco.moletom', 3, 'torso', false},
					[6] = {'Moletom Lacoste (Cinza)', 200, 'casaco.moletom', 5, 'torso', false},
					[7] = {'Moletom Diamond LS (Branco)', 200, 'casaco.moletom', 6, 'torso', false},
					[8] = {'Moletom Supreme NY (Preto)', 200, 'casaco.moletom', 7, 'torso', false},
					[9] = {'Moletom Cinza', 200, 'casaco.moletom', 8, 'torso', false},
				},
				['Camiseta Praiano'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Camisa', 0, '0', '0', 'torso', false},
					[2] = {'Gola praiano (Florida 01)', 150, 'camisa.praia', 1, 'torso', false},
					[3] = {'Gola praiano (Florida 02)', 150, 'camisa.praia', 2, 'torso', false},
					[4] = {'Gola praiano (Florida 03)', 150, 'camisa.praia', 3, 'torso', false},
					[5] = {'Gola praiano (Florida Cinza)', 150, 'camisa.praia', 4, 'torso', false},
					
				},
				['Regatas'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Camisa', 0, '0', '0', 'torso', false},
					[2] = {'Regata Listrada (Azul/Branco/Preto) ', 150 , 'camisa.regata', 2, 'torso', false},
					[3] = {'Regata Nike (Preta)', 150, 'camisa.regata', 3, 'torso', false},
					[4] = {'Regata Adidas (Preta)', 150, 'camisa.regata', 7, 'torso', false},
					[5] = {'Regata Salmão', 150, 'camisa.regata', 1, 'torso', false},
					[6] = {'Regata Roxa', 150, 'camisa.regata', 4, 'torso', false},
					[7] = {'Regata Azul-bebê', 150, 'camisa.regata', 5, 'torso', false},
					[8] = {'Regata Laranja', 150, 'camisa.regata', 6, 'torso', false},
				},
				['Casaco Esportivo Adidas'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Camisa', 0, '0', '0', 'torso', false},
					[2] = {'Adidas Branco', 210, 'casaco.adidas', 1, 'torso', false},
					[3] = {'Adidas Preto', 210, 'casaco.adidas', 2, 'torso', false},
					[4] = {'Adidas SquashCodes', 210, 'casaco.adidas', 3, 'torso', false},
					[5] = {'Adidas Azul', 210, 'casaco.adidas', 4, 'torso', false},
					[6] = {'Adidas Roxo', 210, 'casaco.adidas', 5, 'torso', false},
					[7] = {'Adidas Vermelho', 210, 'casaco.adidas', 6, 'torso', false},
					[8] = {'Adidas Ciano', 210, 'casaco.adidas', 7, 'torso', false},
					[9] = {'Adidas Rosa', 210, 'casaco.adidas', 8, 'torso', false},
					
				},
				['Casaco Meio-aberto'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Camisa', 0, '0', '0', 'torso', false},
					[2] = {'Estampa Camuflagem ', 150, 'casaco.frio', 1, 'torso', false},
					[3] = {'Estampa Azul/Verde ', 150, 'casaco.frio', 2, 'torso', false},
					[4] = {'Estampa Rosa ', 150, 'casaco.frio', 3, 'torso', false},
					[5] = {'Estampa GLIFE Rosa/Azul', 150, 'casaco.frio', 4, 'torso', false},
					[6] = {'Estampa ROCK KISS Cinza ', 150, 'casaco.frio', 5, 'torso', false},
					[7] = {'Estampa Azul Blob ', 150, 'casaco.frio', 6, 'torso', false},
					[8] = {'Estampa Lacoste França ', 150, 'casaco.frio', 7, 'torso', false},
					[9] = {'Estampa Camuflagem Rosa ', 150, 'casaco.frio', 8, 'torso', false},
					[10] = {'Estampa Camuflagem Azul ', 150, 'casaco.frio', 9, 'torso', false},
				},
				['Calça Jeans'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Short/Calça', 0, 'body.cueca', 1, 'legs', false},
					[2] = {'Jeans Preta ', 130, 'calca.jeans', 1, 'legs', false},
					[3] = {'Jeans Cinza', 130, 'calca.jeans', 2, 'legs', false},
					[4] = {'Jeans Azul (Flosh)', 130, 'calca.jeans', 3, 'legs', false},
					[5] = {'Jeans Preta (Flosh)', 130, 'calca.jeans', 4, 'legs', false},
					[6] = {'Jeans Padrão', 130, 'calca.jeans', 5, 'legs', false},
				},
				['Bermuda Cargo'] = {
					[1] = {'Tirar Short/Calça', 0, 'body.cueca', 1, 'legs', false},
					[2] = {'Cargo Preta Camuflada ', 130, 'bermuda.camo', 1, 'legs', false},
					[3] = {'Cargo Roxa', 130, 'bermuda.camo', 2, 'legs', false},
					[4] = {'Cargo Bege ', 130, 'bermuda.camo', 3, 'legs', false},
				},
				['Camiseta Xadrez'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Camisa', 0, '0', '0', 'torso', false},
					[2] = {'Xadrez Vermelha', 130, 'camisa.frank', 1, 'torso', false},
					[3] = {'Xadrez Bege/Marrom', 130, 'camisa.frank', 2, 'torso', false},
					[4] = {'Xadrez Amarelo/Branco', 130, 'camisa.frank', 3, 'torso', false},
					[5] = {'Xadrez Rosa/Azul ', 130, 'camisa.frank', 4, 'torso', false},
				},
				['Bermuda Tactel'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Short/Calça', 0, 'body.cueca', 1, 'legs', false},
					[2] = {'Tactel Florida Roxo', 130, 'bermuda.padrao', 1, 'legs', false},
					[3] = {'Tactel Florida Azul', 130, 'bermuda.padrao', 2, 'legs', false},
					[4] = {'Tactel Florida Laranja', 130, 'bermuda.padrao', 5, 'legs', false},
					[5] = {'Tactel Azul/Rosa', 130, 'bermuda.padrao', 3, 'legs', false},
					[6] = {'Tactel Cinza/Branco', 130, 'bermuda.padrao', 6, 'legs', false},
					[7] = {'Tactel Branco', 130, 'bermuda.padrao', 7, 'legs', false},
					[8] = {'Tactel Preto', 130, 'bermuda.padrao', 8, 'legs', false},
					[9] = {'Tactel Azul ', 130, 'bermuda.padrao', 9, 'legs', false},
					[10] = {'Tactel Xadrez', 130, 'bermuda.padrao', 4, 'legs', false},
				},
				['Calça Esportiva'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Short/Calça', 0, 'body.cueca', 1, 'legs', false},
					[2] = {'Esportiva Cinza', 130, 'calca.larga', 1, 'legs', false},
					[3] = {'Esportiva Preta', 130, 'calca.larga', 2, 'legs', false},
					[4] = {'Esportiva Azul-Escuro', 130, 'calca.larga', 3, 'legs', false},
					[5] = {'Esportiva Vermelho', 130, 'calca.larga', 4, 'legs', false},
					[6] = {'Esportiva Camuflagem Branca', 130, 'calca.larga', 5, 'legs', false},
					[7] = {'Esportiva Camuflagem', 130, 'calca.larga', 6, 'legs', false},
					[8] = {'Esportiva Azul-Claro', 130, 'calca.larga', 7, 'legs', false},
					
				},
				['Jaqueta Motorcycle'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Camisa', 0, '0', '0', 'torso', false},
					[2] = {'Jaqueta Preta ', 300, 'casaco.jaqueta', 1, 'torso', false},
					[3] = {'Jaqueta Vermelha/Azul  ', 300, 'casaco.jaqueta', 2, 'torso', false},
					[4] = {'Jaqueta Verde/Salmão  ', 300, 'casaco.jaqueta', 3, 'torso', false},
					[5] = {'Jaqueta Rosa/Verde ', 300, 'casaco.jaqueta', 4, 'torso', false},
					[6] = {'Jaqueta Laranja/Azul ', 300, 'casaco.jaqueta', 5, 'torso', false},
				},
				['Camisetas POLO'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar Camisa', 0, '0', '0', 'torso', false},
					[2] = {'Polo Azul', 300, 'camisa.polo', 1, 'torso', false},
					[3] = {'Polo Laranja', 300, 'camisa.polo', 2, 'torso', false},
					[4] = {'Polo Roxa', 300, 'camisa.polo', 3, 'torso', false},
					[5] = {'Polo Cinza', 300, 'camisa.polo', 5, 'torso', false},
					[6] = {'Polo Cinza/Preto ', 300, 'camisa.polo', 6, 'torso', false},
					[7] = {'Polo Listrada Branco/Azul ', 300, 'camisa.polo', 7, 'torso', false},
					[8] = {'Polo Preta Lacoste', 300, 'camisa.polo', 8, 'torso', false},
				},
				['Ternos'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Tirar meio do terno', 0, '0', '0', 'terno', false},
					[2] = {'Tirar Blazer', 0, '0', '0', 'torso', false},
					[3] = {'Tirar Social', 0, 'body.cueca', 1, 'legs', false},
					[4] = {'Meio do terno', 150, 'terno.meio', 1, 'terno', false},
					[5] = {'Blazer Preto Estampado', 300, 'terno.blusa', 1, 'torso', false},
					[6] = {'Blazer Preto Listrado ', 300, 'terno.blusa', 2, 'torso', false},
					[7] = {'Blazer Preto Puro ', 300, 'terno.blusa', 3, 'torso', false},
					[8] = {'Blazer Azul Puro ', 300, 'terno.blusa', 4, 'torso', false},
					[9] = {'Blazer Azul Listrado', 300, 'terno.blusa', 5, 'torso', false},
					[10] = {'Social Preto Estampado', 300, 'terno.calca', 1, 'legs', false},
					[11] = {'Social Cinza Puro', 300, 'terno.calca', 2, 'legs', false},
					[12] = {'Social Azul Puro', 300, 'terno.calca', 3, 'legs', false},
					[13] = {'Social Preto Puro', 300, 'terno.calca', 4, 'legs', false},
					[14] = {'Social Branco Puro', 300, 'terno.calca', 5, 'legs', false},
					[15] = {'Social Preto Listrado', 300, 'terno.calca', 6, 'legs', false},
					[16] = {'Social Azul Listrado', 300, 'terno.calca', 7, 'legs', false},
					[17] = {'Social Branco Amarrotado', 300, 'terno.calca', 8, 'legs', false},
					[18] = {'Social Cinza Amarrotado', 300, 'terno.calca', 9, 'legs', false},
				},
				['Sapatos'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Descalço', 0, '0', '0', 'feet', false},
					[2] = {'Sapato Social', 100, 'pe.sapatosocial', 1, 'feet', false},
				},
				['Tenis'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Descalço', 0, '0', '0', 'feet', false},
					[2] = {'Tenis Hyped Ice (Branco)', 500, 'pe.tenis1', 1, 'feet', false},
					[3] = {'Old School Amarelo', 100, 'pe.tenis2', 2, 'feet', false},
					[4] = {'Old School Branco', 100, 'pe.tenis2', 3, 'feet', false},
					[5] = {'Old School Cinza', 100, 'pe.tenis2', 4, 'feet', false},
					[6] = {'Old School Preto', 100, 'pe.tenis2', 5, 'feet', false},
					[7] = {'Old School Roxo', 100, 'pe.tenis2', 6, 'feet', false},
					[8] = {'Old School Verde', 100, 'pe.tenis2', 7, 'feet', false},
					[9] = {'Old School Verde-marinho', 100, 'pe.tenis2', 8, 'feet', false},
					[10] = {'Old School Vermelho', 100, 'pe.tenis2', 9, 'feet', false},
					[11] = {'Old School Ciano', 100, 'pe.tenis2', 10, 'feet', false},
					[12] = {'Old School Azul-bebê', 100, 'pe.tenis2', 11, 'feet', false},
					[13] = {'Old School Azul-escuro', 100, 'pe.tenis2', 12, 'feet', false},
				},
				['Sandálias'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Descalço', 0, '0', '0', 'feet', false},
					[2] = {'Chinelo de Abertura Preto', 500, 'pe.chinelo', 1, 'feet', false},
					[3] = {'Sandália Azul', 100, 'pe.sandalia', 1, 'feet', false},
					[4] = {'Sandália Verde', 100, 'pe.sandalia', 2, 'feet', false},
					[5] = {'Sandália Amarela', 100, 'pe.sandalia', 3, 'feet', false},
					[6] = {'Sandália Vermelho', 100, 'pe.sandalia', 4, 'feet', false},
					[7] = {'Sandália Roxa', 100, 'pe.sandalia', 5, 'feet', false},
					[8] = {'Sandália Branca', 100, 'pe.sandalia', 6, 'feet', false},
				},
				['Acessórios'] = {
					[1] = {'Ficar careca', 0, '0', '0', 'head', true},
					[2] = {'Sem Oculos', 0, '0', '0', 'extra2', true},
					[3] = {'Chapeu Vaqueiro Marrom', 150, 'chapeu.vaqueiro', 1, 'head', true},
					[4] = {'Chapeu Vaqueiro Rosa', 150, 'chapeu.vaqueiro', 2, 'head', true},
					[5] = {'Chapeu Vaqueiro Branco', 150, 'chapeu.vaqueiro', 3, 'head', true},
					[6] = {'Chapeu Vaqueiro Amarelo', 150, 'chapeu.vaqueiro', 4, 'head', true},
					[7] = {'Chapeu Vaqueiro Azul', 150, 'chapeu.vaqueiro', 5, 'head', true},
					[8] = {'Capacete Off-Racing Laranja', 150, 'capacete-moto', 1, 'head', true},
					[9] = {'Capacete Off-Racing Azul', 150, 'capacete-moto', 2, 'head', true},
					[10] = {'Capacete Off-Racing Verde', 150, 'capacete-moto', 3, 'head', true},
					[11] = {'Capacete Off-Racing Cinza', 150, 'capacete-moto', 4, 'head', true},
					[12] = {'Capacete Motorcycle Preto', 150, 'capacete-padrao', 1, 'head', true},
					[13] = {'Óculos Branco', 90, 'oculos.padrao', 1, 'extra2', true},
					[14] = {'Óculos Dourado', 90, 'oculos.padrao', 2, 'extra2', true},
					[15] = {'Óculos Rosa', 90, 'oculos.padrao', 3, 'extra2', true},
					[16] = {'Óculos Azul', 90, 'oculos.padrao', 4, 'extra2', true},
					[17] = {'Óculos Verde', 90, 'oculos.padrao', 5, 'extra2', true},
					[18] = {'Óculos Vermelho', 90, 'oculos.padrao', 6, 'extra2', true},
				},	
			},
			['female'] = {
				['Camisetas'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Nenhuma', 0, 0, 0, 'torso', false},
					[2] = {'Lisa Branco', 120, 'camisa.padrao', 2, 'torso', false},
					[3] = {'Lisa Preto', 120, 'camisa.padrao', 12, 'torso', false},
					[4] = {'Estampa Chanell Rosa (Branco)', 120, 'camisa.padrao', 1, 'torso', false},
					[5] = {'Estampa PinkHeart (Branco)', 120, 'camisa.padrao', 3, 'torso', false},
					[6] = {'Estampa NYC (Branco)', 120, 'camisa.padrao', 4, 'torso', false},
					[7] = {'Estampa SkateGirl (Branco)', 120, 'camisa.padrao', 5, 'torso', false},
					[8] = {'Estampa Ardidas (Branco)', 120, 'camisa.padrao', 6, 'torso', false},
					[9] = {'Estampa LoveFlower (Branco)', 120, 'camisa.padrao', 11, 'torso', false},
					[10] = {'Estampa Adidas Pink (Preto)', 120, 'camisa.padrao', 7, 'torso', false},
					[11] = {'Estampa Trasher (Preto)', 120, 'camisa.padrao', 8, 'torso', false},
					[12] = {'Estampa Adidas Graffiti (Preto)', 120, 'camisa.padrao', 9, 'torso', false},
					[13] = {'Estampa Louis Vitton', 350, 'camisa.padrao', 10, 'torso', false},
				},
				['Camisetas Topless'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Nenhuma', 0, 0, 0, 'torso', false},
					[2] = {'Estampa Guffy Cinza', 100, 'camisa.pequena', 1, 'torso', false},
					[3] = {'Estampa Guffy Rosa', 100, 'camisa.pequena', 2, 'torso', false},
					[4] = {'Estampa Guffy Azul', 100, 'camisa.pequena', 3, 'torso', false},
					[5] = {'Estampa Guffy Laranja', 100, 'camisa.pequena', 4, 'torso', false},
					[6] = {'Estampa Guffy Verde', 100, 'camisa.pequena', 5, 'torso', false},
					[7] = {'Estampa Guffy Vermelho', 100, 'camisa.pequena', 6, 'torso', false},
					[8] = {'Estampa Adidas Branca', 100, 'camisa.pequena', 7, 'torso', false},
					[9] = {'Estampa Trasher Branca', 100, 'camisa.pequena', 8, 'torso', false},
					[10] = {'Estampa SquashCodes Roxa', 100, 'camisa.pequena', 9, 'torso', false},
					[11] = {'Estampa Lisa Laranja', 100, 'camisa.pequena', 10, 'torso', false},
					[12] = {'Estampa Lisa Verde', 100, 'camisa.pequena', 11, 'torso', false},
					[13] = {'Estampa Lisa Vermelho', 100, 'camisa.pequena', 12, 'torso', false},
					[14] = {'Estampa Lisa Amarelo', 100, 'camisa.pequena', 13, 'torso', false},
					[14] = {'Estampa Lisa Rosa', 100, 'camisa.pequena', 14, 'torso', false},
				},
				['Regatas'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Nenhuma', 0, 0, 0, 'torso', false},
					[2] = {'Regata Preta', 100, 'camisa.regata', 1, 'torso', false},
					[3] = {'Regata Branca', 100, 'camisa.regata', 2, 'torso', false},
					[4] = {'Regata Louis Vitton', 100, 'camisa.regata', 3, 'torso', false},
					[5] = {'Regata Listrada Amarela', 100, 'camisa.regata', 4, 'torso', false},
					[6] = {'Regata Listrada Laranja', 100, 'camisa.regata', 5, 'torso', false},
					[7] = {'Regata Listrada Roxa', 100, 'camisa.regata', 6, 'torso', false},
					[8] = {'Regata Listrada Preta', 100, 'camisa.regata', 7, 'torso', false},
				},
				['Jeans'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Nenhuma', 0, 0, 0, 'legs', false},
					[2] = {'Calça Jeans Camo', 100, 'calca.padrao', 1, 'legs', false},
					[3] = {'Calça Jeans Camo Preta', 100, 'calca.padrao', 2, 'legs', false},
					[4] = {'Calça Jeans Camo Branca', 100, 'calca.padrao', 3, 'legs', false},
					[5] = {'Calça Jeans Azul', 100, 'calca.padrao', 4, 'legs', false},
					[6] = {'Calça Jeans Cinza', 100, 'calca.padrao', 5, 'legs', false},
					[7] = {'Calça Jeans Preta', 100, 'calca.padrao', 6, 'legs', false},
					[8] = {'Calça Jeans Branca', 100, 'calca.padrao', 7, 'legs', false},
				},
				['Tenis'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Descalço', 0, '0', '0', 'feet', false},
					[2] = {'Tênis Verde', 100, 'pe.tenis3', 1, 'feet', false},
					[3] = {'Tênis Cinza', 100, 'pe.tenis3', 2, 'feet', false},
					[4] = {'Tênis Preto', 100, 'pe.tenis3', 3, 'feet', false},
					[5] = {'Tênis Branco', 100, 'pe.tenis3', 4, 'feet', false},
					[6] = {'Tênis Roxo', 100, 'pe.tenis3', 5, 'feet', false},
					[7] = {'Tênis Marrom', 100, 'pe.tenis3', 6, 'feet', false},
					[8] = {'Tênis Ciano', 100, 'pe.tenis3', 7, 'feet', false},
					[9] = {'Tênis Yeezy Branco', 100, 'Yeazzy', 1, 'feet', false},
				},
				['Sandália'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Descalço', 0, '0', '0', 'feet', false},
					[2] = {'Sandália Azul', 100, 'pe.sandalia', 1, 'feet', false},
					[3] = {'Sandália Verde', 100, 'pe.sandalia', 2, 'feet', false},
					[4] = {'Sandália Amarelo', 100, 'pe.sandalia', 3, 'feet', false},
					[5] = {'Sandália Vermelho', 100, 'pe.sandalia', 4, 'feet', false},
					[6] = {'Sandália Roxo', 100, 'pe.sandalia', 5, 'feet', false},
					[7] = {'Sandália Cinza', 100, 'pe.sandalia', 6, 'feet', false},
				},
				['Acessórios'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Sem capacete', 0, '0', '0', 'head', true},
					[2] = {'Sem Oculos', 0, '0', '0', 'extra2', true},
					[3] = {'Capacete Off-Racing Azul', 150, 'capacete.padrao', 1, 'head', true},
					[4] = {'Capacete Off-Racing Rosa', 150, 'capacete.padrao', 2, 'head', true},
					[5] = {'Capacete Off-Racing Amarelo', 150, 'capacete.padrao', 3, 'head', true},
					[6] = {'Capacete Off-Racing Roxo', 150, 'capacete.padrao', 4, 'head', true},
					[7] = {'Capacete Off-Racing Verde', 150, 'capacete.padrao', 5, 'head', true},
					[8] = {'Capacete Off-Racing Preto', 150, 'capacete.padrao', 6, 'head', true},
					[9] = {'Capacete Off-Racing Branco', 150, 'capacete.padrao', 7, 'head', true},
					[10] = {'Óculos Juliet Rosa', 90, 'oculos.juliet', 1, 'extra2', true},
					[11] = {'Óculos Juliet Roxo', 90, 'oculos.juliet', 2, 'extra2', true},
					[12] = {'Óculos Juliet Azul', 90, 'oculos.juliet', 3, 'extra2', true},
					[13] = {'Óculos Juliet Verde', 90, 'oculos.juliet', 4, 'extra2', true},
					[14] = {'Óculos Juliet Amarelo', 90, 'oculos.juliet', 5, 'extra2', true},
					[15] = {'Óculos Juliet Branco', 90, 'oculos.juliet', 6, 'extra2', true},
					[16] = {'Óculos Juliet Cinza', 90, 'oculos.juliet', 8, 'extra2', true},
					[17] = {'Óculos Juliet Vermelho', 90, 'oculos.juliet', 9, 'extra2', true},
					[18] = {'Óculos Branco', 90, 'oculos.padrao', 1, 'extra2', true},
					[19] = {'Óculos Amarelo', 90, 'oculos.padrao', 2, 'extra2', true},
					[20] = {'Óculos Rosa', 90, 'oculos.padrao', 3, 'extra2', true},
					[21] = {'Óculos Azul', 90, 'oculos.padrao', 4, 'extra2', true},
					[22] = {'Óculos Verde', 90, 'oculos.padrao', 5, 'extra2', true},
					[23] = {'Óculos Vermelho', 90, 'oculos.padrao', 6, 'extra2', true},
				},
				['Maquiadora'] = { -- Nome, Preço, Modelo, Textura, Parte do Corpo, Zoom
					[1] = {'Sem Batom', 0, '0', '0', 'lipstick', true},
					[2] = {'Sem Blush', 0, '0', '0', 'blush', true},
					[3] = {'Batom Preto', 35, 'lipstick', 1, 'facehead', true},
					[4] = {'Batom Lilás', 35, 'lipstick', 2, 'facehead', true},
					[5] = {'Batom Castanho', 35, 'lipstick', 3, 'facehead', true},
					[6] = {'Batom Vermelho', 35, 'lipstick', 4, 'facehead', true},
					[7] = {'Batom Vermelho-Choque', 35, 'lipstick', 5, 'facehead', true},
					[8] = {'Batom Laranja', 35, 'lipstick', 6, 'facehead', true},
					[9] = {'Batom Nude', 35, 'lipstick', 8, 'facehead', true},
					[10] = {'Batom Vinho', 35, 'lipstick', 9, 'facehead', true},
					[11] = {'Batom Roxo', 35, 'lipstick', 10, 'facehead', true},
					[12] = {'Blush Bochecas', 65, 'blush', 1, 'facehead', true},
					[13] = {'Blush Nariz', 65, 'blush', 2, 'facehead', true},
					[14] = {'Blush Queixo', 65, 'blush', 3, 'facehead', true},
					[15] = {'Blush + Sardas', 65, 'blush', 4, 'facehead', true},
				},
			},
		},
	},

	barberPanel = {

		rgbprincipal = {129, 89, 247, 200}, --[[ R, G, B, ALPHA principal do painel ]]
		rgbsecundario = {255, 255, 255}, --[[ R, G, B secundário do painel ]]
		rgbbackground = {23, 23, 23, 170}, --[[ R, G, B, ALPHA background do painel ]]
			
		storeoptions = {
			enterMarker = { -- X, Y, Z, Interior, Dimensão, {R, G, B, A}
				[1] = {823.78363, -1588.64172, 13.55445, 0, 0, {129, 89, 247, 200}},
				[2] = {2071.18091, -1793.85730, 13.55328, 0, 0, {129, 89, 247, 200}},
				[3] = {-2571.16040, 246.49210, 10.26823, 0, 0, {129, 89, 247, 200}},
				[4] = {-1449.90466, 2592.28198, 55.83594, 0, 0, {129, 89, 247, 200}},
				[5] = {2072.82959, 2122.48633, 10.81252, 0, 0, {129, 89, 247, 200}},
			},
				
			enterPosition = { -- X, Y, Z, Interior, Dimensão
				[1] = {418.29282, -82.69286, 1001.80469, 3, 1},
				[2] = {418.29282, -82.69286, 1001.80469, 3, 2},
				[3] = {418.29282, -82.69286, 1001.80469, 3, 3},
				[4] = {418.29282, -82.69286, 1001.80469, 3, 4},
				[5] = {418.29282, -82.69286, 1001.80469, 3, 5},
			},
	
			leaveMarker = { -- X, Y, Z, Interior, Dimensão, {R, G, B, A}
				[1] = {418.69260, -84.05727, 1001.80469, 3, 1, {129, 89, 247, 200}},
				[2] = {418.69260, -84.05727, 1001.80469, 3, 2, {129, 89, 247, 200}},
				[3] = {418.69260, -84.05727, 1001.80469, 3, 3, {129, 89, 247, 200}},
				[4] = {418.69260, -84.05727, 1001.80469, 3, 4, {129, 89, 247, 200}},
				[5] = {418.69260, -84.05727, 1001.80469, 3, 5, {129, 89, 247, 200}},
			},
	
			leavePosition = { -- X, Y, Z, Interior, Dimensão
				[1] = {823.21954, -1592.03601, 13.55445, 0, 0},
				[2] = {2072.46118, -1793.40967, 13.54688, 0, 0},
				[3] = {-2569.69849, 245.18585, 10.19012, 0, 0},
				[4] = {-1450.82141, 2595.31616, 55.83594, 0, 0},
				[5] = {2073.56714, 2119.96484, 10.81252, 0, 0},
			},
	
			openMarker = { -- X, Y, Z, Interior, Dimensão, {R, G, B, A}
				[1] = {420.49435, -79.11149, 1001.80469, 3, 1, {129, 89, 247, 200}},
				[2] = {420.49435, -79.11149, 1001.80469, 3, 2, {129, 89, 247, 200}},
				[3] = {420.49435, -79.11149, 1001.80469, 3, 3, {129, 89, 247, 200}},
				[4] = {420.49435, -79.11149, 1001.80469, 3, 4, {129, 89, 247, 200}},
				[5] = {420.49435, -79.11149, 1001.80469, 3, 5, {129, 89, 247, 200}},
			},
	
			openLeavePosition = {
				[1] = {417.92346, -80.12579, 1001.80469,0,0,111.81781005859, 3, 1},
				[2] = {417.92346, -80.12579, 1001.80469,0,0,111.81781005859, 3, 2},
				[3] = {417.92346, -80.12579, 1001.80469,0,0,111.81781005859, 3, 3},
				[4] = {417.92346, -80.12579, 1001.80469,0,0,111.81781005859, 3, 4},
				[5] = {417.92346, -80.12579, 1001.80469,0,0,111.81781005859, 3, 5},
			},

			pedPosition = { -- X, Y, Z, RX, RY, RZ, Interior, Dimensão
				[1] = {421.64908, -78.05411, 1001.80469,0,0,111.81781005859, 3, 2},
				[2] = {421.64908, -78.05411, 1001.80469,0,0,111.81781005859, 3, 2},
				[3] = {421.64908, -78.05411, 1001.80469,0,0,111.81781005859, 3, 2},
				[4] = {421.64908, -78.05411, 1001.80469,0,0,111.81781005859, 3, 2},
				[5] = {421.64908, -78.05411, 1001.80469,0,0,111.81781005859, 3, 2},
			},
	
			pedCamera = { -- Cam X, Cam Y, Cam Z, Cam RX, Cam RY, Cam RZ
				[1] = {420.54791259766,-78.573799133301,1002.5562744141,421.44537353516,-78.150299072266,1002.4329223633}, -- Cam X, Cam Y, Cam Z, Cam RX, Cam RY, Cam, RZ
				[2] = {420.54791259766,-78.573799133301,1002.5562744141,421.44537353516,-78.150299072266,1002.4329223633}, -- Cam X, Cam Y, Cam Z, Cam RX, Cam RY, Cam, RZ
				[3] = {420.54791259766,-78.573799133301,1002.5562744141,421.44537353516,-78.150299072266,1002.4329223633}, -- Cam X, Cam Y, Cam Z, Cam RX, Cam RY, Cam, RZ
				[4] = {420.54791259766,-78.573799133301,1002.5562744141,421.44537353516,-78.150299072266,1002.4329223633}, -- Cam X, Cam Y, Cam Z, Cam RX, Cam RY, Cam, RZ
				[5] = {420.54791259766,-78.573799133301,1002.5562744141,421.44537353516,-78.150299072266,1002.4329223633}, -- Cam X, Cam Y, Cam Z, Cam RX, Cam RY, Cam, RZ

			},

			blip = true, -- Caso esteja ativado, os blips serão criados na mesma posição dos markers de entrada da loja
			blipid = 7, -- ID do Blip
			blipdistance = 100,

		},

		--[[
			Tabela de cabelos / barba / sombrancelha

			['Modelo'] = {
				{Parte do Corpo, Valor, Textura},
			},
		]]
		
		['male'] = {
			['cabelos'] = {
				[1] = { 
					['0'] = { 
						{'head', 0, '0'},
					},
				},
				[2] = { 
					['Cabelo1'] = {
						{'head', 150, 1},
						{'head', 150, 2},
						{'head', 150, 3},
						{'head', 150, 4},
						{'head', 150, 5},
						{'head', 150, 6},
						{'head', 150, 7},
						{'head', 150, 8},
					},
				},
				[3] = {
					['Cabelo2'] = {
						{'head', 150, 1},
						{'head', 150, 2},
						{'head', 150, 3},
						{'head', 150, 4},
						{'head', 150, 5},
						{'head', 150, 6},
						{'head', 150, 7},
						{'head', 150, 8},
						{'head', 150, 9},
						{'head', 150, 10},
						{'head', 150, 11},
						{'head', 150, 12},
					},
				},
				[4] = {
					['Cabelo4'] = {
						{'head', 150, 1},
						{'head', 150, 2},
						{'head', 150, 3},
						{'head', 150, 4},
						{'head', 150, 5},
						{'head', 150, 6},
						{'head', 150, 7},
						{'head', 150, 8},
						{'head', 150, 9},
						{'head', 150, 10},
						{'head', 150, 11},
						{'head', 150, 12},
					},
				},
			},
			['barbas'] = {
				--[[1]] {
					['beard'] = {
						{'beard', '0', '0'} 
					}, 
				},
				--[[2]] { 
					['beard'] = {
						{'beard', 150, 1},
					},
				},
				--[[3]] { 
					['beard'] = {
						{'beard', 150, 2},
					},
				},
				--[[4]] { 
					['beard'] = {
						{'beard', 150, 3},
					},
				},
				--[[5]] { 
					['beard'] = {
						{'beard', 150, 4},
					},
				},
				--[[6]] {  
					['beard'] = {
						{'beard', 150, 5},
					},
				},
				--[[7]] { 
					['beard'] = {
						{'beard', 150, 6},
					},
				},
				--[[8]] { 
					['beard'] = {
						{'beard', 150, 7},
					},
				},
				--[[9]] { 
					['beard'] = {
						{'beard', 150, 8},
					},
				},
				--[[10]] { 
					['beard'] = {
						{'beard', 150, 9},
					},
				},
				--[[11]] { 
					['beard'] = {
						{'beard', 150, 10},
					},
				},
				--[[12]] { 
					['beard'] = {
						{'beard', 150, 11},
					},
				},
				--[[13]] { 
					['beard'] = {
						{'beard', 150, 12},
					},
				},
				--[[14]] { 
					['beard'] = {
						{'beard', 150, 13},
					},
				},
				--[[15]] {  
					['beard'] = {
						{'beard', 150, 14},
					},
				},
			},
			['sobrancelhas'] = {
				{
					['eyebrow'] = {
						{'eyebrow', '0', '0'},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 2},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 3},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 4},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 5},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 6},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 7},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 8},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 9},
					},
				},
			}
		},
		['female'] = {
			['cabelos'] = {
				[1] = { 
					['0'] = { 
						{'head', 0, '0'},
					},
				},
				[2] = { 
					['hair.1'] = {
						{'head', 150, 1},
						{'head', 150, 2},
						{'head', 150, 3},
						{'head', 150, 4},
						{'head', 150, 5},
						{'head', 150, 6},
						{'head', 150, 7},
						{'head', 150, 8},
						{'head', 150, 9},
					},
				},
				[3] = {
					['hair.3'] = {
						{'head', 150, 1},
						{'head', 150, 2},
						{'head', 150, 3},
						{'head', 150, 4},
						{'head', 150, 5},
						{'head', 150, 6},
						{'head', 150, 7},
						{'head', 150, 8},
						{'head', 150, 9},
					},
				},
				[4] = {
					['hair.4'] = {
						{'head', 150, 1},
						{'head', 150, 2},
						{'head', 150, 3},
						{'head', 150, 4},
						{'head', 150, 5},
						{'head', 150, 6},
						{'head', 150, 7},
						{'head', 150, 8},
						{'head', 150, 9},
						{'head', 150, 10},
					},
				},
			},
			['sobrancelhas'] = {
				{
					['eyebrow'] = {
						{'eyebrow', '0', '0'},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 1},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 2},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 3},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 4},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 5},
					},
				},
				{
					['eyebrow'] = {
						{'eyebrow', 150, 6},
					},
				},
			},
		},
	},
	
	corpsPanel = {
		['rgbselected'] = {95, 21, 191, 255}, -- R,G,B de quando alguma roupa / customização estiver selecionada 
		['rgbprincipal'] = {129, 89, 247, 200}, -- R, G, B, ALPHA principal do painel 
		['rgbsecundario'] = {255, 255, 255}, -- R, G, B secundário do painel 
		['rgbbackground'] = {23, 23, 23, 170}, -- R, G, B, ALPHA background do painel 
		['rgbrectangle'] = {0, 0, 0, 170}, -- R, G, B, ALPHA dos retangulos do painel 
		['panels'] = {
		[1] = { 
				['openMarker'] = {2821.22876 + 6, 2376.74170, 11.06250, 0, 0, {129, 89, 247, 200}}, -- posX, posY, posZ, interior, dimensão {r, g, b, alpha}
				['panelLogo'] = {"assets/interface/corps/logo_example.png", {x = 1390, y = 305, w = 91, h = 117}, {255, 255, 255, 255}}, -- logoFile, {x, y, w, h}, {r, g, b, alpha}
				['panelText'] = {"P.C.E.S.P", {x = 1532 + 5, y = 326, w = 272, h =75}, {255, 255, 255, 255}, fontSize = 40}, -- logoText, {x, y, w, h}, {r, g, b, alpha}, fontSize
				['grouptype'] = 'ACL', -- 'ACL' ou 'ElementData' 
				['groupname'] = 'PCESP',
				['options'] = {
					['male'] = {
						skin = 1, -- Número da skin
						['Farda Completa'] = { -- Nome da opção	
							openTable = false, --[[ Tabela secundária ou tabela primária? 
							Ex: Caso você coloque false, você não precisa colocar o nome das roupas nos argumentos do tableOptions, basta colocar a o modelo na txd, a textura e a parte do corpo.
								Caso seja false, ao clicar todas as roupas serão adicionadas ao corpo do personagem ao mesmo tempo
								Caso seja true, irá abrir uma aba secundária com mais opções de roupas para ao clicar adicionar a roupa ao corpo, um por um. ]]
							tableOptions = {
								{'camisa.padrao', 1, 'torso'}, -- Modelo FALSE: {Modelo na TXD, Textura, Parte do corpo}
								{'calca.jeans', 1, 'legs'}, -- Modelo FALSE: {Modelo na TXD, Textura, Parte do corpo}
							},
						},
						['Farda Investigador'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'}, -- Modelo TRUE: {Nome da roupa, Modelo na TXD, Textura, Parte do corpo}
								{'Calça PM', 'calca.jeans', 1, 'legs'}, -- Modelo TRUE: {Nome da roupa, Modelo na TXD, Textura, Parte do corpo}
							}, 
						},
						['Farda Delegado 1'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
								{'Calça PM', 'calca.jeans', 1, 'legs'}, -- Modelo TRUE: {Nome da roupa, Modelo na TXD, Textura, Parte do corpo}
							},
						},
						['Farda Delegado 2'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
							},
						},
						
					},
					['female'] = {
						skin = 2,
						['Farda Completa'] = {		
							openTable = false,
							tableOptions = {
								{'camisa.padrao', 1, 'torso'},
								{'calca.padrao', 1, 'legs'},
							},
						},
						['Farda Investigador'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
							},
						},
						['Farda Delegado 1'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
							},
						},
						['Farda Delegado 2'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
							},
						},
					},
				},
			},
			[2] = { 
				['openMarker'] = {2821.22876 + 10, 2376.74170, 11.06250, 0, 0, {129, 89, 247, 200}}, -- posX, posY, posZ, interior, dimensão {r, g, b, alpha}
				['panelLogo'] = {"assets/interface/corps/logo_example.png", {x = 1390, y = 305, w = 91, h = 117}, {255, 255, 255, 255}}, -- logoFile, {x, y, w, h}, {r, g, b, alpha}
				['panelText'] = {"P.C.E.S.P", {x = 1532 + 5, y = 326, w = 272, h =75}, {255, 255, 255, 255}, fontSize = 40}, -- logoText, {x, y, w, h}, {r, g, b, alpha}, fontSize
				['grouptype'] = 'ElementData', -- 'ACL' ou 'ElementData' 
				['groupname'] = 'PCESP',
				['options'] = {
					['male'] = {
						skin = 1, -- Número da skin
						['Farda Completa'] = { -- Nome da opção	
							openTable = false, --[[ Tabela secundária ou tabela primária? 
							Ex: Caso você coloque false, você não precisa colocar o nome das roupas nos argumentos do tableOptions, basta colocar a o modelo na txd, a textura e a parte do corpo.
								Caso seja false, ao clicar todas as roupas serão adicionadas ao corpo do personagem ao mesmo tempo
								Caso seja true, irá abrir uma aba secundária com mais opções de roupas para ao clicar adicionar a roupa ao corpo, um por um. ]]
							tableOptions = {
								{'camisa.padrao', 1, 'torso'}, -- Modelo FALSE: {Modelo na TXD, Textura, Parte do corpo}
								{'calca.padrao', 1, 'legs'}, -- Modelo FALSE: {Modelo na TXD, Textura, Parte do corpo}
							},
						},
						['Farda Investigador'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'}, -- Modelo TRUE: {Nome da roupa, Modelo na TXD, Textura, Parte do corpo}
								{'Colete PM', 'camisa.padrao', 1, 'torso'}, -- Modelo TRUE: {Nome da roupa, Modelo na TXD, Textura, Parte do corpo}
							}, 
						},
						['Farda Delegado 1'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
							},
						},
						['Farda Delegado 2'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
							},
						},					
					},
					['female'] = {
						skin = 2,
						['Farda Completa'] = {		
							openTable = false,
							tableOptions = {
								{'camisa.padrao', 1, 'torso'},
								{'calca.padrao', 1, 'legs'},
							},
						},
						['Farda Investigador'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
							},
						},
						['Farda Delegado 1'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
							},
						},
						['Farda Delegado 2'] = {		
							openTable = true,
							tableOptions = {
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
								{'Colete PM', 'camisa.padrao', 1, 'torso'},
							},
						},
					},
				},
			},
		},
	},
}