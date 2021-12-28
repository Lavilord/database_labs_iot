USE db_lab_7;

DELIMITER //
DROP TRIGGER IF EXISTS before_family_tree_delete //
CREATE TRIGGER before_family_tree_delete
BEFORE DELETE
ON family_tree FOR EACH ROW
BEGIN 
	IF  old.id IN (SELECT family_tree_id FROM family_has_jewelry) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "You cant delete it";
	END IF;

    IF  old.id IN (SELECT family_tree_id FROM family_tree) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "You cant delete it";
	END IF;
    
    if old.id in (select family_tree_id from family_companion ) then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "You cant delete it";
	END IF;
    
END //

DELIMITER //
DROP TRIGGER IF EXISTS before_family_jewelry_delete //
CREATE TRIGGER before_family_jewelry_delete
BEFORE DELETE
ON family_jewelry FOR EACH ROW
BEGIN 
	IF  old.id IN (SELECT family_jewelry_id FROM family_has_jewelry) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "You can't delete it";
	END IF;
END //