ESX = nil
playerData = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	playerData = ESX.GetPlayerData()
end)

for _,v in pairs(Config.pos) do

    local blip = AddBlipForCoord(v.x, v.y, v.z)
    SetBlipSprite (blip, 73)
    SetBlipScale  (blip, 0.8)
    SetBlipDisplay(blip, 4)
    SetBlipColour (blip, 26)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Magasin de vêtement")
    EndTextCommandSetBlipName(blip)

    CreateThread(function()
    
        local pos, dst
        local coords = vector3(v.x, v.y, v.z)
        local wait = 1000

        while true do

            pos = GetEntityCoords(PlayerPedId())
            dst = #(pos - coords)

            if dst <= 2 then 

                wait = 0

                ESX.ShowHelpNotification("Appuie sur ~INPUT_CONTEXT~ pour acceder au magasin de ~b~vêtement")

                if IsControlJustPressed(0, 51) then 

                    CreateMenu(CreateClotheMenu())

                end

            else

                wait = 1000

            end

            Wait(wait)
        end
    
    end)

end