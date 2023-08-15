--開始-------- welcome ----------
local disableKey = false
-- Eキーの無効化を監視するスレッド
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if disableKey then
            DisableControlAction(0, 245, true)
        end
    end
end)
-- キーの無効化を制御する関数
function DisableEKey(temporarilyDisable)
    disableKey = temporarilyDisable
end

RegisterNetEvent('welcome')
AddEventHandler('playerSpawned', function()
    local name = GetPlayerName(PlayerId())
    DisableEKey(true)
    TriggerEvent('chat:addMessage', {
        color = { 255, 255, 0 },
        multiline = true,
        args = { "[SERVER]", 'welcome ' .. name }
    })
    Citizen.Wait(5000)
    TriggerEvent('chat:clear')
    DisableEKey(false)
end)
--終了-------- welcome ----------

--開始-------- コマンド ----------
-- 現在の位置をサーバーに保存するコマンド
-- RegisterCommand("setlocation", function(source, args, rawCommand)
--     local playerPed = PlayerPedId()
--     local location = GetEntityCoords(playerPed)
--     local name = GetPlayerName(PlayerId())
--     TriggerServerEvent('savePlayerPosition', source, name, location.x, location.y, location.z)
-- end, false)

-- 指定された位置に移動するコマンド
RegisterCommand("golocation", function(source, args, rawCommand)
    local x = tonumber(args[1]) or 0
    local y = tonumber(args[2]) or 0
    local z = tonumber(args[3]) or 0
    local model = args[4] or 'a_m_m_skater_01'
    location(x, y, z, model)
end, false)
RegisterCommand("clear", function(source, args, rawCommand)
    TriggerEvent('chat:clear')
end, false)
--終了-------- コマンド ----------

--開始-------- 位置情報関係 ----------
-- プレイヤーの位置を設定する関数
function location(x, y, z, model)
    model = model or 'a_m_m_skater_01'
    exports.spawnmanager:setAutoSpawnCallback(function()
        exports.spawnmanager:spawnPlayer({
            x = x,
            y = y,
            z = z,
            model = model
        })
    end)
    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn()
end

-- ゲーム開始時にサーバーから位置情報を要求するイベント
AddEventHandler('onClientGameTypeStart', function(source)
    TriggerServerEvent('requestLocation_', source)
end)
-- サーバーから位置情報を受け取ったときのイベント
RegisterNetEvent('Location')
AddEventHandler('Location', function(x, y, z)
    print(x, y, z)
    location(x, y, z)
end)
--終了-------- 位置情報関係 ----------

--開始-------- テスト系 ----------
RegisterCommand("test", function(source, args, rawCommand)
    TriggerServerEvent('test1', source)
end, false)

RegisterNetEvent('test1')
AddEventHandler('test1', function(name)
    TriggerEvent('chat:addMessage', {
        color = { 255, 255, 0 },
        multiline = true,
        args = { "[SERVER]", name }
    })
end)
--終了-------- テスト系 ----------
