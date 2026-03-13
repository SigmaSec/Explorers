TRUNCATE TABLE treasures;
TRUNCATE TABLE npcs;
TRUNCATE TABLE explorers;
TRUNCATE TABLE connections;
TRUNCATE TABLE rooms;

INSERT INTO rooms (roomID, name, description) VALUES (1, 'foo', 'bar');
INSERT INTO rooms (roomID, name, description) VALUES (2, 'meep', 'merp');
INSERT INTO rooms (roomID, name, description) VALUES (3, 'ayasdhf', 'empr');
INSERT INTO rooms (roomID, name, description) VALUES (4, 'adjfl', 'aipojdfkl');
INSERT INTO rooms (roomID, name, description) VALUES (5, 'jasjdfoja', 'asdfjlk');
INSERT INTO rooms (roomID, name, description) VALUES (6, 'asldkfjl', 'aslkdjg');
--SIX SEVENN!!
INSERT INTO rooms (roomID, name, description) VALUES (7, 'jaksldjf', 'aldfjlkj');
INSERT INTO rooms (roomID, name, description) VALUES (8, 'adfkjalekfj', 'ioaejgklerj');

INSERT INTO explorers (expID, name, username, Room_ID) VALUES (1, 'Tired', 'tootired', 1);
INSERT INTO explorers (expID, name, username, Room_ID) VALUES (2, 'Help', 'Me', 2);

INSERT INTO npcs (npcID, type, roomID) VALUES (1, 'Typescript', 1);
INSERT INTO npcs (npcID, type, roomID) VALUES (2, 'Javascript', 2);

INSERT INTO connections (room1, room2) VALUES (1, 2);
INSERT INTO connections (room1, room2) VALUES (2, 3);
INSERT INTO connections (room1, room2) VALUES (3, 4);
INSERT INTO connections (room1, room2) VALUES (4, 5);
INSERT INTO connections (room1, room2) VALUES (5, 6);
INSERT INTO connections (room1, room2) VALUES (6, 7);
-- SIX SEVEN!!!
INSERT INTO connections (room1, room2) VALUES (7, 8);

INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (1,1,NULL,NULL,'yerp',1,1);
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (2,2,NULL,NULL,'mhm',2,2);
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (3,3,NULL,NULL,'asjldkf',3,3);
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (4,4,NULL,NULL,'ahga',4,4);
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (5,5,NULL,NULL,'help',5,5);
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (6,6,NULL,NULL,'hello',6,6);
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (7,7,NULL,NULL,'hi',7,7);
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (8,8,NULL,NULL,'yeppers',8,8);
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (9,9,NULL,NULL,'pbinq',9,9);
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (10,10,NULL,NULL,'pbj',10,10);
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (11,11,NULL,NULL,'hungry',11,11);
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (12,12,NULL,NULL,'zdxvbb',12,12);