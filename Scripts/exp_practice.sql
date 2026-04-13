-- Reset tables
DROP TABLE IF EXISTS room_connection;
DROP TABLE IF EXISTS npc;
DROP TABLE IF EXISTS explorer;
DROP TABLE IF EXISTS treasure;
DROP TABLE IF EXISTS room;

-- Create tables
CREATE TABLE room (
    room_id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT
);

CREATE TABLE treasure (
    treasure_id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    value DECIMAL(10,2),
    weight DECIMAL(10,2),
    room_id INT,
    FOREIGN KEY (room_id) REFERENCES room(room_id)
);

CREATE TABLE explorer (
    explorer_id INT PRIMARY KEY,
    name VARCHAR(100),
    room_id INT,
    FOREIGN KEY (room_id) REFERENCES room(room_id)
);

CREATE TABLE npc (
    npc_id INT PRIMARY KEY,
    type VARCHAR(50),
    room_id INT,
    treasure_id INT,
    FOREIGN KEY (room_id) REFERENCES room(room_id),
    FOREIGN KEY (treasure_id) REFERENCES treasure(treasure_id)
);

CREATE TABLE room_connection (
    room_a INT,
    room_b INT,
    PRIMARY KEY (room_a, room_b),
    FOREIGN KEY (room_a) REFERENCES room(room_id),
    FOREIGN KEY (room_b) REFERENCES room(room_id)
)

-- Stored procedures
DELIMITER $$

-- Add a room
CREATE PROCEDURE create_room(IN id INT, IN r_name VARCHAR(100), IN r_desc TEXT)
BEGIN
    START TRANSACTION;
    INSERT INTO room VALUES (id, r_name, r_desc);
    COMMIT;
END$$

-- Add a treasure
CREATE PROCEDURE create_treasure(
    IN id INT,
    IN t_name VARCHAR(100),
    IN t_desc TEXT,
    IN t_value DECIMAL(10,2),
    IN t_weight DECIMAL(10,2)
)
BEGIN
    START TRANSACTION;
    INSERT INTO treasure (treasure_id, name, description, value, weight)
    VALUES (id, t_name, t_desc, t_value, t_weight);
    COMMIT;
END$$

-- Add trader NPC and give them treasure
CREATE PROCEDURE create_npc_trader(IN n_id INT, IN r_id INT, IN t_id INT)
BEGIN
    START TRANSACTION;
    INSERT INTO npc VALUES (n_id, 'Trader', r_id, t_id);
    UPDATE treasure SET room_id = NULL WHERE treasure_id = t_id;
    COMMIT;
END$$

DELIMITER ;

-- Create rooms
CALL create_room(1, 'Start Room', 'Where the game begins');
CALL create_room(2, 'Hallway', 'A long hallway');
CALL create_room(3, 'Library', 'Old books everywhere');
CALL create_room(4, 'Treasure Room', 'Lots of loot');
CALL create_room(5, 'Empty Room', 'Nothing here');

-- Connect rooms
START TRANSACTION;
INSERT INTO room_connection VALUES (1, 2);
INSERT INTO room_connection VALUES (2, 3);
INSERT INTO room_connection VALUES (3, 4);
INSERT INTO room_connection VALUES (3, 5);
COMMIT;

-- Create treasures
CALL create_treasure(1, 'Gold', 'Shiny gold', 500, 2);
CALL create_treasure(2, 'Scroll', 'Magic scroll', 300, 1);
CALL create_treasure(3, 'Shield', 'Strong shield', 200, 5);
CALL create_treasure(4, 'Ring', 'Magic ring', 700, 1);
CALL create_treasure(5, 'Amulet', 'Lucky charm', 400, 1);
CALL create_treasure(6, 'Dagger', 'Sharp blade', 250, 2);
CALL create_treasure(7, 'Coins', 'Bag of coins', 100, 1);

-- Place treasures in rooms
START TRANSACTION;
UPDATE treasure SET room_id = 1 WHERE treasure_id = 1;
UPDATE treasure SET room_id = 2 WHERE treasure_id = 2;
UPDATE treasure SET room_id = 2 WHERE treasure_id = 3;
UPDATE treasure SET room_id = 4 WHERE treasure_id = 5;
UPDATE treasure SET room_id = 4 WHERE treasure_id = 6;
UPDATE treasure SET room_id = 3 WHERE treasure_id = 7;
COMMIT;

-- Create NPC
CALL create_npc_trader(1, 3, 4);

-- Create player
START TRANSACTION;
INSERT INTO explorer VALUES (1, 'Player1', 1);
COMMIT;