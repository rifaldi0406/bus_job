fx_version 'cerulean'
game 'gta5'

description 'QBCore Bus Job Script'
author 'Rifaldi'

shared_script 'config.lua'

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

dependencies {
    'qb-core',
    'ox_lib',
    'ox_inventory'
}

lua54 'yes'