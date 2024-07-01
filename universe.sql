CREATE DATABASE universe;
\c universe
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    distance_from_earth INT NOT NULL,
    number_of_stars INT NOT NULL,
    is_spiral BOOLEAN NOT NULL
);
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    galaxy_id INT NOT NULL,
    luminosity NUMERIC NOT NULL,
    age_in_million_years INT NOT NULL,
    has_planets BOOLEAN NOT NULL,
    FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
);
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    star_id INT NOT NULL,
    distance_from_star NUMERIC NOT NULL,
    has_life BOOLEAN NOT NULL,
    diameter INT NOT NULL,
    FOREIGN KEY (star_id) REFERENCES star(star_id)
);
universe=> CREATE TABLE moon (
universe(>     moon_id SERIAL PRIMARY KEY,
universe(>     name VARCHAR(100) NOT NULL UNIQUE,
universe(>     planet_id INT NOT NULL,
universe(>     orbital_period INT NOT NULL,
universe(>     surface_composition TEXT NOT NULL,
universe(>     FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
universe(> );
CREATE TABLE
universe=> CREATE TABLE asteroid_belt (
universe(>     asteroid_belt_id SERIAL PRIMARY KEY,
universe(>     name VARCHAR(100) NOT NULL UNIQUE,
universe(>     location TEXT NOT NULL,
universe(>     number_of_asteroids INT NOT NULL,
universe(>     is_circular BOOLEAN NOT NULL
universe(> );
CREATE TABLE
universe=> INSERT INTO galaxy (name, distance_from_earth, number_of_stars, is_spiral) VALUES
universe-> ('Milky Way', 0, 250000000000, TRUE),
universe-> ('Andromeda', 2537000, 1000000000000, TRUE),
universe-> ('Triangulum', 3000000, 40000000, TRUE),
universe-> ('Large Magellanic Cloud', 163000, 30000000, FALSE),
universe-> ('Small Magellanic Cloud', 200000, 15000000, FALSE),
universe-> ('Whirlpool', 23000000, 100000000000, TRUE);
ERROR:  integer out of range
universe=> INSERT INTO galaxy (name, distance_from_earth, number_of_stars, is_spiral) VALUES
universe-> ('Milky Way', 0, 250000000000, TRUE),
universe-> ('Andromeda', 2537000, 1000000000000, TRUE),
universe-> ('Triangulum', 3000000, 40000000, TRUE),
universe-> ('Large Magellanic Cloud', 163000, 30000000, FALSE),
universe-> ('Small Magellanic Cloud', 200000, 15000000, FALSE),
universe-> ('Whirlpool', 2300, 100, TRUE);
ERROR:  integer out of range
universe=> INSERT INTO galaxy (name, distance_from_earth, number_of_stars, is_spiral) VALUES
universe-> ('Milky Way', 0, 25000, TRUE),
universe-> ('Andromeda', 253700, 1000, TRUE),
universe-> ('Triangulum', 300, 400, TRUE),
universe-> ('Large Magellanic Cloud', 1630, 300, FALSE),
universe-> ('Small Magellanic Cloud', 200, 15000, FALSE),
universe-> ('Whirlpool', 2300, 1000, TRUE);
INSERT 0 6
universe=> INSERT INTO star (name, galaxy_id, luminosity, age_in_million_years, has_planets) VALUES
universe-> ('Sun', 1, 1.0, 4600, TRUE),
universe-> ('Proxima Centauri', 2, 0.0017, 4500, TRUE),
universe-> ('Alpha Centauri A', 2, 1.519, 4500, TRUE),
universe-> ('Alpha Centauri B', 2, 0.445, 4500, TRUE),
universe-> ('Betelgeuse', 1, 126000, 10000, FALSE),
universe-> ('Rigel', 1, 120000, 8000, FALSE);
INSERT 0 6
universe=> INSERT INTO planet (name, star_id, distance_from_star, has_life, diameter) VALUES
universe-> ('Earth', 1, 1.0, TRUE, 12742),
universe-> ('Mars', 1, 1.5, FALSE, 6779),
universe-> ('Jupiter', 1, 5.2, FALSE, 139820),
universe-> ('Proxima b', 2, 0.05, UNKNOWN, 11300),
universe-> ('Alpha Centauri Bb', 3, 0.04, UNKNOWN, 12400),
universe-> ('Alpha Centauri Bc', 3, 0.22, UNKNOWN, 13000),
universe-> ('Beta Pictoris b', 5, 9.1, UNKNOWN, 16000),
universe-> ('Betelgeuse I', 5, 10.0, UNKNOWN, 15000),
universe-> ('Rigel I', 6, 10.0, UNKNOWN, 18000),
universe-> ('Rigel II', 6, 20.0, UNKNOWN, 17000),
universe-> ('Whirlpool X', 6, 30.0, UNKNOWN, 16000),
universe-> ('Whirlpool Y', 6, 40.0, UNKNOWN, 15000);
ERROR:  column "unknown" does not exist
LINE 5: ('Proxima b', 2, 0.05, UNKNOWN, 11300),
                               ^
universe=> INSERT INTO planet (name, star_id, distance_from_star, has_life, diameter) VALUES
universe-> ('Earth', 1, 1.0, TRUE, 12742),
universe-> ('Mars', 1, 1.5, FALSE, 6779),
universe-> ('Jupiter', 1, 5.2, FALSE, 139820),
universe-> ('Proxima b', 2, 0.05, TRUE, 11300),
universe-> ('Alpha Centauri Bb', 3, 0.04, FALSE, 12400),
universe-> ('Alpha Centauri Bc', 3, 0.22, FALSE, 13000),
universe-> ('Beta Pictoris b', 5, 9.1, FALSE, 16000),
universe-> ('Betelgeuse I', 5, 10.0, FALSE, 15000),
universe-> ('Rigel I', 6, 10.0, FALSE, 18000),
universe-> ('Rigel II', 6, 20.0, FALSE, 17000),
universe-> ('Whirlpool X', 6, 30.0, FALSE, 16000),
universe-> ('Whirlpool Y', 6, 40.0, FALSE, 15000);
INSERT 0 12
universe=> INSERT INTO moon (name, planet_id, orbital_period, surface_composition) VALUES
universe-> ('Moon', 1, 27, 'Rocky'),
universe-> ('Phobos', 2, 0.3, 'Rocky'),
universe-> ('Deimos', 2, 1.3, 'Rocky'),
universe-> ('Europa', 3, 3.5, 'Icy'),
universe-> ('Ganymede', 3, 7.2, 'Icy'),
universe-> ('Callisto', 3, 16.7, 'Icy'),
universe-> ('Io', 3, 1.8, 'Volcanic'),
universe-> ('Proxima b I', 4, 5.0, 'Unknown'),
universe-> ('Alpha Centauri Bb I', 5, 4.0, 'Unknown'),
universe-> ('Alpha Centauri Bc I', 6, 3.0, 'Unknown'),
universe-> ('Beta Pictoris b I', 7, 6.0, 'Unknown'),
universe-> ('Betelgeuse I I', 8, 5.5, 'Unknown'),
universe-> ('Rigel I I', 9, 6.0, 'Unknown'),
universe-> ('Rigel II I', 10, 5.5, 'Unknown'),
universe-> ('Whirlpool X I', 11, 7.0, 'Unknown'),
universe-> ('Whirlpool Y I', 12, 6.0, 'Unknown'),
universe-> ('Whirlpool Z', 12, 6.0, 'Unknown'),
universe-> ('Whirlpool Z I', 12, 6.0, 'Unknown'),
universe-> ('Whirlpool Z II', 12, 6.0, 'Unknown'),
universe-> ('Whirlpool Z III', 12, 6.0, 'Unknown');
INSERT 0 20
universe=> INSERT INTO asteroid_belt (name, location, number_of_asteroids, is_circular) VALUES
universe-> ('Main Belt', 'Between Mars and Jupiter', 1000000, TRUE),
universe-> ('Kuiper Belt', 'Beyond Neptune', 100000, TRUE),
universe-> ('Oort Cloud', 'Outer edge of solar system', 10000, TRUE);
INSERT 0 3
universe=> pg_dump -cC --inserts -U freecodecamp universe > universe.sql
