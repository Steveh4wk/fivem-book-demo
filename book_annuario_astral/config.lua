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
    enabled = true,
    botToken = "IL_TUO_BOT_TOKEN_DISCORD", -- Sostituisci con il token del tuo bot
    guildId = "IL_TUO_SERVER_ID", -- Sostituisci con l'ID del tuo server
    channelId = "IL_TUO_CANALE_ID", -- Sostituisci con l'ID del tuo canale
}

-- Configurazione dei libri disponibili
Config.Books = {
    ['guida_turistica'] = {
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
    ['progetti_pacific'] = {
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
    ['annuario_scolastico_2005'] = {
        ['pages'] = {
            { pageName = "COPERTINA", type = 'hard', source = 'local' }, --Copertina anteriore
            { pageName = "PAGINA_1", type = 'normal', source = 'local' }, --Prima pagina
            { pageName = "PAGINA_VUOTA", type = 'normal', source = 'local' }, --Pagina 2
            { pageName = "PAGINA_VUOTA", type = 'normal', source = 'local' }, --Pagina 3
            { pageName = "PAGINA_VUOTA", type = 'normal', source = 'local' }, --Pagina 4
            { pageName = "PAGINA_VUOTA", type = 'normal', source = 'local' }, --Pagina 5
            { pageName = "PAGINA_VUOTA", type = 'normal', source = 'local' }, --Pagina 6
            { pageName = "PAGINA_VUOTA", type = 'normal', source = 'local' }, --Pagina 7
            { pageName = "PAGINA_VUOTA", type = 'normal', source = 'local' }, --Pagina 8
            { pageName = "PAGINA_VUOTA", type = 'normal', source = 'local' }, --Pagina 9
            { pageName = "COPERTINA_END", type = 'hard', source = 'local' }, --Copertina posteriore
        },
        ['prop'] = 'book',
        ['size'] = {
            ['width'] = 720,
            ['height'] = 600,
        },
    },
}