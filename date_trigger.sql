USE db_lab_7;

DELIMITER //
DROP TRIGGER IF EXISTS before_family_companion_input_check_birth_and_death_date //
CREATE TRIGGER before_family_companion_input_check_birth_and_death_date
BEFORE INSERT
ON family_companion FOR EACH ROW
BEGIN 
	IF (new.birth_date IS NOT NULL) AND (new.birth_date > CURDATE()) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "error";
	END IF;
    IF (new.death_date IS NOT NULL) AND (new.death_date > CURDATE()) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "error";
	END IF;
END //

DROP TRIGGER IF EXISTS before_family_companion_update_check_birth_and_death_date //
CREATE TRIGGER before_family_companion_update_check_birth_and_death_date
BEFORE UPDATE
ON family_companion FOR EACH ROW
BEGIN 
	IF (new.birth_date IS NOT NULL) AND (new.birth_date > CURDATE()) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "error";
	END IF;
    IF (new.death_date IS NOT NULL) AND (new.death_date > CURDATE()) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "error";
	END IF;
END // 