Use db_lab_7;

DELIMITER //
CREATE TRIGGER BeforeDeleteCompanionMin3Row
BEFORE DELETE
ON family_companion FOR EACH ROW
BEGIN
IF(SELECT COUNT(*) FROM family_companion)<3
	THEN SIGNAL SQLSTATE'45000'
	SET MESSAGE_TEXT = 'Delete error Min cardinality';
END IF;
END//
DELIMITER ;