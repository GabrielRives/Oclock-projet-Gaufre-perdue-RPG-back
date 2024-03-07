BEGIN;

TRUNCATE
"user",
"class",
"weapon",
"armor",
"monster",
"npc",
"quote",
"character",
"event",
"npc_has_quote",
"character_has_event";



-- Seeding pour user
INSERT INTO "user" (nickname, password, mail, firstname, lastname, birthdate)
VALUES 
    ('darkSasuke', 'password1', 'darkSasuke@example.com', 'John', 'Doe', '1990-01-01');

-- Seeding pour la table "weapon"
INSERT INTO "weapon" (label, description, physical_damage, magical_damage, critical_damage, critical_rate, object_level, price, type)
VALUES
    ('Epée basique', 'La base du bon chevalier', 20, 5, 10, 15, 5, 2, 1),
    ('Sceptre de base', 'Un bâton trouvé parterre, ça fera le taf', 5, 25, 8, 20, 5, 2, 2),
    ('Arc de base', 'La légende dit : aucune flèche atteint la cible', 15, 10, 12, 18, 5, 2, 3),
    ('Epée moyenne', 'Apparemment ça tranche des têtes', 30, 10, 15, 20, 7, 5, 1),
    ('Bâton de berger', 'Volé à un fermier, bien joué', 10, 30, 12, 25, 7, 5, 2),
    ('Arc des nomades', 'Avec un peu de chance tu mangeras du sanglier ce soir', 25, 15, 18, 22, 7, 5, 3);

-- Seeding pour la table "armor"
INSERT INTO "armor" (label, description, life_point, physical_defense, magical_defense, object_level, price, type)
VALUES
    ('T-shirt renforcé', 'Un t-shirt rembourré par mamie', 50, 30, 20, 5, 3, 1),
    ('Robe en lambeaux', 'Un tissu qui prendrait feu', 20, 10, 25, 5, 3, 2),
    ('Débardeur de chasseur', 'Pas quitté depuis tout petit, ça serre un peu', 30, 15, 15, 5, 3, 3),
    ('Plate Mail', 'Heavy plate mail', 70, 40, 30, 10, 6, 1),
    ('Robe', 'Magical robe', 30, 20, 35, 10, 6, 2),
    ('Leather Armor', 'Light leather armor', 40, 25, 25, 10, 6, 3);



-- Seeding pour la table "class"
INSERT INTO "class" (label, description, weapon_id, armor_id, strength, dexterity, intelligence, life_point)
VALUES
    ('Guerrier', 'A strong and brave warrior', 1, 1, 20, 10, 5, 100),
    ('Mage', 'A wise mage with powerful spells', 2, 2, 5, 10, 20, 80),
    ('Rôdeur', 'A skilled archer with precise shots', 3, 3, 10, 20, 5, 90);
    
-- Seeding pour public.monster
INSERT INTO "monster" (label, description, life_point, physical_damage, magical_damage, escape, coin_min, coin_max)
VALUES 
    ('Dragon', 'Fierce and powerful', 200, 30, 50, 5, 10, 50),
    ('Goblin', 'Small and cunning', 30, 10, 5, 20, 5, 15),
    ('Orc', 'Brutal and aggressive', 50, 20, 10, 10, 7, 20);

-- Seeding pour public.npc
INSERT INTO "npc" (firstname, lastname, description)
VALUES 
    ('Merchant', 'Jones', 'Sells various goods'),
    ('Innkeeper', 'Smith', 'Provides a place to rest'),
    ('Marley', 'Blacksmith', 'Crafts weapons and armor');

-- Seeding pour public.quote
INSERT INTO "quote" (content)
VALUES 
    ('Courage is not the absence of fear, but the triumph over it.'),
    ('Magic is believing in yourself, if you can do that, you can make anything happen.'),
    ('The only limit to our realization of tomorrow will be our doubts of today.');

-- Seeding pour public.event
INSERT INTO "event" (label, description, type, monster_id, npc_id)
VALUES 
    ('Battle in the Forest', 'Fight against the goblins', 'battle', 1, NULL),
    ('Meeting with the Merchant', 'Encounter with a traveling merchant', 'encounter', NULL, 2),
    ('Ambush by Orcs', 'Sudden attack by a group of Orcs', 'battle', 3, NULL);

-- Seeding pour public.character
INSERT INTO "character" (nickname, strength, dexterity, intelligence, user_id, class_id, weapon_id, armor_id, event_id, purse, moral)
VALUES 
    ('DarkSasuke', 1, 3, 2, 1, 1, 1, 1, 1, 100, 0);

-- Seeding pour public.npc_has_quote
INSERT INTO "npc_has_quote" (npc_id, quote_id)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3);

-- Seeding pour public.character_has_event
INSERT INTO "character_has_event" (character_id, event_id)
VALUES 
    (1, 1);


COMMIT;