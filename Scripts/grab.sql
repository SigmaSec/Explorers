CREATE or REPLACE PROCEDURE grab (
p_expID NUMBER,
p_tresID NUMBER

) AS
v_tres_weight NUMBER;
v_tres_roomID NUMBER;
v_exp_roomID NUMBER;
v_bag_wt NUMBER;
v_bag_cnt NUMBER;
v_max_weight NUMBER;
v_max_cnt NUMBER;
BEGIN
SELECT Room_ID, bag_wt, bag_cnt, max_weight, max_count
INTO v_exp_roomID, v_bag_wt, v_bag_cnt, v_max_weight, v_max_cnt
FROM explorers
WHERE expID = p_expID;


SELECT weight, roomID
INTO v_tres_weight, v_tres_roomID
FROM treasures
WHERE tresID = p_tresID;
IF v_tres_roomID != v_exp_roomID THEN
    RAISE_APPLICATION_ERROR(-20001, 'Not in Current room');
END IF;
IF v_bag_wt + v_tres_weight > v_max_weight THEN
    RAISE_APPLICATION_ERROR(-20002, 'Exceeds max weight');
END IF;
IF v_bag_cnt + 1 > v_max_cnt THEN
    RAISE_APPLICATION_ERROR(-20003, 'Too many items');
END IF;

UPDATE TREASURES
SET roomID = NULL, expID = p_expID
WHERE tresID = p_tresID;

UPDATE EXPLORERS
SET bag_wt = bag_wt + v_tres_weight, bag_cnt = bag_cnt + 1
WHERE expID = p_expID;
COMMIT;
EXCEPTION  
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/
BEGIN 
    DELETE FROM treasures;
    DELETE FROM explorers;
    DELETE FROM rooms;
    COMMIT;

    INSERT INTO rooms (roomID, name, description) VALUES (1, 'Start Room', 'A Simple Room');
    INSERT INTO explorers (expID, name, username, room_ID) VALUES (1, 'Test Explorer', 'tester', 1);
    INSERT INTO treasures (tresID, roomID, name, description, value, weight) VALUES(1, 1, 'test', 'This is a test', 10, 100);
    COMMIT;

    grab(1, 1);
    DBMS_OUTPUT.PUT_LINE('Test 1 passed: Explorer grabbed the treasure');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Test 1 Failed ' || SQLERRM);
END;
/
BEGIN
    DELETE FROM treasures;
    DELETE FROM explorers;
    DELETE FROM rooms;
    COMMIT;

    INSERT INTO rooms (roomID, name, description) VALUES (1, 'Second Room', 'A complex room');
    INSERT INTO rooms (roomID, name, description) VALUES (2, 'Golden Idol room', 'From Indiana Jones'); 
    INSERT INTO explorers (expID, name, username, room_ID) VALUES (1, 'Me', 'It me', 2);
    INSERT INTO treasures (tresID, roomID, name, description, value, weight) VALUES (2, 1, 'Golden Idol', 'Yeah THE idol from Indiana Jones', 100000, 150);
    COMMIT;
    
    grab(2, 2);
    DBMS_OUTPUT.PUT_LINE('Test 2:failed, perfect!');
        EXCEPTION
            WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Test 2 passed: My code works!' || SQLERRM);
END;
/