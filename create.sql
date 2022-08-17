CREATE TABLE pokemons (
    id_pokemon INT PRIMARY KEY AUTO_INCREMENT,
    id_pokedex CHAR(5) NOT NULL,
    name_pokemon VARCHAR(40) NOT NULL
);
CREATE TABLE regions(
    id_region INT PRIMARY KEY AUTO_INCREMENT,
    region_name CHAR(10)
);
CREATE TABLE prices(
    id_value INT PRIMARY KEY AUTO_INCREMENT,
    valuePZ INT(5) NOT NULL
);
CREATE TABLE users(
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    nickname VARCHAR(60) NOT NULL;
)
CREATE TABLE wildernesses(
    id_wilderness INT PRIMARY KEY AUTO_INCREMENT,
    wilderness_name VARCHAR(30) NOT NULL,
    id_region INT,
    CONSTRAINT FK_wilderness_regions FOREIGN KEY (id_region) REFERENCES regions(id_region)
);
CREATE TABLE pokemon_locations(
    id_location INT PRIMARY KEY AUTO_INCREMENT,
    id_pokemon INT NOT NULL,
    id_wilderness INT,
    id_region INT NOT NULL,
    CONSTRAINT FK_locationPokemon FOREIGN KEY(id_pokemon) REFERENCES pokemons(id_pokemon),
    CONSTRAINT FK_locationWilderness FOREIGN KEY(id_wilderness) REFERENCES wildernesses(id_wilderness),
    CONSTRAINT FK_locationRegion FOREIGN KEY(id_region) REFERENCES regions(id_region)
);
CREATE TABLE shiny_wildernesses(
    id_shWild INT PRIMARY KEY AUTO_INCREMENT,
    id_pokemon INT NOT NULL,
    id_wilderness INT NOT NULL,
    id_region INT NOT NULL,
    CONSTRAINT FK_shPokemon FOREIGN KEY(id_pokemon) REFERENCES pokemons(id_pokemon),
    CONSTRAINT FK_shWilderness FOREIGN KEY(id_wilderness) REFERENCES wildernesses(id_wilderness),
    CONSTRAINT FK_shRegion FOREIGN KEY(id_region) REFERENCES regions(id_region)
);
CREATE TABLE shCollectorPrices(
    id_shCollPrices INT PRIMARY KEY AUTO_INCREMENT,
    id_pokemon INT NOT NULL,
    id_value INT NOT NULL,
    CONSTRAINT FK_shPricesPokemon FOREIGN KEY(id_pokemon) REFERENCES pokemons(id_pokemon),
    CONSTRAINT FK_sh_Prices FOREIGN KEY(id_value) REFERENCES prices(id_value)
);
CREATE TABLE users_huntings(
    id_userHunt INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT,
    id_pokemon INT,
    catch_date DATETIME
);