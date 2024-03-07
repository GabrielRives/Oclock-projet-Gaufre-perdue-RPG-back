-- Deploy orpg:1.create_tables to pg

BEGIN;

-- Domain pour vérifier les pseudo des utilisateurs
CREATE DOMAIN "domain_nickname" AS TEXT
CHECK(
    VALUE ~ '^[a-zA-Z0-9]{3,24}$' -- lettres et chiffres / entre 3 et 24 caractères
);

-- Domain pour vérifier les email des utilisateurs
CREATE DOMAIN "domain_mail" AS TEXT
CHECK(
    VALUE ~ '^([-!#-''*+/-9=?A-Z^-~]+(\.[-!#-''*+/-9=?A-Z^-~]+)*|"([]!#-[^-~ \t]|(\\[\t -~]))+")@([0-9A-Za-z]([0-9A-Za-z-]{0,61}[0-9A-Za-z])?(\.[0-9A-Za-z]([0-9A-Za-z-]{0,61}[0-9A-Za-z])?)*|\[((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])(\.(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])){3}|IPv6:((((0|[1-9A-Fa-f][0-9A-Fa-f]{0,3}):){6}|::((0|[1-9A-Fa-f][0-9A-Fa-f]{0,3}):){5}|[0-9A-Fa-f]{0,4}::((0|[1-9A-Fa-f][0-9A-Fa-f]{0,3}):){4}|(((0|[1-9A-Fa-f][0-9A-Fa-f]{0,3}):)?(0|[1-9A-Fa-f][0-9A-Fa-f]{0,3}))?::((0|[1-9A-Fa-f][0-9A-Fa-f]{0,3}):){3}|(((0|[1-9A-Fa-f][0-9A-Fa-f]{0,3}):){0,2}(0|[1-9A-Fa-f][0-9A-Fa-f]{0,3}))?::((0|[1-9A-Fa-f][0-9A-Fa-f]{0,3}):){2}|(((0|[1-9A-Fa-f][0-9A-Fa-f]{0,3}):){0,3}(0|[1-9A-Fa-f][0-9A-Fa-f]{0,3}))?::(0|[1-9A-Fa-f][0-9A-Fa-f]{0,3}):|(((0|[1-9A-Fa-f][0-9A-Fa-f]{0,3}):){0,4}(0|[1-9A-Fa-f][0-9A-Fa-f]{0,3}))?::)((0|[1-9A-Fa-f][0-9A-Fa-f]{0,3}):(0|[1-9A-Fa-f][0-9A-Fa-f]{0,3})|(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])(\.(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])){3})|(((0|[1-9A-Fa-f][0-9A-Fa-f]{0,3}):){0,5}(0|[1-9A-Fa-f][0-9A-Fa-f]{0,3}))?::(0|[1-9A-Fa-f][0-9A-Fa-f]{0,3})|(((0|[1-9A-Fa-f][0-9A-Fa-f]{0,3}):){0,6}(0|[1-9A-Fa-f][0-9A-Fa-f]{0,3}))?::)|(?!IPv6:)[0-9A-Za-z-]*[0-9A-Za-z]:[!-Z^-~]+)])$' 
);

-- Création des deux types d'utilisateur
CREATE TYPE "enum_role" AS ENUM
    ('member', 'admin');

--Création de la table user
CREATE TABLE IF NOT EXISTS "user"
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nickname domain_nickname NOT NULL UNIQUE,
    password TEXT NOT NULL,
    mail domain_mail NOT NULL UNIQUE,
    firstname TEXT,
    lastname TEXT,
    birthdate DATE NOT NULL,
    role enum_role NOT NULL DEFAULT 'member'
);

--Création de la table armor
CREATE TABLE IF NOT EXISTS "armor"
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    label TEXT NOT NULL,
    description TEXT NOT NULL,
    life_point INT NOT NULL,
    physical_defense INT NOT NULL,
    magical_defense INT NOT NULL,
    object_level INT NOT NULL,
    price INT NOT NULL,
    type INT NOT NULL DEFAULT 1
);

--Création de la table weapon
CREATE TABLE IF NOT EXISTS "weapon"
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    label TEXT NOT NULL,
    description TEXT NOT NULL,
    physical_damage INT NOT NULL,
    magical_damage INT NOT NULL,
    critical_damage INT NOT NULL,
    critical_rate INT NOT NULL,
    object_level INT NOT NULL,
    price INT NOT NULL,
    type INT NOT NULL DEFAULT 1
);

--Création de la table class
CREATE TABLE IF NOT EXISTS "class"
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    label TEXT NOT NULL,
    description TEXT NOT NULL,
    weapon_id INT REFERENCES "weapon"(id) NOT NULL,
    armor_id INT REFERENCES "armor"(id) NOT NULL,
    strength INT NOT NULL,
    dexterity INT NOT NULL,
    intelligence INT NOT NULL,
    life_point INT NOT NULL
);

--Création de la table monster
CREATE TABLE IF NOT EXISTS "monster"
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    label TEXT NOT NULL,
    description TEXT NOT NULL,
    life_point INT NOT NULL,
    physical_damage INT NOT NULL,
    magical_damage INT NOT NULL,
    escape INT NOT NULL,
    coin_min INT NOT NULL,
    coin_max INT NOT NULL
);

--Création de la table npc (non-player character)
CREATE TABLE IF NOT EXISTS "npc"
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    firstname TEXT NOT NULL,
    lastname TEXT NOT NULL,
    description TEXT
    
);

--Création de la table quote (dialogues des npc)
CREATE TABLE IF NOT EXISTS "quote"
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    content TEXT NOT NULL
);

-- Création des deux types d'event
CREATE TYPE "enum_event" AS ENUM
    ('battle', 'encounter');

--Création de la table event
CREATE TABLE IF NOT EXISTS "event"
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    label TEXT NOT NULL,
    description TEXT NOT NULL,
    type enum_event NOT NULL DEFAULT 'battle',
    monster_id INT REFERENCES "monster"(id),
    npc_id INT REFERENCES "npc"(id)
);

--Création de la table character
CREATE TABLE IF NOT EXISTS "character"
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nickname domain_nickname NOT NULL UNIQUE,
    purse INT DEFAULT 0 NOT NULL,
    moral INT DEFAULT 0 NOT NULL,
    strength INT,
    dexterity INT,
    intelligence INT,
    user_id INT REFERENCES "user"(id) NOT NULL,
    class_id INT REFERENCES "class"(id) NOT NULL,
    weapon_id INT REFERENCES "weapon"(id) NOT NULL,
    armor_id INT REFERENCES "armor"(id) NOT NULL,
    event_id INT REFERENCES "event"(id),
    intro_is_played BOOLEAN DEFAULT 'false' NOT NULL
);

--Création de la table relationnel entre monstre et quote
CREATE TABLE IF NOT EXISTS "monster_has_quote"
(
    monster_id INT REFERENCES "monster"(id) NOT NULL,
    quote_id INT REFERENCES "quote"(id) NOT NULL
);

--Création de la table relationnel entre npc et quote
CREATE TABLE IF NOT EXISTS "npc_has_quote"
(
    npc_id INT REFERENCES "npc"(id) NOT NULL,
    quote_id INT REFERENCES "quote"(id) NOT NULL
);

--Création de la table relationnel entre character et event
CREATE TABLE IF NOT EXISTS "character_has_event"
(
    character_id INT REFERENCES "character"(id) NOT NULL,
    event_id INT REFERENCES "event"(id) NOT NULL
);

-- Change le propriétaire de toute les tables par admin_orpg
ALTER TABLE "user" OWNER TO admin_orpg;
ALTER TABLE "armor" OWNER TO admin_orpg;
ALTER TABLE "weapon" OWNER TO admin_orpg;
ALTER TABLE "class" OWNER TO admin_orpg;
ALTER TABLE "monster" OWNER TO admin_orpg; 
ALTER TABLE "npc" OWNER TO admin_orpg; 
ALTER TABLE "quote" OWNER TO admin_orpg;
ALTER TABLE "event" OWNER TO admin_orpg;
ALTER TABLE "character" OWNER TO admin_orpg;
ALTER TABLE "monster_has_quote" OWNER TO admin_orpg;
ALTER TABLE "npc_has_quote" OWNER TO admin_orpg;
ALTER TABLE "character_has_event" OWNER TO admin_orpg;

COMMIT;