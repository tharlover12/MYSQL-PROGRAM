DELIMITER $$

CREATE PROCEDURE cursorhandling (IN emp_id INT(4))
BEGIN
    DECLARE finished INT DEFAULT 0;
    DECLARE e_no INT(6);
    DECLARE e_name VARCHAR(25);
    DECLARE net_salary DECIMAL(8,2);
    DECLARE salarycursor CURSOR FOR 
        SELECT emp_no, emp_name, 
               basic + (da_percent * basic / 100) + ma + other_allowance - deduction
        FROM salary;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

    OPEN salarycursor;

    g1: LOOP
        FETCH salarycursor INTO e_no, e_name, net_salary;
        IF finished = 1 THEN
            LEAVE g1;
        END IF;

        -- Update salary values for the given employee
        IF e_no = emp_id THEN
            UPDATE salary 
            SET basic = 3000, da_percent = 50, ma = 500, 
                other_allowance = 1250, deduction = 2777 
            WHERE emp_no = emp_id;
        END IF;
    END LOOP g1;

    CLOSE salarycursor;

END $$

DELIMITER ;
