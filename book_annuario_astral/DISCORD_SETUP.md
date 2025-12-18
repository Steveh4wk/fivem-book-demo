# Discord Integration Setup Guide

## Overview
The Annuario Astral Books system now supports loading images directly from Discord messages. This allows you to update book content by simply sending images to a Discord channel.

## Setup Instructions

### 1. Create a Discord Bot
1. Go to Discord Developer Portal: https://discord.com/developers/applications
2. Create a new application
3. Go to the "Bot" section and create a bot
4. Copy the bot token

### 2. Configure Bot Permissions
Your bot needs the following permissions:
- Read Messages/View Channels
- Read Message History
- Attach Files (if you want to upload images through the bot)

### 3. Get Server and Channel IDs
1. Enable Developer Mode in Discord (Settings > Advanced)
2. Right-click your server and copy the Server ID
3. Right-click the channel where images will be stored and copy the Channel ID

### 4. Update Configuration
Edit `config.lua` and replace the placeholder values:

```lua
Config.Discord = {
    enabled = true,
    botToken = "YOUR_DISCORD_BOT_TOKEN_HERE", -- Replace with your bot token
    guildId = "YOUR_GUILD_ID_HERE", -- Replace with your server ID
    channelId = "YOUR_CHANNEL_ID_HERE", -- Replace with your channel ID
}
```

### 5. Add Bot to Server
1. Go to OAuth2 URL Generator in Discord Developer Portal
2. Select the bot scope
3. Add the required permissions
4. Generate the URL and use it to add the bot to your server

## Usage

### Adding Discord Images to Books
In your book configuration, use Discord message IDs as page names:

```lua
['astral_grimoire'] = {
    ['pages'] = {
        { pageName = "cover", type = 'hard', source = 'local' },
        { pageName = "1234567890123456789", type = 'normal', source = 'discord' }, -- Discord Message ID
        { pageName = "1234567890123456790", type = 'normal', source = 'discord' }, -- Discord Message ID
        { pageName = "backcover",.
```

.type =; 'hard  'hard', . 'local/control
```lua
 . . .
```

### Getting Message IDs
1. Enable Developer Mode in Discord
2. Right-click the message containing the image
3. Select "Copy Message ID"

### Supported Image Sources
- `local`: Images from `html/img/book_name/` folder
- `discord`: Images from Discord messages (using message ID)
- `web`: Direct URLs to images

## Troubleshooting

### Common Issues
1. **Bot Token Invalid**: Ensure the token is correct and the bot is properly configured
2. **Missing Permissions**: Make sure the bot has read access to the channel
3. **Message Not Found**: Verify the message ID is correct and the message contains an image attachment
4. **CORS Issues**: Discord images may have CORS restrictions; consider using a proxy if needed

### Debug Mode
Enable debug logging by adding this to `server/discord.lua`:
```lua
print("Discord Debug: " .. tostring(data))
```

## Security Notes
- Never share your bot token publicly
- Consider using a separate bot token for production
- Regularly rotate your bot tokens
- Limit bot permissions to only what's necessary
