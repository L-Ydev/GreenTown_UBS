Config = {


    -- Mission 1

    PosMissionUSB1 = vector3(-1089.7829589844, 4913.033203125, 214.84538269043),
    PosRecupUSB1 = vector3(-1084.5723876953, 4910.8349609375, 214.36892700195),
    PosSpawnPedUSB1 = vector4(-1095.0269775391, 4914.6171875, 215.32354736328, 61.448154449463),
    NumberPedMission1 = 3,
    -- Mission 2

    PosMissionUSB2 = vector3(2431.3996582031, 4985.5063476563, 46.134300231934),
    PosRecupUSB2 = vector3(2431.7229003906, 4985.5385742188, 45.907913208008),  
    PosSpawnPedUSB2 = vector4(2431.2053222656, 4984.5502929688, 45.875675201416, 133.94151306152),
    NumberPedMission2 = 5,

    -- Mission 3

    PosMissionUSB3 = vector3(106.1222076416, -1940.8404541016, 20.8037109375),
    PosSpawnPedUSB3 = vector4(106.11602020264, -1940.8345947266, 20.8037109375, 47.067249298096),
    PosRecupUSB3 = vector3(106.11602020264, -1940.8345947266, 20.8037109375),  
    NumberPedMission3 = 10,
    -- Arme des PNJ

    Props = {
        [1] = "ba_prop_battle_bag_01a",
        [2] = "ba_prop_battle_bag_01a",
        [3] = "ba_prop_battle_bag_01a",
    },


    PNJ = {
        [1] = "s_m_y_swat_01",
        [2] = "s_m_y_swat_01",
        [3] = "s_m_y_swat_01",
    },

    WeapondPeds = {
        [1] = "WEAPON_PISTOL", -- Arme des PNJ Mission 1
        [2] = "WEAPON_CARBINERIFLE", -- Arme des PNJ Mission 2
        [3] = "WEAPON_SNIPERRIFLE", -- Arme des PNJ Mission 3
    },
    
    -- Server side 


    ItemFinish = {
        [1] = "burger",
        [2] = "usb2",
        [3] = "usb3",
    },
}