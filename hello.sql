-- Author: Joshua Early
-- 2017
SET SERVEROUTPUT ON; 

CREATE OR REPLACE PROCEDURE HelloWorld AS

BEGIN
  DBMS_OUTPUT.put_line('Hello World');
  DBMS_OUTPUT.new_line; 
END HelloWorld;
/

CREATE OR REPLACE PROCEDURE Hello (name VARCHAR2) AS

BEGIN
  DBMS_OUTPUT.put_line('Hello '||name);
END Hello;
/

--CREATE OR REPLACE PROCEDURE Hi (aName VARCHAR2) AS
CREATE OR REPLACE PROCEDURE Hi AS

BEGIN
  DBMS_OUTPUT.put_line('Hi +');
  Hello('World');
  DBMS_OUTPUT.put_line('Hi -');
END Hi;
/


