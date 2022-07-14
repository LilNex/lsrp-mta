--[[

░░██╗  ░██████╗░██████╗░██╗░░░██╗░█████╗░░██████╗██╗░░██╗   ░█████╗░░█████╗░██████╗░███████╗░██████╗ ░░░░██╗ ██╗░░
░██╔╝  ██╔════╝██╔═══██╗██║░░░██║██╔══██╗██╔════╝██║░░██║   ██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝ ░░░██╔╝ ╚██╗░
██╔╝░  ╚█████╗░██║██╗██║██║░░░██║███████║╚█████╗░███████║   ██║░░╚═╝██║░░██║██║░░██║█████╗░░╚█████╗░ ░░██╔╝ ░░╚██╗
╚██╗░  ░╚═══██╗╚██████╔╝██║░░░██║██╔══██║░╚═══██╗██╔══██║   ██║░░██╗██║░░██║██║░░██║██╔══╝░░░╚═══██╗ ░██╔╝ ░░░██╔╝
░╚██╗  ██████╔╝░╚═██╔═╝░╚██████╔╝██║░░██║██████╔╝██║░░██║   ╚█████╔╝╚█████╔╝██████╔╝███████╗██████╔╝ ██╔╝░ ░░██╔╝░
░░╚═╝  ╚═════╝░░░░╚═╝░░░░╚═════╝░╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝   ░╚════╝░░╚════╝░╚═════╝░╚══════╝╚═════╝░ ╚═╝░░ ░░╚═╝░░
]]--

config = { 
    ['license'] = 'MEU-PAU-NA-SUA-MÃO',
    ['email'] = 'quebrei-fodase@gmail.com',
}

connect = {
	database = 'sqlite', --[[ Tipo de conexão ('sqlite' ou 'mysql') ]]
	mysqlparameters = { --[[ Parametros de conexão mysql (ignore caso o tipo seja sqlite) ]]
		hostname = "", --[[ IP da provedora da sua Database ]]
		username = "", --[[ Usuário com permissões de administrador da database ]]
		password = "", --[[ Senha do usuário ]]
		database = "" --[[ Nome da database ]]
	}, 
	sqlitefile = 'assets/database/database.db', --[[ Arquivo SQLITE (ignore caso o tipo seja mysql) ]]
}

models = {
	blockOnResourceStart = false,
	toblock = {
		[1] = {txd="system/loader/models/male/Male.txd", dff="system/loader/models/male/Male.dff", col="", txdlock="system/loader/models/male/MaleTXD", dfflock="system/loader/models/male/MaleDFF", collock=""},
		[2] = {txd="system/loader/models/female/Female.txd", dff="system/loader/models/female/Female.dff", col="", txdlock="system/loader/models/female/FemaleTXD", dfflock="system/loader/models/female/FemaleDFF", collock=""},
	},

	toload = {
		[1] = {txd="system/loader/models/male/MaleTXD", dff="system/loader/models/male/MaleDFF", col=""}, -- [ID] = { TXDLOK, DFFLOCK, COLLOCK}
		[2] = {txd="system/loader/models/female/FemaleTXD", dff="system/loader/models/female/FemaleDFF", col=""},
	},
}

--[[
	CASO VOCÊ USE UM SCRIPT DE LOGIN QUE NÃO USE AS CONTAS DO MTA
	use exports['sqh_characters']:showCreatePerson(player) para o painel aparecer.
]]

system = {
	save_system = true, --[[Caso seja true, sempre que o jogador morrer ele irá voltar com as roupas novamente]]
	openPanelLogin = true, --[[ Caso seja true, assim que o jogador se logar em uma conta do jogo o painel se abrirá, caso queira que apareça somente com o exports deixe false]]
	['accounts'] = {
		--[[ Como devemos salvar a conta do jogador? ]]
		accountype = 'Account', --[[ 'Account' ou 'ElementData' ou 'Function'  ]]
		idelementdata = 'ID', --[[ elementData de ID. Caso use a conta do jogo, basta ignorar. ]]
		externalfunction = function(player)
			if (player) then
				
			end
		end,
	},

	['takeMoney'] = {
		moneyType = 'Game', --[[ 'Game' ou 'ElementData']]
		moneyElementData = 'Money', --[[ elementData de Dinheiro. Caso use o dinheiro do jogo, basta ignorar. ]]
	},

	['bodyparts'] = {
		['male'] = {
			['torso'] = {'body.torso', 'body.arm1', 'body.arm2', 'body.meio', 'body.hands1', 'body.hands2' },
			['legs'] = {'body.legs1', 'body.legs2', 'body.coxa'},
			['feet'] = {'body.feet', 'body.heel'},
			['head'] = {'body.head'},
		},
		['female'] = {
			['torso'] = {'body.torso', 'body.arm', 'body.hands', 'body.biquinicima' },
			['legs'] = {'body.legs', 'body.biquinibaixo'},
			['feet'] = {'body.feet', 'body.tornozelo'},
			['head'] = {'body.head'},
		},
	},

	['skintone'] = { -- Texturas do corpo {Parte do corpo, modelo (TXD), Número PNG}
		['female'] = {
			{'torso', 'body.torso', 1},
			{'torso', 'body.arm', 1},
			{'torso', 'body.hands', 1},
			{'torso', 'body.biquinicima', 1},
			{'legs', 'body.legs', 3},
			{'legs', 'body.biquinibaixo', 3},
			{'legs', 'body.tornozelo', 3},
			{'feet', 'body.feet', 3},
			{'head', 'body.head', 2},
		},
		
		['male'] = {
			{'torso', 'body.torso', 1},
			{'torso', 'body.meio', 1},
			{'torso', 'body.arm1', 1},
			{'torso', 'body.arm2', 1},
			{'torso', 'body.hands1', 1},
			{'torso', 'body.hands2', 1},
			{'legs', 'body.legs1', 2},
			{'legs', 'body.legs2', 2},
			{'legs', 'body.coxa', 2},
			{'head', 'body.head', 4},
			{'feet', 'body.feet', 3},
			{'feet', 'body.heel', 3},
		},
	},

	['desctbody'] = {
		['male'] = { -- [Modelo] = {Partes do corpo a serem removida quando a roupa for aplicada}
			['camisa.padrao'] = {'body.torso', 'body.meio'},
			['camisa.frank'] = {'body.torso', 'body.arm1', 'body.arm2', 'body.meio'},
			['camisa.polo'] = {'body.torso', 'body.meio'},
			['camisa.praia'] = {'body.torso'},
			['camisa.regata'] = {''},
			['camisa.media'] = {'body.torso', 'body.meio'},
			['casaco.frio'] = {'body.torso', 'body.arm1', 'body.arm2'},
			['casaco.jaqueta'] = {'body.torso', 'body.arm1', 'body.arm2'},
			['casaco.moletom'] = {'body.torso', 'body.arm1', 'body.arm2'},
			['casaco.adidas'] = {'body.torso', 'body.arm1', 'body.arm2'},
			['bermuda.camo'] = {'body.coxa'},
			['bermuda.padrao'] = {'body.coxa'},
			['calca.jeans'] = {'body.legs1', 'body.legs2', 'body.coxa'},
			['calca.larga'] = {'body.legs1', 'body.legs2', 'body.coxa'},
			['pe.tenis1'] = {'body.feet'},
			['pe.tenis2'] = {'body.feet'},
			['pe.tenis3'] = {'body.feet'},
			['pe.sandalia'] = {''},
			['pe.chinelo'] = {''},
			['pe.sapatosocial'] = {'body.feet'},
			['Cabelo1'] = {''},
			['Cabelo2'] = {''},
			['Cabelo3'] = {''},
			['Cabelo4'] = {''},
			['chapeu.vaqueiro'] = {''},
			['capacete-moto'] = {''},
			['capacete-padrao'] = {''},
			['oculos.padrao'] = {''},
			['bone.padrao'] = {''},
			['terno.blusa'] = {'body.torso', 'body.arm1', 'body.arm2'},
			['terno.calca'] = {'body.coxa', 'body.legs1', 'body.legs2'},
			['terno.meio'] = {'body.meio'},
			['body.cueca'] = {''},
		},
		['female'] = { -- [Modelo] = {Partes do corpo a serem removida quando a roupa for aplicada}
			['camisa.padrao'] = {'body.torso', 'body.biquinicima'},
			['camisa.pequena'] = {'body.biquinicima'},
			['camisa.regata'] = {''},
			['calca.padrao'] = {'body.legs'},
			['hair.1'] = {''},
			['hair.2'] = {''},
			['hair.3'] = {''},
			['hair.4'] = {''},
			['pe.bota'] = {'body.feet'},
			['pe.tenis3'] = {'body.feet'},
			['saia.padrao'] = {''},
			['Yeazzy'] = {'body.feet'},
		},
	},
}