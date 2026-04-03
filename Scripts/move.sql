CREATE OR REPLACE TRIGGER valid_trig
BEFORE UPDATE OF Room_ID ON explorers
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN 
        SELECT COUNT(*)
        INTO v_count
        FROM connections
        WHERE room1 = :OLD.Room_ID
        AND room2 = :NEW.Room_ID;

        IF v_count = 0 THEN 
            RAISE_APPLICATION_ERROR(-20001,
                'Invalid move: Room ' || :NEW.Room_ID ||
                ' is not connected to Room ' || :OLD.Room_ID);
        END IF;
    END;
/

CREATE OR REPLACE PROCEDURE move (
    p_expID IN explorers.expID%TYPE,
    p_roomID IN explorers.Room_ID%TYPE
) AS
BEGIN
    UPDATE explorers
    SET Room_ID = p_roomID
    WHERE expID = p_expID;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/

CREATE OR REPLACE PROCEDURE show_conns (
    p_expID IN explorers.expID%TYPE
) AS
    v_current_room explorers.Room_ID%TYPE;
BEGIN
    -- Get the explorer's current room
    SELECT Room_ID
    INTO v_current_room
    FROM explorers
    WHERE expID = p_expID;
 
    -- Print each connected room
    DBMS_OUTPUT.PUT_LINE('Connected rooms from Room ' || v_current_room || ':');
 
    FOR rec IN (
        SELECT room2
        FROM connections
        WHERE room1 = v_current_room
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('  Room ID: ' || rec.room2);
    END LOOP;
END;
/

DECLARE
    v_expID       explorers.expID%TYPE := 1;
    v_curr_room   explorers.Room_ID%TYPE;
    v_new_room    explorers.Room_ID%TYPE;
BEGIN
    DBMS_OUTPUT.ENABLE;
 
    -- --------------------------------------------------------
    -- POSITIVE TEST CASE: Valid move (room 1 -> room 2)
    -- connections has (1,2) so this should succeed
    -- --------------------------------------------------------
    SELECT Room_ID INTO v_curr_room
    FROM explorers WHERE expID = v_expID;
 
    v_new_room := 2;
 
    BEGIN
        move(v_expID, v_new_room);
        DBMS_OUTPUT.PUT_LINE('PASS – Exp ID: ' || v_expID || 
                             ', Curr Room: ' || v_curr_room || 
                             ', New Room: ' || v_new_room);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('FAIL – Exp ID: ' || v_expID || 
                                 ', Curr Room: ' || v_curr_room || 
                                 ', New Room: ' || v_new_room);
    END;

    SELECT Room_ID INTO v_curr_room
    FROM explorers WHERE expID = v_expID;
 
    v_new_room := 8;
 
    BEGIN
        move(v_expID, v_new_room);
        DBMS_OUTPUT.PUT_LINE('FAIL – Exp ID: ' || v_expID || 
                             ', Curr Room: ' || v_curr_room || 
                             ', New Room: ' || v_new_room);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('PASS – Exp ID: ' || v_expID || 
                                 ', Curr Room: ' || v_curr_room || 
                                 ', New Room: ' || v_new_room);
    END;
 
END;