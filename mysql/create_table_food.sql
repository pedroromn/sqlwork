drop table if exists favorite_food; 

CREATE TABLE favorite_food
(person_id smallint unsigned,
food varchar(20)	
);

alter table favorite_food add constraint pk_favorite_food primary key (person_id, food);
alter table favorite_food add constraint fk_fav_food_person_id foreign key (person_id) 
references person(person_id);