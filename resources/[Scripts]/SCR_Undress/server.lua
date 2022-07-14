function Undress(playerSource)
  if (getPlayerSkin(playerSource) == 252) then
    outputChatBox("[Undress-System]Vous êtes déjà déshabillé", playerSource, 255, 0, 0)
  else
    setPlayerSkin(playerSource, 252)
    outputChatBox("[Undress-System]Vous êtes déshabillé avec succès", playerSource, 0, 255, 68)
  end
end

addCommandHandler("undress", Undress)

