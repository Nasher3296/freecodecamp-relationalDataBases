CREATE DATABASE universe;
\c universe;

CREATE TABLE galaxy(
    galaxy_id SERIAL,
    name VARCHAR(30) NOT NULL UNIQUE,
    description TEXT,
    age_in_millions_of_years INT NOT NULL,
    distance_from_earth NUMERIC(8,2) NOT NULL,
    PRIMARY KEY(galaxy_id)
);

CREATE TABLE star(
    star_id SERIAL,
    name VARCHAR(30) NOT NULL UNIQUE,
    has_life BOOLEAN NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    age_in_millions_of_years INT NOT NULL,
    distance_from_earth NUMERIC(8,2) NOT NULL,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    PRIMARY KEY(star_id)
);

CREATE TABLE planet(
    planet_id SERIAL,
    name VARCHAR(30) NOT NULL UNIQUE,
    is_spherical BOOLEAN NOT NULL,
    age_in_millions_of_years INT NOT NULL,
    distance_from_earth NUMERIC(8,2) NOT NULL,
    star_id INT REFERENCES star(star_id),
    PRIMARY KEY(planet_id)
);

CREATE TABLE moon(
    moon_id SERIAL,
    name VARCHAR(30) NOT NULL UNIQUE,
    is_spherical BOOLEAN NOT NULL,
    age_in_millions_of_years INT NOT NULL,
    distance_from_earth NUMERIC(8,2) NOT NULL,
    planet_id INT REFERENCES planet(planet_id),
    PRIMARY KEY(moon_id)
);

CREATE TABLE extra(
    extra_id SERIAL,
    name VARCHAR(10),
    extra1 NUMERIC(2,1) NOT NULL,
    extra2 VARCHAR(10) UNIQUE NOT NULL,
    extra3 VARCHAR(10) UNIQUE NOT NULL,
    PRIMARY KEY(extra_id)
);

INSERT INTO extra   (name, extra1, extra2, extra3)
            VALUES  ('Extra1', 1, '1', '1'),
                    ('Extra2', 2, '2', '2'),
                    ('Extra3', 3, '3', '3');

INSERT INTO galaxy  (name, description, age_in_millions_of_years, distance_from_earth) 
            VALUES  ('Galaxy1','Big galaxy', 10, 10), 
                    ('Galaxy2','Not that big galaxy',9,9),
                    ('Galaxy3','Description xd',8,8),
                    ('Galaxy4','Description xd',7,7),
                    ('Galaxy5','Description xd',6,6),
                    ('Galaxy6','Description xd',5,5);

INSERT INTO star    (name, has_life, is_spherical, age_in_millions_of_years, distance_from_earth, galaxy_id)
            VALUES  ('Star1',true,true,1, 1, 1),
                    ('Star2',true,true,2, 2, 2),
                    ('Star3',false,false,3, 3, 3),
                    ('Star4',true,true,4, 4, 4),
                    ('Star5',true,false,5, 5, 4),
                    ('Star6',false,true,6, 7, 1);

INSERT INTO planet  (name, is_spherical, age_in_millions_of_years, distance_from_earth, star_id)
            VALUES  ('Planet1',true,1,1, 1),
                    ('Planet2',true,2,2, 2),
                    ('Planet3',false,3,3, 3),
                    ('Planet4',true,4,4, 4),
                    ('Planet5',true,5,5, 5),
                    ('Planet6',true,6,6, 6),
                    ('Planet7',false,7,7, 1),
                    ('Planet8',true,8,8, 1),
                    ('Planet9',true,9,9, 3),
                    ('Planet10',false,10,10, 5),
                    ('Planet11',true,11,11, 6),
                    ('Planet12',false,12,12, 6);

INSERT INTO moon  (name, is_spherical, age_in_millions_of_years, distance_from_earth, planet_id)
            VALUES  ('Moon1',true,1,1, 1),
                    ('Moon2',true,2,2, 2),
                    ('Moon3',false,3,3, 3),
                    ('Moon4',true,4,4, 4),
                    ('Moon5',true,5,5, 5),
                    ('Moon6',true,6,6, 6),
                    ('Moon7',false,7,7, 1),
                    ('Moon8',true,8,8, 1),
                    ('Moon9',true,9,9, 3),
                    ('Moon10',false,10,10, 5),
                    ('Moon11',true,11,11, 6),
                    ('Moon12',false,12,12, 6),
                    ('Moon13',false,1,2, 1),
                    ('Moon14',false,4,3, 2),
                    ('Moon15',true,5,6, 3),
                    ('Moon16',false,8,7, 4),
                    ('Moon17',false,9,5, 5),
                    ('Moon18',false,16,6, 3),
                    ('Moon19',true,7,17, 2),
                    ('Moon20',false,18,8, 1);
