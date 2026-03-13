--ALL OF THESE SHOULD FAIL
--IF THEY DO NOT FAIL, WE HAVE A PROBLEM.
INSERT INTO rooms (roomID, name, description) VALUES (1,'Kitchen','hungry');
INSERT INTO rooms (roomID, name, description) VALUES (1,'Hallway','hi');
INSERT INTO rooms (roomID, name, description) VALUES (2, 'Kitchen');

INSERT INTO 