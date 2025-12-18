-- Configurazione del core framework
Config = {}

Config.Core = "QBCore"
Config.OldQBCore = false
Config.CoreFolderName = "qb-core" 

-- Se il source è 'web', allora pageName deve essere l'URL completo dell'immagine
-- Esempio: https://upload.wikimedia.org/wikipedia/commons/b/b5/800x600_Wallpaper_Blue_Sky.png
-- Se il source è 'discord', allora pageName deve essere l'ID del messaggio Discord
-- Esempio: 1234567890123456789

-- Configurazione Discord per il caricamento delle immagini
Config.Discord = {
    enabled = false, -- Disabilitato per demo
    botToken = "IL_TUO_BOT_TOKEN_DISCORD", -- Sostituisci con il token del tuo bot
    guildId = "IL_TUO_SERVER_ID", -- Sostituisci con l'ID del tuo server
    channelId = "IL_TUO_CANALE_ID", -- Sostituisci con l'ID del tuo canale
}

-- Configurazione dei libri disponibili - Versione Demo
Config.Books = {
    ['demo_book'] = {
        ['pages'] = {
            { pageName = "copertina", type = 'hard', source = 'local' }, --Copertina anteriore
            { pageName = "1", type = 'hard', source = 'local' }, --Interni copertina anteriore
            { pageName = "2", type = 'normal', source = 'local' }, --Pagina 2
            { pageName = "3", type = 'normal', source = 'local' }, --Pagina 3
            { pageName = "4", type = 'normal', source = 'local' }, --Pagina 4
            { pageName = "5", type = 'normal', source = 'local' }, --Pagina 5
            { pageName = "6", type = 'hard', source = 'local' }, --Interni copertina posteriore
            { pageName = "copertina_posteriore", type = 'hard', source = 'local' }, --Copertina posteriore
        },
        ['prop'] = 'book', -- es. book, map
        ['size'] = {
            ['width'] = 800, --larghezza immagine pagina
            ['height'] = 600, --altezza immagine pagina
        },
    },
    ['demo_guide'] = {
        ['pages'] = {
            { pageName = "copertina", type = 'hard', source = 'local' }, --Copertina anteriore
            { pageName = "1", type = 'hard', source = 'local' }, --Interni copertina anteriore
            { pageName = "2", type = 'normal', source = 'local' }, --Pagina 2
            { pageName = "3", type = 'normal', source = 'local' }, --Pagina 3
            { pageName = "4", type = 'hard', source = 'local' }, --Interni copertina posteriore
            { pageName = "copertina_posteriore", type = 'hard', source = 'local' }, --Copertina posteriore
        },
        ['prop'] = 'book', -- es. book, map
        ['size'] = {
            ['width'] = 800, --larghezza immagine pagina
            ['height'] = 600, --altezza immagine pagina
        },
    },
}
