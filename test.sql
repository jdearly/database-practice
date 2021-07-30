-- Test Explorers Exercise
-- 2017

SET ECHO ON;
SET SERVEROUTPUT ON;

TRUNCATE TABLE Move_Log;

UPDATE Explorer SET Room_ID = 1 WHERE Name = 'Dora';
EXEC move('Dora');
EXEC move('Dora');
EXEC move('Dora');
EXEC move('Dora');

SELECT	Name, Move_Num, From_Room, To_Room, 
		TO_CHAR(Move_Date, 'DD-MON-YYYY HH24:MI:SSxFF') AS MOVE_TIME
FROM	Move_log;


