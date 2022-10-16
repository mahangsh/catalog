create schema `sakila`;
create table `sakila`.`actor` (
  `actor_id` smallint unsigned not null auto_increment,
  `first_name` varchar(45) not null,
  `last_name` varchar(45) not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`actor_id`)
);
create table `sakila`.`actor_genre` (
  `actor_genre_id` smallint unsigned not null,
  `actor_id` smallint unsigned not null,
  `name` varchar(20) not null,
  constraint `PRIMARY`
    primary key (`actor_genre_id`)
);
create table `sakila`.`address` (
  `address_id` smallint unsigned not null auto_increment,
  `address` varchar(50) not null,
  `address2` varchar(50) null,
  `district` varchar(20) not null,
  `city_id` smallint unsigned not null,
  `postal_code` varchar(10) null,
  `phone` varchar(20) not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`address_id`)
);
create table `sakila`.`category` (
  `category_id` smallint unsigned not null auto_increment,
  `name` varchar(25) not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`category_id`)
);
create table `sakila`.`city` (
  `city_id` smallint unsigned not null auto_increment,
  `city` varchar(50) not null,
  `country_id` smallint unsigned not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`city_id`)
);
create table `sakila`.`country` (
  `country_id` smallint unsigned not null auto_increment,
  `country` varchar(50) not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`country_id`)
);
create table `sakila`.`customer` (
  `customer_id` smallint unsigned not null auto_increment,
  `store_id` smallint unsigned not null,
  `first_name` varchar(45) not null,
  `last_name` varchar(45) not null,
  `email` varchar(50) null,
  `address_id` smallint unsigned not null,
  `active` bit not null default true,
  `create_date` timestamp not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`customer_id`)
);
create table `sakila`.`datetime` (
  `id` smallint not null,
  `time` time null,
  `timestamp` timestamp null,
  `date` date null,
  `datetime` timestamp null
);
create table `sakila`.`film` (
  `film_id` smallint unsigned not null auto_increment,
  `title` varchar(255) not null,
  `description` text null,
  `release_year` date null,
  `language_id` smallint unsigned not null,
  `original_language_id` smallint unsigned null,
  `rental_duration` smallint unsigned not null default 3,
  `rental_rate` decimal(4, 2) not null default 4.99,
  `length` smallint unsigned null,
  `replacement_cost` decimal(5, 2) not null default 19.99,
  `rating` varchar(5) null default 'G',
  `special_features` varchar(54) null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`film_id`)
);
create table `sakila`.`film_actor` (
  `actor_id` smallint unsigned not null,
  `film_id` smallint unsigned not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (
      `actor_id`,
      `film_id`
    )
);
create table `sakila`.`film_category` (
  `film_id` smallint unsigned not null,
  `category_id` smallint unsigned not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (
      `film_id`,
      `category_id`
    )
);
create table `sakila`.`film_comment` (
  `film_id` smallint unsigned not null,
  `comment` varchar(128) null
);
create table `sakila`.`film_genre` (
  `film_id` smallint unsigned not null,
  `genre` varchar(128) null
);
create table `sakila`.`film_image` (
  `film_id` smallint unsigned not null,
  `image` blob null
);
create table `sakila`.`film_origin` (
  `film_id` smallint unsigned not null,
  `city` varchar(128) null,
  `country` varchar(128) null
);
create table `sakila`.`film_rating` (
  `film_rating_id` smallint unsigned not null,
  `film_id` smallint unsigned not null,
  `stars` smallint unsigned not null,
  constraint `PRIMARY`
    primary key (`film_rating_id`)
);
create table `sakila`.`film_text` (
  `film_id` smallint not null,
  `title` varchar(255) not null,
  `description` text null,
  constraint `PRIMARY`
    primary key (`film_id`)
);
create table `sakila`.`inventory` (
  `inventory_id` int unsigned not null auto_increment,
  `film_id` smallint unsigned not null,
  `store_id` smallint unsigned not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`inventory_id`)
);
create table `sakila`.`language` (
  `language_id` smallint unsigned not null auto_increment,
  `name` varchar(20) not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`language_id`)
);
create table `sakila`.`payment` (
  `payment_id` smallint unsigned not null auto_increment,
  `customer_id` smallint unsigned not null,
  `staff_id` smallint unsigned not null,
  `rental_id` int null,
  `amount` decimal(5, 2) not null,
  `payment_date` timestamp not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`payment_id`)
);
create table `sakila`.`rental` (
  `rental_id` int not null auto_increment,
  `rental_date` timestamp not null,
  `inventory_id` int unsigned not null,
  `customer_id` smallint unsigned not null,
  `return_date` timestamp null,
  `staff_id` smallint unsigned not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`rental_id`)
);
create table `sakila`.`staff` (
  `staff_id` smallint unsigned not null auto_increment,
  `first_name` varchar(45) not null,
  `last_name` varchar(45) not null,
  `address_id` smallint unsigned not null,
  `picture` blob null,
  `email` varchar(50) null,
  `store_id` smallint unsigned not null,
  `active` bit not null default true,
  `username` varchar(16) not null,
  `password` varchar(40) null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`staff_id`)
);
create table `sakila`.`store` (
  `store_id` smallint unsigned not null auto_increment,
  `manager_staff_id` smallint unsigned not null,
  `address_id` smallint unsigned not null,
  `last_update` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`store_id`)
);
alter table `sakila`.`actor_genre`
  add constraint `actor_genre_ibfk_1`
    foreign key (`actor_id`)
    references `sakila`.`actor` (`actor_id`);
alter table `sakila`.`address`
  add constraint `fk_address_city`
    foreign key (`city_id`)
    references `sakila`.`city` (`city_id`);
alter table `sakila`.`city`
  add constraint `fk_city_country`
    foreign key (`country_id`)
    references `sakila`.`country` (`country_id`);
alter table `sakila`.`customer`
  add constraint `fk_customer_address`
    foreign key (`address_id`)
    references `sakila`.`address` (`address_id`);
alter table `sakila`.`customer`
  add constraint `fk_customer_store`
    foreign key (`store_id`)
    references `sakila`.`store` (`store_id`);
alter table `sakila`.`film`
  add constraint `fk_film_language`
    foreign key (`language_id`)
    references `sakila`.`language` (`language_id`);
alter table `sakila`.`film`
  add constraint `fk_film_language_original`
    foreign key (`original_language_id`)
    references `sakila`.`language` (`language_id`);
alter table `sakila`.`film_actor`
  add constraint `fk_film_actor_actor`
    foreign key (`actor_id`)
    references `sakila`.`actor` (`actor_id`);
alter table `sakila`.`film_actor`
  add constraint `fk_film_actor_film`
    foreign key (`film_id`)
    references `sakila`.`film` (`film_id`);
alter table `sakila`.`film_category`
  add constraint `fk_film_category_category`
    foreign key (`category_id`)
    references `sakila`.`category` (`category_id`);
alter table `sakila`.`film_category`
  add constraint `fk_film_category_film`
    foreign key (`film_id`)
    references `sakila`.`film` (`film_id`);
alter table `sakila`.`film_comment`
  add constraint `film_comment_ibfk_1`
    foreign key (`film_id`)
    references `sakila`.`film` (`film_id`);
alter table `sakila`.`film_genre`
  add constraint `film_genre_ibfk_1`
    foreign key (`film_id`)
    references `sakila`.`film` (`film_id`);
alter table `sakila`.`film_image`
  add constraint `film_image_ibfk_1`
    foreign key (`film_id`)
    references `sakila`.`film` (`film_id`);
alter table `sakila`.`film_origin`
  add constraint `film_origin_ibfk_1`
    foreign key (`film_id`)
    references `sakila`.`film` (`film_id`);
alter table `sakila`.`film_rating`
  add constraint `film_rating_ibfk_1`
    foreign key (`film_id`)
    references `sakila`.`film` (`film_id`);
alter table `sakila`.`inventory`
  add constraint `fk_inventory_film`
    foreign key (`film_id`)
    references `sakila`.`film` (`film_id`);
alter table `sakila`.`inventory`
  add constraint `fk_inventory_store`
    foreign key (`store_id`)
    references `sakila`.`store` (`store_id`);
alter table `sakila`.`payment`
  add constraint `fk_payment_customer`
    foreign key (`customer_id`)
    references `sakila`.`customer` (`customer_id`);
alter table `sakila`.`payment`
  add constraint `fk_payment_rental`
    foreign key (`rental_id`)
    references `sakila`.`rental` (`rental_id`);
alter table `sakila`.`payment`
  add constraint `fk_payment_staff`
    foreign key (`staff_id`)
    references `sakila`.`staff` (`staff_id`);
alter table `sakila`.`rental`
  add constraint `fk_rental_customer`
    foreign key (`customer_id`)
    references `sakila`.`customer` (`customer_id`);
alter table `sakila`.`rental`
  add constraint `fk_rental_inventory`
    foreign key (`inventory_id`)
    references `sakila`.`inventory` (`inventory_id`);
alter table `sakila`.`rental`
  add constraint `fk_rental_staff`
    foreign key (`staff_id`)
    references `sakila`.`staff` (`staff_id`);
alter table `sakila`.`staff`
  add constraint `fk_staff_address`
    foreign key (`address_id`)
    references `sakila`.`address` (`address_id`);
alter table `sakila`.`staff`
  add constraint `fk_staff_store`
    foreign key (`store_id`)
    references `sakila`.`store` (`store_id`);
alter table `sakila`.`store`
  add constraint `fk_store_address`
    foreign key (`address_id`)
    references `sakila`.`address` (`address_id`);
alter table `sakila`.`store`
  add constraint `fk_store_staff`
    foreign key (`manager_staff_id`)
    references `sakila`.`staff` (`staff_id`);
create unique index `PRIMARY` on `sakila`.`actor`(`actor_id` asc);
create index `idx_actor_last_name` on `sakila`.`actor`(`last_name` asc);
create unique index `PRIMARY` on `sakila`.`actor_genre`(`actor_genre_id` asc);
create index `actor_id` on `sakila`.`actor_genre`(`actor_id` asc);
create unique index `PRIMARY` on `sakila`.`address`(`address_id` asc);
create index `idx_fk_city_id` on `sakila`.`address`(`city_id` asc);
create unique index `PRIMARY` on `sakila`.`category`(`category_id` asc);
create unique index `PRIMARY` on `sakila`.`city`(`city_id` asc);
create index `idx_fk_country_id` on `sakila`.`city`(`country_id` asc);
create unique index `PRIMARY` on `sakila`.`country`(`country_id` asc);
create unique index `PRIMARY` on `sakila`.`customer`(`customer_id` asc);
create index `idx_fk_address_id` on `sakila`.`customer`(`address_id` asc);
create index `idx_fk_store_id` on `sakila`.`customer`(`store_id` asc);
create index `idx_last_name` on `sakila`.`customer`(`last_name` asc);
create unique index `PRIMARY` on `sakila`.`film`(`film_id` asc);
create index `idx_fk_language_id` on `sakila`.`film`(`language_id` asc);
create index `idx_fk_original_language_id` on `sakila`.`film`(`original_language_id` asc);
create index `idx_title` on `sakila`.`film`(`title` asc);
create unique index `PRIMARY` on `sakila`.`film_actor`(
  `actor_id` asc,
  `film_id` asc
);
create index `idx_fk_film_id` on `sakila`.`film_actor`(`film_id` asc);
create unique index `PRIMARY` on `sakila`.`film_category`(
  `film_id` asc,
  `category_id` asc
);
create index `fk_film_category_category` on `sakila`.`film_category`(`category_id` asc);
create index `film_id` on `sakila`.`film_comment`(`film_id` asc);
create index `film_id` on `sakila`.`film_genre`(`film_id` asc);
create index `film_id` on `sakila`.`film_image`(`film_id` asc);
create index `film_id` on `sakila`.`film_origin`(`film_id` asc);
create unique index `PRIMARY` on `sakila`.`film_rating`(`film_rating_id` asc);
create index `film_id` on `sakila`.`film_rating`(`film_id` asc);
create unique index `PRIMARY` on `sakila`.`film_text`(`film_id` asc);
create index `idx_title_description` on `sakila`.`film_text`(
  `title` asc,
  `description` asc
);
create unique index `PRIMARY` on `sakila`.`inventory`(`inventory_id` asc);
create index `idx_fk_film_id` on `sakila`.`inventory`(`film_id` asc);
create index `idx_store_id_film_id` on `sakila`.`inventory`(
  `store_id` asc,
  `film_id` asc
);
create unique index `PRIMARY` on `sakila`.`language`(`language_id` asc);
create unique index `PRIMARY` on `sakila`.`payment`(`payment_id` asc);
create index `fk_payment_rental` on `sakila`.`payment`(`rental_id` asc);
create index `idx_fk_customer_id` on `sakila`.`payment`(`customer_id` asc);
create index `idx_fk_staff_id` on `sakila`.`payment`(`staff_id` asc);
create unique index `PRIMARY` on `sakila`.`rental`(`rental_id` asc);
create index `idx_fk_customer_id` on `sakila`.`rental`(`customer_id` asc);
create index `idx_fk_inventory_id` on `sakila`.`rental`(`inventory_id` asc);
create index `idx_fk_staff_id` on `sakila`.`rental`(`staff_id` asc);
create unique index `rental_date` on `sakila`.`rental`(
  `rental_date` asc,
  `inventory_id` asc,
  `customer_id` asc
);
create unique index `PRIMARY` on `sakila`.`staff`(`staff_id` asc);
create index `idx_fk_address_id` on `sakila`.`staff`(`address_id` asc);
create index `idx_fk_store_id` on `sakila`.`staff`(`store_id` asc);
create unique index `PRIMARY` on `sakila`.`store`(`store_id` asc);
create index `idx_fk_address_id` on `sakila`.`store`(`address_id` asc);
create unique index `idx_unique_manager` on `sakila`.`store`(`manager_staff_id` asc);