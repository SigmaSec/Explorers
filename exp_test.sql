--ALL OF THESE SHOULD FAIL
--IF THEY DO NOT FAIL, WE HAVE A PROBLEM.
INSERT INTO rooms (roomID, name, description) VALUES (1,'Kitchen','hungry');
INSERT INTO rooms (roomID, name, description) VALUES (1,'Hallway','hi');
INSERT INTO rooms (roomID, name, description) VALUES (2, 'Kitchen');

INSERT INTO explorers (expID, name, username, Room_ID) VALUES (1,'Gary','Lobster8841', 1);
INSERT INTO explorers (expID, name, username, Room_ID) VALUES (1, 'Hi','NoxNostra', 2)
INSERT INTO explorers (expID, name, username, Room_ID) VALUES (2, 'Bebop','TheLash', 1);
INSERT INTO explorers (expID, name, username, Room_ID) VALUES (3, 'Bebop','Dynamo', 3);
INSERT INTO explorers (expID, name, username, Room_ID) VALUES (4, 'Admiral','Dynamo',4);

INSERT INTO npcs (npcID, type, roomID) VALUES (1, 'java',1);
INSERT INTO npcs (npcID, type, roomID) VALUES (1, 'take', 2);
INSERT INTO npcs (npcID, type, roomID) VALUES (2, 'take', 3);
INSERT INTO npcs (npcID, type, roomID) VALUES (3, 'almost', 3);

INSERT INTO connections (room1, room2) VALUES (1, 2);
INSERT INTO connections (room1, room2) VALUES (1, 3);
INSERT INTO connections (room1, room2) VALUES (2, 3);

INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (1,1,NULL,NULL,'yerp',1,1);
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (1,1,1,NULL,'piza',1,1);
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (1,1,1,1,'hut',1,1);
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (2,NULL,2,2,'dominos',1,1);
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (1,1,NULL,NULL,'lobster',1,1);
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (1,2,NULL,NULL,'yerp',1,1);
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (1,2,NULL,NULL,'yerp',3,4);
INSERT INTO treasures (tresID, expID, npcID, roomID, description, value, weight) VALUES (1,1,NULL,NULL,'asdf',4,4);