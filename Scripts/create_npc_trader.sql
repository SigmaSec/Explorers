CREATE PROCEDURE npc_trader(
    roomID VARCHAR2(255), rooms_name_ck VARCHAR2(255), room_description VARCHAR2(255)) AS npc_procedure
BEGIN
SELECT room.roomID, room.name, room.description
FROM room