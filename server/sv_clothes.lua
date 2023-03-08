ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback("error:payPlayerSkin", function(source, cb)

    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getAccount('money').money >= Config.price then

        xPlayer.removeAccountMoney('money', Config.price)

        xPlayer.showNotification("Vous venez de vous changer pour "..Config.price.."$")

        cb(true)

        return

    end

    xPlayer.showNotification("~r~Vous n'avez pas assez")

    cb(false)

end)

ESX.RegisterServerCallback("error:getClothes", function(source, cb)

    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll("SELECT * FROM saved_clothes WHERE owner = ?", {xPlayer.identifier}, function(result)
    
        cb(result)
    
    end)

end)

RegisterNetEvent("error:addClothe", function(name, skin)

    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute("INSERT INTO `saved_clothes` (`name`, `skin`, `owner`) VALUES (@a, @b, @c)", {

        ['@a'] = name, 
        ['@b'] = json.encode(skin), 
        ['@c'] = xPlayer.identifier

    })

end)

ESX.RegisterServerCallback("error:getPLayerClothes", function(source, cb)

    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = ?", {xPlayer.identifier}, function(result)
    
        cb(json.decode(result[1].skin))
    
    end)

end)

RegisterNetEvent("error:EditClotheName", function(name, oldName)

    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute("UPDATE saved_clothes SET name = ? WHERE owner = ? AND name = ?", {name, xPlayer.identifier, oldName})

end)

RegisterNetEvent("error:DelClotheName", function(name)

    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute("DELETE FROM saved_clothes WHERE name = ? and owner = ?", {name, xPlayer.identifier})

end)
