fx_version 'cerulean'
games { 'gta5' }

description 'A script to save player positions'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server.lua'
}

client_script {
    'client.lua'
}

dependencies {
    'mysql-async'
}
