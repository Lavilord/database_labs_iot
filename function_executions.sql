select * from family_jewelry where family_jewelry.max_value < avg_max_value();

select id, name, lastname, middle_name, birth_date, death_date, place_of_death, marriage_date, select_family_tree(family_tree_id) as family_full_name, sex, place_of_birth, credit_card_number from family_companion;