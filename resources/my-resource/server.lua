--開始-------- welcome ----------
-- プレイヤー接続時の処理
AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    local source = source
    local Name = GetPlayerName(source)
    deferrals.defer()
    MySQL.Async.fetchAll(
        [[
INSERT INTO fivem.players (name) SELECT @steamName
 WHERE NOT EXISTS (SELECT 1 FROM fivem.players WHERE name = @steamName
) LIMIT 1; SELECT
    name
FROM
    fivem.players
WHERE
    name = @steamName;
        ]]
        , {
            ['@steamName'] = Name
        }, function(result)
            print("[debug] name:" .. result[2][1].name)
            TriggerClientEvent('welcome', source)
            deferrals.done()
        end)
end)
--終了-------- welcome ----------

--開始-------- 位置情報関係 ----------
RegisterNetEvent('requestLocation_')
AddEventHandler('requestLocation_', function()
    local source = source
    local name = GetPlayerName(source)
    MySQL.Async.fetchAll(
        [[
SELECT
    IFNULL(drop_x, 686.245) AS drop_x,
    IFNULL(drop_y, 577.950) AS drop_y,
    IFNULL(drop_z, 130.461) AS drop_z
FROM
    fivem.players
WHERE
    name = @player_name;

SELECT name FROM fivem.players WHERE name=@player_name;
    ]]
    ,
        {
            ['@player_name'] = name
        }, function(result)
            print("[debug] location-x:" .. result[1][1].drop_x)
            print("[debug] location-y:" .. result[1][1].drop_y)
            print("[debug] location-z:" .. result[1][1].drop_z)
            TriggerClientEvent('Location', source, result[1][1].drop_x, result[1][1].drop_y, result[1][1].drop_z)
        end)
end)

-- RegisterServerEvent('savePlayerPosition')
-- AddEventHandler('savePlayerPosition', function(playerName, x, y, z)
--     local source = source

--     MySQL.Async.fetchAll('SELECT * FROM player_lastlocation WHERE player_name = @player_name', {
--         ['@player_name'] = playerName
--     }, function(result)
--         if not result[1] then
--             print("12")
--             MySQL.Async.execute(
--                 'INSERT INTO player_lastlocation (player_name, last_x, last_y, last_z) VALUES (@player_name, @x, @y, @z)',
--                 {
--                     ['@player_name'] = playerName,
--                     ['@x'] = x,
--                     ['@y'] = y,
--                     ['@z'] = z
--                 })
--         else
--             print("13")
--             MySQL.Async.execute(
--                 'UPDATE player_lastlocation SET last_x = @x, last_y = @y, last_z = @z WHERE player_name = @player_name',
--                 {
--                     ['@player_name'] = playerName,
--                     ['@x'] = x,
--                     ['@y'] = y,
--                     ['@z'] = z
--                 })
--         end
--         TriggerClientEvent("setlocation", source)
--     end)
-- end)

AddEventHandler('playerDropped', function(reason)
    local source = source
    local playername = GetPlayerName(source)
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(source), false))

    MySQL.Async.execute([[
UPDATE fivem.players p1
JOIN (SELECT id FROM fivem.players WHERE name = @playername LIMIT 1) p2
ON p1.id = p2.id
SET
    p1.drop_x = @x,
    p1.drop_y = @y,
    p1.drop_z = @z;
    ]]
    , {
        ['@playername'] = playername,
        ['@x'] = x,
        ['@y'] = y,
        ['@z'] = z
    }, function(affectedRows)
        if affectedRows and affectedRows > 0 then
            print("Updated " .. affectedRows .. " rows.")
        else
            print("Failed to update player coordinates.")
        end
    end)
end)
--終了-------- 位置情報関係 ----------

--開始-------- テスト系 ----------
RegisterNetEvent('test1')
AddEventHandler('test1', function(reason)
    local source = source
    local playername = GetPlayerName(source)
    TriggerClientEvent("test1", source, playername)
end)
--終了-------- テスト系 ----------
