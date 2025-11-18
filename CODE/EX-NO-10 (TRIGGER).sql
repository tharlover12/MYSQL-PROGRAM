DELIMITER $$

CREATE TRIGGER ins_count AFTER INSERT ON Titles
FOR EACH ROW
BEGIN
    UPDATE Authors 
    SET Title_Count = Title_Count + 1
    WHERE Author_Id = NEW.author_id;
END $$

DELIMITER ;
