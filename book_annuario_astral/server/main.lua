-- Thread principale per l'inizializzazione
CreateThread(function()
    if Config.OldQBCore then
        TriggerEvent(Config.Core..':GetObject', function(obj) QBCore = obj end)
    else
        QBCore = exports[Config.CoreFolderName]:GetCoreObject()
    end

    -- Crea oggetti utilizzabili per ogni libro configurato
    for k, v in pairs(Config.Books) do
        QBCore.Functions.CreateUseableItem(k, function(source, item)
            TriggerClientEvent("steve-annuario-astral:client:ApriLibro", source, k, item)
        end)
    end
end)