local models = {
	{nome = "Carro VIP", txd = "models/bullet.txd", dff = "models/bullet.dff", id = 506},
	{nome = "Sabre de Luz", txd = "models/katana.txd", dff = "models/katana.dff", id = 339},
	{nome = "Skin VIP", txd = "models/skinvip.txd", dff = "models/skinvip.dff", id = 22}
}

addEventHandler("onClientResourceStart",resourceRoot,
	function()
		for _,mod in pairs(models) do
			txd = engineLoadTXD ( mod.txd )
			engineImportTXD ( txd, mod.id )
			dff = engineLoadDFF ( mod.dff )
			engineReplaceModel ( dff, mod.id )
		end
	end
)

itens = {
	["Personagem"] = {
	

		{
			titulo = "Máscaras",
			descricao = "Adicione máscaras personalizadas em qualquer skin.",
			icone = "imagens/itens/personagem/item10.png",
			acao = function(item) triggerEvent("pAcao10", resourceRoot, item) end,
			toogle = false
		},

	}
}