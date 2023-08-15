--https://github.com/SinisterRectus/Discordia　手順についてはこちら
--windowsは動作確認、linuxは動作未確認
--linuxを動作させるためには、https://luvit.io/install.html　を開きチュートリアル沿った手順でインストール
local discordia = require('discordia')
local client = discordia.Client()

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)

client:on('messageCreate', function(message)
	if message.content == '!ping' then
		message.channel:send('Pong!')
	end
end)

client:run('Bot ')
