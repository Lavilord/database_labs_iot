CREATE PROCEDURE `insert_family_ companion` (
in id int,
in name varchar(45),
in lastname varchar(45),
in middle_name varchar(45),
in birth_date date,
in death_date date,
in place_of_death varchar(45),
in marriage_date date,
in family_tree_id int,
in sex varchar(45),
in place_of_birth varchar(45),
in credit_card_number varchar(45)
)
BEGIN
	insert into `db_lab_7`.`family_companion`
		(`id`,`name`,`lastname`,`middle_name`,`birth_date`,`death_date`,`place_of_death`,`marriage_date`,`family_tree_id`,`sex`,`place_of_birth`,`credit_card_number`)
	values
		(`id`,`name`,`lastname`,`middle_name`,`birth_date`,`death_date`,`place_of_death`,`marriage_date`,`family_tree_id`,`sex`,`place_of_birth`,`credit_card_number`);
END