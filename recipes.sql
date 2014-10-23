/* Data Definition for Recipes DB*/

CREATE TABLE units(
    id          serial          NOT NULL,
    name        varchar(255)    NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE TABLE categories(
    id          serial          NOT NULL,
    name        varchar(255)    NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (name)
);


CREATE TABLE ingredients(
    id          serial          NOT NULL,
    name        varchar(255)    NOT NULL,
    favored_unit int            NOT NULL,
    category    int             NOT NULL,  
    PRIMARY KEY (id),
    FOREIGN KEY (favored_unit) references units(id),
    FOREIGN KEY (category)     references categories(id),
    UNIQUE (name)
);

CREATE TABLE conversions(
    id          serial          NOT NULL,
    unit1       int             NOT NULL,
    unit2       int             NOT NULL,
    ingredient  int             NOT NULL,
    factor      decimal         NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (unit1) REFERENCES units(id),
    FOREIGN KEY (unit2) REFERENCES units(id),
    UNIQUE (unit1, unit2, ingredient),
    CHECK (unit1 != unit2)
);

CREATE TABLE allergies(
    id          serial          NOT NULL,
    name        varchar(255)    NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE TABLE ingredient_allergy(
    id          serial          NOT NULL,
    ingredient  int             NOT NULL,
    allergy     int             NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (ingredient) REFERENCES ingredients(id),
    FOREIGN KEY (allergy)    REFERENCES allergies(id),
    UNIQUE (ingredient,allergy)
);

CREATE TABLE recipes(
    id          serial          NOT NULL,
    name        varchar(255)    NOT NULL,
    image       varchar(255),
    comment     text,
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE TABLE recipe_allergy(
    id          serial          NOT NULL,
    recipe      int             NOT NULL,
    allergy     int             NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (recipe)  REFERENCES recipes(id),
    FOREIGN KEY (allergy) REFERENCES allergies(id),
    UNIQUE (recipe,allergy)
);

CREATE TABLE recipe_ingredient(
    id          serial          NOT NULL,
    ingredient  int             NOT NULL,
    recipe      int             NOT NULL,
    unit        int             NOT NULL,
    amount      decimal         NOT NULL,   
    PRIMARY KEY (id),
    FOREIGN KEY (ingredient) REFERENCES ingredients(id),
    FOREIGN KEY (recipe)     REFERENCES recipes(id),
    FOREIGN KEY (unit)       REFERENCES units(id),
    UNIQUE (recipe, ingredient)
);

CREATE TABLE menues(
    id          serial          NOT NULL,
    name        varchar(255)    NOT NULL,
    created     timestamp       NOT NULL,
    people      int             NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE TABLE menue_recipe(
    id          serial          NOT NULL,
    menue       int             NOT NULL,
    recipe      int             NOT NULL,
    factor      decimal         NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (menue)  REFERENCES menues(id),
    FOREIGN KEY (recipe) REFERENCES recipes(id),
    UNIQUE (menue, recipe)
);
