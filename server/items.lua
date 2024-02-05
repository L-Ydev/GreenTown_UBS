ESX.RegisterUsableItem('usb1', function(source)

    TriggerClientEvent('usb1:useKey', source)   

end)

ESX.RegisterUsableItem('usb2', function(source)

    TriggerClientEvent('usb2:useKey', source)   

end)

ESX.RegisterUsableItem('usb3', function(source)

    TriggerClientEvent('usb3:useKey', source)   

end)


RegisterServerEvent('usb1:recup')
AddEventHandler('usb1:recup', function()

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem(Config.ItemFinish[1], 1)

    xPlayer.removeInventoryItem('usb1', 1)

end)

RegisterServerEvent('usb2:recup')
AddEventHandler('usb2:recup', function()

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem(Config.ItemFinish[2], 1)

    xPlayer.removeInventoryItem('usb2', 1)

end)


RegisterServerEvent('usb3:recup')
AddEventHandler('usb3:recup', function()

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem(Config.ItemFinish[3], 1)

    xPlayer.removeInventoryItem('usb3', 1)

end)