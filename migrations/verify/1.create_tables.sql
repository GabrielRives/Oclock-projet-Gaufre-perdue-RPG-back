-- Verify orpg:1.create_tables on pg

BEGIN;

SELECT * FROM "user";
SELECT * FROM "armor";
SELECT * FROM "weapon";
SELECT * FROM "class";
SELECT * FROM "monster";
SELECT * FROM "npc";
SELECT * FROM "quote";
SELECT * FROM "event";
SELECT * FROM "character";
SELECT * FROM "npc_has_quote";
SELECT * FROM "monster_has_quote";
SELECT * FROM "character_has_event";

ROLLBACK;
