-- Revert orpg:2.functions from pg

BEGIN;

DROP FUNCTION IF EXISTS
add_user(u json),
verify_user(json),
get_user(int),
get_monster_by_id(int),
get_random_monster(),
get_replica_of_monster(),
get_npc_by_id(int),
get_random_npc(),
get_replica_of_npc(int),
add_character(json),
add_class_by_id(int),
update_monster(u json),
get_random_event(),
update_character(u json),
update_character_stat(u json),
get_random_weapon(int),
get_random_armor(int),
buy_weapon(int, int),
buy_armor(int, int);
--switch_items(int, int, int);

COMMIT;
