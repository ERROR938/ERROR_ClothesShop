function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)

    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    blockinput = true
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        if result == "" then
            return
        end
        blockinput = false
        return result
    else
        Wait(500)
        blockinput = false
        return nil
    end

end

local function setRange(start, finish)

    local tab = {}

    for i = start, finish do

        tab[#tab+1] = i

    end

    return tab

end

function getAllTorseVariation()

    local all_btn = {}

    for i = 1, GetNumberOfPedDrawableVariations(PlayerPedId(), 11) do

        all_btn[#all_btn+1] = {

            name = "Torse "..i,
            slidemax = setRange(0, GetNumberOfPedTextureVariations(PlayerPedId(), 11, i)),
            askX = true,
            num = i-1-1

        }

    end

    return all_btn

end

function getAllShoesVariation()

    local all_btn = {}

    for i = 1, GetNumberOfPedDrawableVariations(PlayerPedId(), 6) do

        all_btn[#all_btn+1] = {

            name = "Chaussures "..i,
            slidemax = setRange(0, GetNumberOfPedTextureVariations(PlayerPedId(), 6, i)),
            askX = true,
            num = i-1

        }

    end

    return all_btn

end

function getAllTShirtVariation()

    local all_btn = {}

    for i = 1, GetNumberOfPedDrawableVariations(PlayerPedId(), 8) do

        all_btn[#all_btn+1] = {

            name = "T-Shirt "..i,
            slidemax = setRange(0, GetNumberOfPedTextureVariations(PlayerPedId(), 8, i)),
            askX = true,
            num = i-1

        }

    end

    return all_btn

end

function getAllBeardVariation()

    local all_btn = {}

    for i = 1, GetNumberOfPedDrawableVariations(PlayerPedId(), 1) do

        all_btn[#all_btn+1] = {

            name = "Barbe "..i,
            slidemax = setRange(0, GetNumberOfPedTextureVariations(PlayerPedId(), 1, i)),
            askX = true,
            num = i-1

        }

    end

    return all_btn

end

function getAllBrasVariation()

    local all_btn = {}

    for i = 1, GetNumberOfPedDrawableVariations(PlayerPedId(), 3) do

        all_btn[#all_btn+1] = {

            name = "Bras "..i,
            ask = "→",
            askX = true,
            num = i-1

        }

    end

    return all_btn

end

function getAllLegsVariation()

    local all_btn = {}

    for i = 1, GetNumberOfPedDrawableVariations(PlayerPedId(), 4) do

        all_btn[#all_btn+1] = {

            name = "Pantalon "..i,
            slidemax = setRange(0, GetNumberOfPedTextureVariations(PlayerPedId(), 4, i)),
            askX = true,
            num = i-1

        }

    end

    return all_btn

end

function getAllGlassesVariation()

    local all_btn = {}

    for i = 1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 1) do

        all_btn[#all_btn+1] = {

            name = "Lunette "..i,
            ask = "→",
            askX = true,
            num = i-1

        }

    end

    return all_btn

end

function getAllWatchVariation()

    local all_btn = {}

    for i = 1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 6) do

        all_btn[#all_btn+1] = {

            name = "Montre "..i,
            ask = "→",
            askX = true,
            num = i-1

        }

    end

    return all_btn

end

function getAllHatVariation()

    local all_btn = {}

    for i = 1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 0) do

        all_btn[#all_btn+1] = {

            name = "Chapeau "..i,
            ask = "→",
            askX = true,
            num = i-1

        }

    end

    return all_btn

end

function getAllGlassVariation()

    local all_btn = {}

    for i = 1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 1) do

        all_btn[#all_btn+1] = {

            name = "Lunette "..i,
            ask = "→",
            askX = true,
            num = i-1

        }

    end

    return all_btn

end

function getAllBraceletVariation()

    local all_btn = {}

    for i = 1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), 7) do

        all_btn[#all_btn+1] = {

            name = "Bracelet "..i,
            ask = "→",
            askX = true,
            num = i-1

        }

    end

    return all_btn

end

function getAllBagsVariation()

    local all_btn = {}

    for i = 1, GetNumberOfPedDrawableVariations(PlayerPedId(), 5) do

        all_btn[#all_btn+1] = {

            name = "Sac "..i,
            ask = "→",
            askX = true,
            num = i-1

        }

    end

    return all_btn

end