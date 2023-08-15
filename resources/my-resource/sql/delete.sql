-- レコードを削除
delete from fivem.players
WHERE id = '2';
-- 自動採番をリセット
ALTER TABLE fivem.players AUTO_INCREMENT = 1;

-- 1. 新しいレコードを追加
INSERT INTO fivem.players (name)
SELECT 'kakusanK[JP]'
WHERE NOT EXISTS (SELECT 1 FROM fivem.players WHERE name='kakusanK[JP]')
LIMIT 1;

-- 2. nameがkakusanK[JP]のレコードのIDカラムの値を取得
SELECT id FROM fivem.players WHERE name='kakusanK[JP]';