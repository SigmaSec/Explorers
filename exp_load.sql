TRUNCATE TABLE rooms;
TRUNCATE TABLE explorers;
TRUNCATE TABLE npcs;
TRUNCATE TABLE treasures;
TRUNCATE TABLE connections;


INSERT INTO rooms (roomID, name, description) VALUES (1, 'foo', 'bar');
INSERT INTO rooms (roomID, name, description) VALUES (2, 'meep', 'merp');
INSERT INTO rooms (roomID, name, description) VALUES (3, 'ayasdhf', 'empr');
INSERT INTO rooms (roomID, name, description) VALUES (4, 'adjfl', 'aipojdfkl');
INSERT INTO rooms (roomID, name, description) VALUES (5, 'jasjdfoja', 'asdfjlk');
INSERT INTO rooms (roomID, name, description) VALUES (6, 'asldkfjl', 'aslkdjg');
--SIX SEVENN!!
INSERT INTO rooms (roomID, name, description) VALUES (7, 'jaksldjf', 'aldfjlkj');
INSERT INTO rooms (roomID, name, description) VALUES (8, 'adfkjalekfj', 'ioaejgklerj');
CREATE TABLE rooms (
    roomID number,
    name VARCHAR2(50),
    description VARCHAR2(255),

    CONSTRAINT rooms_roomID_pk PRIMARY KEY (roomID),
    CONSTRAINT rooms_name_ck UNIQUE (name)
);

CREATE TABLE explorers (
    expID number,
    name VARCHAR2(255),
    username VARCHAR2(255),
    Room_ID number,

    CONSTRAINT explorers_pk PRIMARY KEY (expID),
    CONSTRAINT rooms_fk FOREIGN KEY (Room_ID) REFERENCES rooms(roomID),
    CONSTRAINT explorers_name_ck UNIQUE (name)
);

CREATE TABLE npcs (
    npcID number,
    type VARCHAR2(255),
    roomID number,

    CONSTRAINT npcs_pk PRIMARY KEY (npcID),
    CONSTRAINT npcs_roomID_fk FOREIGN KEY (roomID) REFERENCES rooms(roomID)
);

CREATE TABLE treasures (
    tresID number,
    expID number,
    npcID number,
    roomID number,
    description VARCHAR2(255),
    value number,
    weight number,

    CONSTRAINT treasure_pk PRIMARY KEY (tresID),
    CONSTRAINT expID_fk FOREIGN KEY (expID) REFERENCES explorers(expID),
    CONSTRAINT npcID_fk FOREIGN KEY (npcID) REFERENCES npcs(npcID),
    CONSTRAINT roomID_fk FOREIGN KEY (roomID) REFERENCES rooms(roomID),
    CONSTRAINT treasure_value_ck CHECK (value > 0),
    CONSTRAINT treasure_weight_ck CHECK (weight >= 0),
    CONSTRAINT has_location_ck CHECK (
        (expID IS NOT NULL AND npcID IS NULL AND roomID IS NULL) OR 
        (npcID IS NOT NULL AND expID IS NULL AND roomID IS NULL) OR
        (roomID IS NOT NULL AND expID IS NULL AND npcID IS NULL)
        )  
);

INSERT INTO connections (room1, room2) VALUES (1, 2);
INSERT INTO connections (room1, room2) VALUES (2, 3);
INSERT INTO connections (room1, room2) VALUES (3, 4);
INSERT INTO connections (room1, room2) VALUES (4, 5);
INSERT INTO connections (room1, room2) VALUES (5, 6);
INSERT INTO connections (room1, room2) VALUES (6, 7);
-- SIX SEVEN!!!
INSERT INTO connections (room1, room2) VALUES (7, 8);
CREATE TABLE connections (
    room1 number,
    room2 number,

    CONSTRAINT connections_rooms_pk PRIMARY KEY (room1, room2),
    CONSTRAINT connections_room1_fk FOREIGN KEY (room1) REFERENCES rooms(roomID),
    CONSTRAINT connections_room2_fk FOREIGN KEY (room2) REFERENCES rooms(roomID),
    CONSTRAINT connections_rooms_ck CHECK (room1 != room2)
);