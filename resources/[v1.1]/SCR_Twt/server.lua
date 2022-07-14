twitSpamKoruyucu = {}
mysql = exports.mysql

function twitAt(thePlayer, ...)
	twiticerik = table.concat({...}, " ")
	-- if isTimer(twitSpamKoruyucu[getPlayerSerial(thePlayer)]) then 
	-- 	kalanzaman = getTimerDetails(twitSpamKoruyucu[getPlayerSerial(thePlayer)])
	-- 	if (kalanzaman / 500) > 60 then
	-- 		yazizaman = (kalanzaman /500) / 60
	-- 		yazi = "minutes"
	-- 	else
	-- 		yazizaman = kalanzaman / 500
	-- 		yazi = "saniye"
	-- 	end
	-- 	outputChatBox("#01C3FE[Twitter] #FE0101To re-send a tweet you must wait ".. math.floor(yazizaman) .." "..yazi..".", thePlayer,255,0,0,true) 
	-- 	return
	-- end
	if string.len(twiticerik) > 5 and string.len(twiticerik) < 140 then
		if getElementData(thePlayer, "money") >= 20 then
			if (exports.global:hasItem( source, 2)) then 
				       triggerClientEvent(getRootElement(), "yeni:twit", getRootElement(),twiticerik, getPlayerName(thePlayer))
					   sendTweet(twiticerik,'name')
					   exports.ddhooker:sendTweetDiscord("@"..getPlayerName(thePlayer).." | "..twiticerik)
			        exports.global:takeMoney(thePlayer, 20)
			           outputChatBox("#01C3FE[Twitter] #FFFFFFYour tweet was successfully sent, 20$ was cut.",thePlayer,255,0,0,true)
			           twitSpamKoruyucu[getPlayerSerial(thePlayer)] = setTimer(function(plr) twitSpamKoruyucu[getPlayerSerial(thePlayer)] = nil end, 300000, 1, thePlayer)
		    else 
				outputChatBox("#01C3FE[Twitter] #FE0101Item Error", thePlayer, 255,0,0,true)
			end 
		     
		else
			outputChatBox("#01C3FE[Twitter] #FE0101You must have 20$ to tweet.", thePlayer, 255,0,0,true)
		end
	else
		outputChatBox("#01C3FE[Twitter] #FE0101Tweets can be a minimum of 5 and a maximum of 140 characters.", thePlayer, 255,0,0,true)
	end
end
addEvent("twitGonder:server", true)
addEventHandler("twitGonder:server", getRootElement(), twitAt)

function sendTweet(msg,name)
	_msg = 'tweet sent message : '..tostring(msg)..' and name : '..tostring(name)
	outputServerLog(msg)
	mysql:query_insert_free("INSERT INTO tweets (name, message) VALUES ('"..tostring(name).."', '"..tostring(msg).."' )")
	outputServerLog('tweet saved in sql')

	-- outputDebugString('tweet sent')
	-- outputConsole('tweet sent')
	local x = {
		message = _msg,
		x='test',
		g='testss'
	}

	triggerClientEvent(getRootElement(), "yeni:twit", getRootElement(),msg, name)

	return toJSON(x)


end