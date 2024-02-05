local Peds = {}
local blipEntity = {}

SpawnColis = false

function SpawnPNJAttack3()
    local hashKey = GetHashKey(Config.PNJ[3])
    RequestModel(hashKey)
    while not HasModelLoaded(hashKey) do
        Wait(1)
    end

    for i=1, Config.NumberPedMission3 do
        Peds[#Peds + 1] = CreatePed(4, hashKey, Config.PosSpawnPedUSB3, Config.PosRecupUSB3, false, true)
        TaskCombatPed(Peds[#Peds], PlayerPedId(), 0, 16)
        GiveWeaponToPed(Peds[#Peds], GetHashKey(Config.WeapondPeds[3]), 250, false, true)
        SetPedAccuracy(Peds[#Peds], 20)

        blipEntity[Peds[#Peds]] = AddBlipForEntity(Peds[#Peds])
        SetBlipSprite(blipEntity[Peds[#Peds]], 84)
        SetBlipColour(blipEntity[Peds[#Peds]], 1)
        SetBlipScale(blipEntity[Peds[#Peds]], 0.8)
        SetBlipAsShortRange(blipEntity[Peds[#Peds]], true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Ennemi')
    end

    while true do
        Wait(1)
        for i=1, #Peds do
            if DoesEntityExist(Peds[i]) then
                if IsPedDeadOrDying(Peds[i]) then
                    RemoveBlip(blipEntity[Peds[i]])
                    table.remove(Peds, i)
                end
            end
        end
    end



    SpawnColis = true

end

local colisRecupere = false

RegisterNetEvent("Larry:RecupColis3")
AddEventHandler("Larry:RecupColis3", function()
    if colisRecupere then
        lib.notify({
            title = 'Colis déjà récupéré',
            description = 'Vous avez déjà récupéré le colis !',
            type = 'error'
        })
        -- Wait(5000)
        -- colisRecupere = false 
        return
    end

    TriggerServerEvent("usb3:recup")
    DeleteEntity(Peds[#Peds])

    lib.notify({
        title = 'Colis récupéré',
        description = 'Vous avez récupéré le colis félicitation vous venez de réussir la mission !',
        type = 'success'
    })

    RemoveBlip(radius)

    colisRecupere = true 

end)

                    
CreateThread(function()

    local model = GetHashKey(Config.Props[2])
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    Peds[#Peds + 1] = CreateObject(model, Config.PosRecupUSB3.x, Config.PosRecupUSB3.y, Config.PosRecupUSB3.z - 1, true, true, true)
    FreezeEntityPosition(bags, true)
    

    exports.ox_target:addBoxZone({
        coords = vec3(Config.PosRecupUSB3),
        size = vec3(3, 3, 3),
        rotation = 45,
        debug = drawZones,
        drawSprite = true,
        options = {
            {
                name = 'box',
                event = 'Larry:RecupColis3',
                icon = 'fa-solid fa-cube',
                label = "Récupérer le colis",
            }
        }
    })





end)


RegisterNetEvent('usb3:useKey')
AddEventHandler('usb3:useKey', function()

    lib.notify({
        title = 'Clé usb3',
        description = 'Vous avez utilisé la clé usb3 une mission vient de commencer aller dans la zone récupérer le colis',
        type = 'success'
    })


    radius = AddBlipForRadius(Config.PosMissionUSB3, 100.0, 0, 0, 0.5)
    SetBlipColour(radius, 1)
    SetBlipAlpha(radius, 80)

    SpawnPNJAttack3()

    SpawnColis = true

end)


