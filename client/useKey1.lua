local Peds = {}
local blipEntity = {}

SpawnColis = false

function SpawnPNJAttack()
    local hashKey = GetHashKey(Config.PNJ[1])
    RequestModel(hashKey)
    while not HasModelLoaded(hashKey) do
        Wait(1)
    end

    for i=1, Config.NumberPedMission1 do
        Peds[#Peds + 1] = CreatePed(4, hashKey, Config.PosSpawnPedUSB1, Config.PosSpawnPedUSB1, false, true)
        TaskCombatPed(Peds[#Peds], PlayerPedId(), 0, 16)
        GiveWeaponToPed(Peds[#Peds], GetHashKey(Config.WeapondPeds[1]), 250, false, true)
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





end

local colisRecupere = false

RegisterNetEvent("Larry:RecupColis")
AddEventHandler("Larry:RecupColis", function()
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

    TriggerServerEvent("usb1:recup")
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

    local model = GetHashKey("ba_prop_battle_bag_01a")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    Peds[#Peds + 1] = CreateObject(model, Config.PosRecupUSB1.x, Config.PosRecupUSB1.y, Config.PosRecupUSB1.z - 1, true, true, true)
    FreezeEntityPosition(bags, true)
    

    exports.ox_target:addBoxZone({
        coords = vec3(Config.PosRecupUSB1),
        size = vec3(3, 3, 3),
        rotation = 45,
        debug = drawZones,
        drawSprite = true,
        options = {
            {
                name = 'box',
                event = 'Larry:RecupColis',
                icon = 'fa-solid fa-cube',
                label = "Récupérer le colis",
            }
        }
    })





end)


RegisterNetEvent('usb1:useKey')
AddEventHandler('usb1:useKey', function()

    lib.notify({
        title = 'Clé usb1',
        description = 'Vous avez utilisé la clé usb1 une mission vient de commencer aller dans la zone récupérer le colis',
        type = 'success'
    })


    radius = AddBlipForRadius(Config.PosMissionUSB1, 100.0, 0, 0, 0.5)
    SetBlipColour(radius, 1)
    SetBlipAlpha(radius, 80)

    SpawnPNJAttack()

    SpawnColis = true

end)