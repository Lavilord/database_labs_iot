insert into `sex`(`name`) values ('male'), ('female');


insert into `family_tree`(name, lastname, middle_name, birth_date, death_date, place_of_death, sex, place_of_birth ) values 
	('Sasha','ND','Ivanovich','2000-08-07','2010-05-07','Львів','male','Ужгород'),
	('Галя','ЛЯЛЯ','Лялялівна','2000-10-07','2000-12-07','Ужгород','female','Ужгород');

insert into `family_tree`(name, lastname, middle_name, birth_date, death_date, place_of_death, family_tree_id, sex, place_of_birth ) values 
	('Данило','Геній','Андрійович','2000-06-07','2000-09-07','Чернівці',3,'male','Ужгород'),
	('Мирослав','Eagle','Eye','2005-05-07','2008-05-07','Київ',4,'male','Львів'),
	('Марія','Геній','Абрикосівна','2001-05-07','2003-05-07','Жмеринка',5,'female','Львів'),
	('Ірина ','Кооператив','КУКУ','2000-05-100','2000-05-08','Львів',6,'female','Київ');

insert into `family_companion`(name, lastname, middle_name, birth_date, death_date, place_of_death, marriage_date, family_tree_id, sex, place_of_birth, credit_card_number ) values 
	('Ірина ','Кооператив','КУКУ','2000-05-100','2000-05-08','Ужгород','2005-05-07',1,'male','Львів','735895389'),
	('Марія','Геній','Абрикосівна','2001-05-07','2003-05-07','Ужгород','2005-09-07',2,'male','Львів','245353'),
	('Мирослав','Eagle','Eye','2005-05-07','2008-05-07','Ужгород','2005-05-09',3,'male','Львів','64758688'),
	('Данило','Геній','Андрійович','2000-06-07','2000-09-07','Ужгород','2005-05-08',4,'female','Львів','3675866755'),
	('Галя','ЛЯЛЯ','Лялялівна','2000-10-07','2000-12-07','Ужгород','2005-05-06',5,'female','Львів','4635786'),
	('Sasha','ND','Ivanovich','2000-08-07','2010-05-07','Львів','2005-05-07',6,'female','Львів','46376976');

insert into `family_jewelry`(name, expected_value, max_value, min_value, code ) values
('Coin',12,23,1,''),
('',,,,),
('',,,,),
('',,,,),
('',,,,);

insert into `family_has_jewelry`(family_tree_id, jewelry_id) values
(,),
(,),
(,),
(,),
(,);