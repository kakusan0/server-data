-- データベースの存在を確認して、存在しない場合にデータベースを作成
CREATE DATABASE IF NOT EXISTS fivem
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

-- データベースを選択
USE fivem;

-- テーブルの存在を確認して、存在しない場合にテーブルを作成
CREATE TABLE IF NOT EXISTS players (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255)CHARACTER SET UTF8MB4 COLLATE UTF8MB4_GENERAL_CI,
    drop_x FLOAT,
    drop_y FLOAT,
    drop_z FLOAT,
    up_x FLOAT,
    up_y FLOAT,
    up_z FLOAT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
