-- Joshua Early
-- Database 1 - 2017

SET SERVEROUTPUT ON 

CREATE OR REPLACE PROCEDURE avg_proc (number_one IN number, number_two IN number, 
               number_three IN number, number_four IN number, num_avg OUT number) IS

BEGIN
  num_avg := (number_one + number_two + number_three + number_four) / 4;
END;
/

CREATE OR REPLACE FUNCTION avg_function (number_one IN number, number_two IN number, 
	               number_three IN number, number_four IN number) RETURN number IS
 
  num_avg number(10, 1);  -- allowing for one decimal point for more accurate results

BEGIN
  num_avg := (number_one + number_two + number_three + number_four) / 4;
  RETURN(num_avg);
END;
/

-- driver procedure to test calls to procedure and function 
CREATE OR REPLACE PROCEDURE avg_test IS

  -- numbers 1-4, declared with one decimal point precision
  num1  number(10, 1);
  num2  number(10, 1);
  num3  number(10, 1);
  num4  number(10, 1);
  p_avg number(10, 1);
  num_sum number(10, 1);


BEGIN
  -- inializing numbers 1-4 that are to passed to the procedure/function to compute average	
  num1 := 20;
  num2 := 12;
  num3 := 37;
  num4 := 49;
  p_avg := 0;

DBMS_OUTPUT.PUT_LINE('Calling Average Procedure');
  avg_proc(num1, num2, num3, num4, p_avg); -- procedure call 
  DBMS_OUTPUT.PUT_LINE('Average: ' || p_avg);

DBMS_OUTPUT.PUT_LINE('Calling Average Function');
  DBMS_OUTPUT.PUT_LINE('Average: ' || avg_function(num1, num2, num3, num4)); -- function call

END;
/

SHOW ERRORS;
