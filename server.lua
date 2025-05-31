local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('busjob:finish', function(routeKey)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local reward = Config.Rewards[routeKey]
    if reward then
        Player.Functions.AddMoney('cash', reward.money, 'busjob-payment')
        if reward.item then
            exports.ox_inventory:AddItem(src, reward.item.name, reward.item.count)
        end
    end
end)
