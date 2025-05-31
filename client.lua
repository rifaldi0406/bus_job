--#Rifaldi

local QBCore = exports['qb-core']:GetCoreObject()
local routeData, currentRouteKey, busVeh, stopIndex = nil, nil, nil, 1

-- Pastikan function StartRoute didefinisikan dulu
function StartRoute(routeKey)
    routeData = Config.Routes[routeKey]
    currentRouteKey = routeKey
    stopIndex = 1

    local spawnPoint = Config.SpawnPoints[routeKey]
    QBCore.Functions.SpawnVehicle(Config.BusModel, function(veh)
        busVeh = veh
        SetVehicleNumberPlateText(veh, "BUSJOB")
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        NextStop()
    end, spawnPoint, true)
end

-- Register context menu
exports.ox_lib:registerContext({
    id = 'bus_menu',
    title = 'Pilih Rute Bus',
    options = {
        { title = 'Rute Kota', onSelect = function() StartRoute('city') end },
        { title = 'Rute Sandy Shores', onSelect = function() StartRoute('sandy') end },
        { title = 'Rute Paleto Bay', onSelect = function() StartRoute('paleto') end },
    }
})

-- Thread untuk buka menu
CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        if #(coords - Config.SelectionPoint) < 2.0 then
            DrawText3D(Config.SelectionPoint, '[E] Mulai Pekerjaan Bus')
            if IsControlJustReleased(0, 38) then
                exports.ox_lib:showContext('bus_menu')
            end
        end
    end
end)

function NextStop()
    if stopIndex > #routeData.stops then
        GoToReturnPoint()
        return
    end

    local target = routeData.stops[stopIndex]
    local blip = AddBlipForCoord(target)
    SetBlipRoute(blip, true)

    CreateThread(function()
        local interacted = false
        while not interacted do
            Wait(0)
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)

            DrawMarker(36, target.x, target.y, target.z + 1.5, 0, 0, 0, 0, 0, 0, 3.5, 3.5, 3.5, 255, 255, 0, 200, false, true, 2, false, nil, nil, false)

            if #(coords - target) < 3.5 then
                DrawText3D(target, '[E] Layani Penumpang')
                if IsControlJustReleased(0, 38) and IsPedInAnyVehicle(playerPed, false) then
                    exports['ox_lib']:progressCircle({
                        duration = 4000,
                        label = 'Melayani Penumpang...',
                        position = 'bottom',
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            move = true,
                            car = true,
                            mouse = false,
                        },
                    })

                    RemoveBlip(blip)
                    stopIndex += 1
                    interacted = true
                    Wait(500)
                    NextStop()
                    break
                end
            end
        end
    end)
end

 

function GoToReturnPoint()
    local returnCoords = routeData.returnPoint
    local blip = AddBlipForCoord(returnCoords)
    SetBlipRoute(blip, true)

    CreateThread(function()
        local interacted = false
        while not interacted do
            Wait(0)
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)

            -- Panah besar kuning di lokasi pengembalian
            DrawMarker(36, returnCoords.x, returnCoords.y, returnCoords.z + 1.5, 0, 0, 0, 0, 0, 0, 3.5, 3.5, 3.5, 0, 255, 0, 200, false, true, 2, false, nil, nil, false)

            if #(coords - returnCoords) < 3.5 then
                DrawText3D(returnCoords, '[E] Kembalikan Bus')
                if IsControlJustReleased(0, 38) and IsPedInAnyVehicle(playerPed, false) then
                    interacted = true

                    -- Progress bar pengembalian
                    exports['ox_lib']:progressCircle({
                        duration = 4000,
                        label = 'Mengembalikan Bus...',
                        position = 'bottom',
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            move = true,
                            car = true,
                            mouse = false,
                        },
                    })

                    RemoveBlip(blip)
                    Wait(500)
                    FinishRoute()
                    break
                end
            end
        end
    end)
end



function FinishRoute()
    DeleteEntity(busVeh)
    TriggerServerEvent('busjob:finish', currentRouteKey)
    exports['ox_lib']:notify({
        title = 'Bus Job',
        description = 'Rute selesai dan bus dikembalikan!',
        type = 'success'
    })

    routeData, currentRouteKey, busVeh, stopIndex = nil, nil, nil, 1
end



function DrawText3D(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
end
