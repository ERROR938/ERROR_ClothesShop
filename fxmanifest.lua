fx_version('cerulean')
games({ 'gta5' })

shared_script('config.lua');

server_scripts({

    "@mysql-async/lib/MySQL.lua",
    "server/sv_clothes.lua"

});

client_scripts({

    "lib/pmenu.lua",
    "client/cl_*.lua"

});