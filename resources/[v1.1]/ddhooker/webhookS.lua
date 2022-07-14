-- created by zsenel

local LSPD_room = "https://discord.com/api/webhooks/880072270557626428/YQdB1tmEpLvjImxkcrxWrdodwOsmXMnYhLzlnU8byudR6BEGV9U923WrBiVUMlShUI96"
local LSFD_room = "https://discord.com/api/webhooks/880072549722103858/WleFgos3UZJXKKqeII0yYH7vrivI2_PM7tLTYNj8agzeyE90_R1HqWNVhmN5pkJt3lMU"
local logs_room = "https://discord.com/api/webhooks/882681812785180672/-OINAeCygEO-961xXpUlmphAaj6UPm1LS31dqFRUFZBjOU4ht4CIPl5GnikKw_dbedRk"
local logs2_room = "https://discord.com/api/webhooks/883727629826531348/D32mW4q0fnRFme4Q0WU7si4Ig50fCJrQgQgh7JQSvmCWPPtkxJN4QZVOYk1Fed97t44D"
local logs3_room = "https://discord.com/api/webhooks/883727667264880732/9ulHIA17-MosAx7zQuI_A0MxrwAMZ9H9NMCfxG_nZOLrAV7XRlrXd67tW2Xq6esnF414"
local logs4_room = "https://discord.com/api/webhooks/883769039065845860/6gV3lJSm2PvBkcXsTt-9y1KA0Ay2XZdRvyho1SvJycBtzFbc8LelnyDYOj5Ep-9O687a"
local logs5_room = "https://discord.com/api/webhooks/883769170158841916/j66Tj5bV5UUvQQFwRBnRyeTq2uTnWtdTfV9hea4kEuYB-XuyC3ZGMzJGmxyVZNHAK_c-"
local craft_room = "https://discord.com/api/webhooks/885987170379247677/bXS5SXhmHnf7z959nc7Zbv1TpcssOzptyWEFRnPRBrF8b5m7UUphJaPjkum1okLFbUab"
local items_room = "https://discord.com/api/webhooks/892373766506680371/g1ZBUG7mEHslJPLSbXTFi61hiWbNmBTjoeDM1pxTaIjKx16pbLBRGsGEt7uUqx0KJCeD"
local tweets_room = "https://discord.com/api/webhooks/889281735190265906/ZjgoEEd_6DgaAXU4LMRmC-IFb-y_Mum9id4Wd0KZUiVaiyqNez4FYJ8DP275cE8ZaRnx"

i = 0
function sendLSPDDiscord(message)
    sendOptions = {
        formFields = {
           content="```"..message.."```"
        },
    }
        fetchRemote ( LSPD_room, sendOptions, WebhookCallback )

end
function sendTweetDiscord(message)
    sendOptions = {
        formFields = {
           content="```"..message.."```"
        },
    }
        fetchRemote ( tweets_room, sendOptions, WebhookCallback )

end
function sendLSFDDiscord(message)
    sendOptions = {
        formFields = {
            content="```"..message.."```"
        },
    }
    fetchRemote ( LSFD_room, sendOptions, WebhookCallback )
    end
    function sendCraftDiscord(message)
        sendOptions = {
            formFields = {
                content="```"..message.."```"
            },
        }
        fetchRemote ( craft_room, sendOptions, WebhookCallback )
        end
function sendItemsDiscord(message)
        sendOptions = {
            formFields = {
                content="```"..message.."```"
            },
        }
        fetchRemote ( items_room, sendOptions, WebhookCallback )
end
-- 2 arguments (responseData gives back the response or "ERROR" )
function WebhookCallback(responseData) 
outputDebugString("(Discord webhook callback): responseData: "..responseData)
end

-- SendDiscordTestMessage (deletable, it's a sample function)
function SendDiscordTestMessage(player, command, ...)
    local msg = table.concat({...}," ") -- for multiple words
    sendDiscordMessage(msg)
end
-- addCommandHandler("lspddcmessage", SendDiscordTestMessage)


addCommandHandler( "commandz", 
   function(player)
      local commandsList = {} --table to store commands
		
      --store/sort commands in the table where key is resource and value is table with commands
      for _, subtable in pairs( getCommandHandlers() ) do
	 local commandName = subtable[1]
	 local theResource = subtable[2]
			
         if not commandsList[theResource] then
	    commandsList[theResource] = {}
	 end
			
	 table.insert( commandsList[theResource], commandName )
      end
		
      --output sorted information in the chat
      for theResource, commands in pairs( commandsList ) do
	  local resourceName = getResourceInfo( theResource, "name" ) or getResourceName( theResource ) --try to get full name, if no full name - use short name
	  outputChatBox( "== "..resourceName.. " ==", player, 0, 255, 0 )
			
	  --output list of commands
	  for _, command in pairs( commands ) do
	     outputChatBox( "/"..command, player, 255, 255, 255 )
	  end
      end
  end
)