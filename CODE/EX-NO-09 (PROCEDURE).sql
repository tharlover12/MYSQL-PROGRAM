DELIMITER //

DROP PROCEDURE IF EXISTS GetEmployeeDetails;

CREATE PROCEDURE GetEmployeeDetails(IN emp_input INT)
BEGIN
    SELECT * 
    FROM Employeedetails
    WHERE `Employee I'd` = emp_input;
END //

DELIMITER ;
