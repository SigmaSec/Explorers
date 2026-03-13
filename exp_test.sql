--ALL OF THESE SHOULD FAIL
--IF THEY DO NOT FAIL, WE HAVE A PROBLEM.
--Duplicate room primary key
INSERT INTO rooms (roomID, name, description) VALUES (1, 'foo', 'bar');
--Duplicate room name
INSERT INTO rooms (roomID, name, description) VALUES (9, 'foo','bar');
--Explorer primary key duplicate
INSERT INTO explorers (expID, name, username, Room_ID) VALUES (1,'Gary','Lobster8841', 1);
--Explorer name duplicate
INSERT INTO explorers (expID, name, username, Room_ID) VALUES (3, 'Tired','AnotherUser',2);
--room does not exist
INSERT INTO explorers (expID, name, username, Room_ID) VALUES (10, 'Ghost','user',999);

--NPC primary key duplicate
INSERT INTO npcs (npcID, type, roomID) VALUES (1, 'Javascript', 2);
--mabye not needed?
INSERT INTO npcs (npcID, type, roomID) VALUES (3,3);

--Duplicate room connection
INSERT INTO connections (room1, room2) VALUES (1,2);
--room connecting to itself
INSERT INTO connections (room1, room2) VALUES (3,3);

--Tresure primary key duplicate
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (1,1,NULL,NULL,'yerp',1,1);
--Treasure value invalid
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (20,1,NULL,NULL,'badvalue',0,1);
--Treasure weight invalid
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (21,1,NULL,NULL,'badweight',10,-1);
--Treasure in two locations
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (22,1,1,NULL,'twoOwners',10,1);
--Treasure with no location
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (23,NULL,NULL,NULL,'nowhere',10,1);