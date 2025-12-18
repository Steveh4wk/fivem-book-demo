-- Libreria HTTP per le richieste Discord
local http = require('native/http')

-- Funzioni di supporto per l'API Discord
local Discord = {}

-- Ottiene l'URL dell'immagine da un messaggio Discord
function Discord:GetMessageImageUrl(channelId, messageId, callback)
    if not Config.Discord.enabled then
        callback(nil, "L'integrazione Discord è disabilitata")
        return
    end

    local url = string.format("https://discord.com/api/v10/channels/%s/messages/%s", channelId, messageId)
    local headers = {
        ["Authorization"] = "Bot " .. Config.Discord.botToken,
        ["Content-Type"] = "application/json"
    }

    http.request(url, "GET", headers, {}, function(errorCode, data, rawHeaders)
        if errorCode == 200 and data then
            local message = json.decode(data)
            if message and message.attachments and #message.attachments > 0 then
                -- Restituisce l'URL del primo allegato
                callback(message.attachments[1].url, nil)
            else
                callback(nil, "Nessun allegato immagine trovato nel messaggio")
            end
        else
            callback(nil, "Impossibile recuperare il messaggio Discord: " .. tostring(errorCode))
        end
    end)
end

-- Esporta le funzioni Discord
_G.Discord = Discord

-- Callback NUI per ottenere l'URL dell'immagine Discord
RegisterNUICallback('getDiscordImage', function(data, cb)
    Discord:GetMessageImageUrl(data.channelId, data.messageId, function(imageUrl, error)
        cb(imageUrl or error)
    end)
end)
