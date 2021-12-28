USE db_lab_7;

DELIMITER //
DROP TRIGGER IF EXISTS before_family_companion_input //
CREATE TRIGGER before_family_companion_input
BEFORE INSERT 
ON family_companion FOR EACH ROW
BEGIN 
	IF new.sex NOT IN (SELECT name FROM sex) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "No such sex found for family_companion.sex";
	END IF;
    IF new.family_tree_id NOT IN (SELECT id FROM family_tree) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "Cant found id in family_tree.id";
	END IF;
END //

DELIMITER //
DROP TRIGGER IF EXISTS before_family_has_jewelry_input //
CREATE TRIGGER before_family_has_jewelry_input
BEFORE INSERT 
ON family_has_jewelry FOR EACH ROW
BEGIN 
	IF new.jewelry_id NOT IN (SELECT id FROM family_jewelry) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "Cant found id in family_jewelry.id
        for family_has_jewelry.jewelry_id";
	END IF;

    IF new.family_tree_id NOT IN (SELECT id FROM family_tree) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "Cant found id in family_tree.id
        for family_has_jewelry.family_tree_id";
	END IF;
END //

DELIMITER //
DROP TRIGGER IF EXISTS before_family_tree_input //
CREATE TRIGGER before_family_tree_input
BEFORE INSERT 
ON family_tree FOR EACH ROW
BEGIN 
	IF new.sex NOT IN (SELECT name FROM sex) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "Cant found in sex.name for family_tree.sex";
	END IF;


    IF (new.family_tree_id IS NOT NULL) AND (new.family_tree_id NOT IN (SELECT id FROM family_tree)) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "Cant found id in family_tree.id
        for family_tree.family_tree_id";
	END IF;
END //

DROP TRIGGER IF EXISTS before_family_jewelry_input //
CREATE TRIGGER before_family_jewelry_input
BEFORE INSERT 
ON family_jewelry FOR EACH ROW
BEGIN 
	if (new.code not rlike "[A,M,Z][0-9]{6}[A-Z]{2}")
        then signal sqlstate '45000' set message_text = 'Cannot insert new value: wrong "code" parameter provided';
    end if;
END //
