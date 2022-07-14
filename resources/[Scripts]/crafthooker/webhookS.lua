-- created by zsenel

local LSPD_room = "https://discord.com/api/webhooks/880072270557626428/YQdB1tmEpLvjImxkcrxWrdodwOsmXMnYhLzlnU8byudR6BEGV9U923WrBiVUMlShUI96"
local LSFD_room = "https://discord.com/api/webhooks/880072549722103858/WleFgos3UZJXKKqeII0yYH7vrivI2_PM7tLTYNj8agzeyE90_R1HqWNVhmN5pkJt3lMU"
local logs_room = "https://discord.com/api/webhooks/882681812785180672/-OINAeCygEO-961xXpUlmphAaj6UPm1LS31dqFRUFZBjOU4ht4CIPl5GnikKw_dbedRk"
local logs2_room = "https://discord.com/api/webhooks/883727629826531348/D32mW4q0fnRFme4Q0WU7si4Ig50fCJrQgQgh7JQSvmCWPPtkxJN4QZVOYk1Fed97t44D"
local logs3_room = "https://discord.com/api/webhooks/883727667264880732/9ulHIA17-MosAx7zQuI_A0MxrwAMZ9H9NMCfxG_nZOLrAV7XRlrXd67tW2Xq6esnF414"
local logs4_room = "https://discord.com/api/webhooks/883769039065845860/6gV3lJSm2PvBkcXsTt-9y1KA0Ay2XZdRvyho1SvJycBtzFbc8LelnyDYOj5Ep-9O687a"
local logs5_room = "https://discord.com/api/webhooks/883769170158841916/j66Tj5bV5UUvQQFwRBnRyeTq2uTnWtdTfV9hea4kEuYB-XuyC3ZGMzJGmxyVZNHAK_c-"
local craft_room = "https://discord.com/api/webhooks/885987170379247677/bXS5SXhmHnf7z959nc7Zbv1TpcssOzptyWEFRnPRBrF8b5m7UUphJaPjkum1okLFbUab"

i = 0
function sendLSPDDiscord(message)
    sendOptions = {
        formFields = {
           content="```"..message.."```"
        },
    }
        fetchRemote ( LSPD_room, sendOptions, WebhookCallback )

end
function sendLogsDiscord(message)
    sendOptions = {
        formFields = {
            content="``` "..message.."``` "
        },
    }
    if i <= 10 then
        fetchRemote ( logs_room, sendOptions, WebhookCallback )
        i = i+1
    elseif i <= 20 then
        fetchRemote ( logs2_room, sendOptions, WebhookCallback )
        i = i+1

    elseif i <= 30 then
        fetchRemote ( logs3_room, sendOptions, WebhookCallback )
        i = i+1
    elseif i <= 40 then
        fetchRemote ( logs4_room, sendOptions, WebhookCallback )
        i = i+1
    elseif i <= 50 then
        fetchRemote ( logs5_room, sendOptions, WebhookCallback )
        i = i+1
    else 
        i = 0
        fetchRemote ( logs_room, sendOptions, WebhookCallback )

    end

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


