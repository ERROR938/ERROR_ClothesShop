local function GetPlayerSkin()

    local player_skin = {}

    ESX.TriggerServerCallback("error:getPLayerClothes", function(skin)

        player_skin = skin
        
    end)

    Wait(300)

    return player_skin

end

ERROR = {}

function CreateClotheMenu()

    local p_skin = GetPlayerSkin()

    local validate = false

    ERROR.Base = {

        Header = {"commonmenu", "interaction_bgd"},
        Color = {color_Green},
        HeaderColor = {255, 255, 255},
        Title = "Magasin de vêtement"

    }

    ERROR.Data = {currentMenu = "interactions"}

    ERROR.Events = {

        onSlide = function(data, btn, ___)

            local ped = PlayerPedId()

            if data.currentMenu == "torses" then

                SetPedComponentVariation(ped, 11, btn.num, tonumber(btn.slidenum-1), 1)

                p_skin["torso_2"] = tonumber(btn.slidenum-1)

            end

            if data.currentMenu == "chaussures" then 

                SetPedComponentVariation(ped, 6, btn.num, tonumber(btn.slidenum-1), 1)

                p_skin["shoes_2"] = tonumber(btn.slidenum-1)
                
            end
            
            if data.currentMenu == "t-shirts" then
                
                SetPedComponentVariation(ped, 8, btn.num, tonumber(btn.slidenum-1), 1)

                p_skin["tshirt_2"] = tonumber(btn.slidenum-1)
                
                
            end

            if data.currentMenu == "pantalons" then

                SetPedComponentVariation(ped, 4, btn.num, tonumber(btn.slidenum-1), 1)

                p_skin["pants_2"] = tonumber(btn.slidenum-1)
    
            end

        end,

        onBack = function(data, testt)

            if not validate and data.currentMenu == "interactions" then

                p_skin = GetPlayerSkin()

                TriggerEvent('skinchanger:loadClothes', p_skin)

            end

        end,

        onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
            
            if string.find(btn.name, "Valider") then

                ESX.TriggerServerCallback("error:payPlayerSkin", function(cb)

                    if cb then 

                        validate = true
        
                        TriggerServerEvent('esx_skin:save', p_skin)
        
                        ESX.ShowNotification("Vous venez de validez votre tenue")

                    end
    
                end)

            end

            if string.find(btn.name, "Enregistrer") then

                local name = KeyboardInput("Nom de votre nouvelle tenue", "", 70)

                if not name then return end

                TriggerServerEvent("error:addClothe", name, p_skin)

                ERROR.Menu['mes tenues'].b()

                Back()

            end

            if _.currentMenu == "mes tenues" then 

                if btn.skinn then

                    if btn.slidenum == 1 then 

                        TriggerEvent("skinchanger:loadClothes", btn.skinn)

                        TriggerServerEvent('esx_skin:save', btn.skinn)

                    elseif btn.slidenum == 2 then

                        local newName = KeyboardInput("Nouveau nom", "", 100)

                        if newName == nil then return end

                        TriggerServerEvent("error:EditClotheName", newName, btn.blaze)

                        Back()

                    else

                        local delete = KeyboardInput("Oui / Non", "", 3)

                        if delete:lower() == "oui" then 

                            TriggerServerEvent("error:DelClotheName", btn.blaze)

                            Back()

                        end

                    end

                end

            end

        end,

        onButtonSelected = function(currentMenu, index, _, btn, self)

            local ped = PlayerPedId()

            if currentMenu == "torses" then

                SetPedComponentVariation(ped, 11, btn.num, 0, 1)

                p_skin["torso_1"] = btn.num

            end

            if currentMenu == "chaussures" then 

                SetPedComponentVariation(ped, 6, btn.num, 00, 1)

                p_skin["shoes_1"] = btn.num
                
            end
            
            if currentMenu == "t-shirts" then
                
                SetPedComponentVariation(ped, 8, btn.num, 0, 1)

                p_skin["tshirt_1"] = btn.num
                
                
            end

            if currentMenu == "pantalons" then

                SetPedComponentVariation(ped, 4, btn.num, 00, 1)

                p_skin["pants_1"] = btn.num
    
            end

            if currentMenu == "lunettes" then

                SetPedPropIndex(ped, 1, btn.num, 0, false)

                p_skin["glasses_1"] = btn.num
    
            end

            if currentMenu == "bras" then

                SetPedComponentVariation(ped, 3, btn.num, 0, 1)

                p_skin['arms'] = btn.num
                p_skin['arms_2'] = 0
    
            end

            if currentMenu == "sacs" then

                SetPedComponentVariation(ped, 5, btn.num, 0, 1)

                p_skin["bags_1"] = btn.num
    
            end

            if currentMenu == "montres" then

                SetPedPropIndex(ped, 6, btn.num, 0, false)

                p_skin["watches_1"] = btn.num
    
            end

            if currentMenu == "chapeaux" then

                SetPedPropIndex(ped, 0, btn.num, 0, false)

                p_skin["helmet_1"] = btn.num
    
            end

            if currentMenu == "bracelets" then

                SetPedPropIndex(ped, 7, btn.num, 0, false)

                p_skin["bracelets_1"] = btn.num
    
            end

        end
    }

    ERROR.Menu = {

        ['interactions'] = {

            b = {

                {name = "Liste des articles", ask = "→", askX = true},
                {name = "Mes tenues", ask = "→", askX = true}

            }

        },

        ['liste des articles'] = {

            b = {

                {name = "Torses", ask = "→", askX = true},
                {name = "T-Shirts", ask = "→", askX = true},
                {name = "Pantalons", ask = "→", askX = true},
                {name = "Bras", ask = "→", askX = true},
                {name = "Chaussures", ask = "→", askX = true},
                {name = "Sacs", ask = "→", askX = true},
                {name = "Autres", ask = "→", askX = true},
                {name = "~g~Valider mes choix", ask = "→", askX = true},

            }

        },

        ['torses'] = {

            b = getAllTorseVariation

        },

        ['chaussures'] = {

            b = getAllShoesVariation

        },

        ['t-shirts'] = {

            b = getAllTShirtVariation

        },

        ['bras'] = {

            b = getAllBrasVariation

        },

        ['pantalons'] = {

            b = getAllLegsVariation

        },

        ['sacs'] = {

            b = getAllBagsVariation

        },

        ['autres'] = {

            b = {

                {name = "Chapeaux", ask = "→", askX = true},
                {name = "Lunettes", ask = "→", askX = true},
                {name = "Montres", ask = "→", askX = true},
                {name = "Bracelets", ask = "→", askX = true},

            }

        },

        ['montres'] = {

            b = getAllWatchVariation

        },

        ['lunettes'] = {

            b = getAllGlassVariation

        },

        ['chapeaux'] = {

            b = getAllHatVariation

        },

        ['bracelets'] = {

            b = getAllBraceletVariation

        },

        ['mes tenues'] = {

            b = function()

                local all_btn = {
                    
                    {name = "Enregistrer une tenue", ask = "→", askX = true},
                    {name = "\t\t\t↓ Liste des tenues ↓", ask = "", askX = true}

                }

                ESX.TriggerServerCallback("error:getClothes", function(clothes)

                    if clothes[1] then

                        for k,v in pairs(clothes) do

                            all_btn[#all_btn+1] = {

                                name = v.name,
                                slidemax = {"Equiper", "Renomer", "Supprimer"},
                                skinn = json.decode(v.skin),
                                blaze = v.name

                            }

                        end

                    else

                        all_btn[3] = {

                            name = "Aucune tenue",
                            ask = "→",
                            askX = true

                        }

                    end
                    
                end)

                while #all_btn == 2 do Wait(0) end

                return all_btn

            end

        }

    }

    return ERROR

end
