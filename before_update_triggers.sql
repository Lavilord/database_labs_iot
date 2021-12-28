USE db_lab_7;

DELIMITER //
DROP TRIGGER IF EXISTS before_family_companion_update //
CREATE TRIGGER before_family_companion_update
BEFORE UPDATE
ON family_companion FOR EACH ROW
BEGIN 
	IF new.sex != old.sex THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "error";
	END IF;
    IF new.family_tree_id NOT IN (SELECT id FROM family_tree) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "Cant found id in family_tree.id";
	END IF;
END //

DELIMITER //
DROP TRIGGER IF EXISTS before_family_has_jewelry_update //
CREATE TRIGGER before_family_has_jewelry_update
BEFORE UPDATE
ON family_has_jewelry FOR EACH ROW
BEGIN 
	IF new.jewelry_id NOT IN (SELECT id FROM family_jewelry) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "Cant found id in family_jewelry.id
        for family_has_jewelry.family_jewelry_id";
	END IF;

    IF new.family_tree_id NOT IN (SELECT id FROM family_tree) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "Cant found id in family_tree.id
        for family_has_jewelry.family_tree_id";
	END IF;
END //

DELIMITER //
DROP TRIGGER IF EXISTS before_family_tree_update //
CREATE TRIGGER before_family_tree_update
BEFORE UPDATE
ON family_tree FOR EACH ROW
BEGIN 
	IF new.sex != old.sex THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "error";
	END IF;

    IF (old.family_tree_id IS NULL) AND (new.family_tree_id NOT IN (SELECT id FROM family_tree)) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "Cant found id in family_tree.id
        for family_tree.family_tree_id";
	END IF;

    IF (old.family_tree_id IS NOT NULL) AND (new.family_tree_id != old.family_tree_id) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "error";
	END IF;
END //

DROP TRIGGER IF EXISTS before_sex_update //
CREATE TRIGGER before_sex_update
BEFORE UPDATE
ON sex FOR EACH ROW
BEGIN 
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = "error";
END // 

DROP TRIGGER IF EXISTS before_family_jewelry_update //
CREATE TRIGGER before_family_jewelry_update
BEFORE UPDATE 
ON family_jewelry FOR EACH ROW
BEGIN 
	if (new.code not rlike "[A,M,Z][0-9]{6}[A-Z]{2}")
        then signal sqlstate '45000' set message_text = 'Cannot insert new value: wrong "code" parameter provided';
    end if;
END //