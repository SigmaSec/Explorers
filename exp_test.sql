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