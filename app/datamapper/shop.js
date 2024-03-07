const { executeRequest, executeRequestWithSingleResult } = require('../helper/pgHelper');

/**
 * Datamapper pour la gestion du magasin --
 * Datamapper handling the shop
 * 
 * @namespace ShopDatamapper
 */
const shopDatamapper = {
    
    /**
     * Récupère toutes les armes du magasin --
     * Get all weapons of the shop
     *
     * @async
     * @function getAllWeapon
     * @memberof ShopDatamapper
     * @returns {Promise<Array<Object>>} - Résultat de la requête
     */
    async getAllWeapon() {
        const sqlQuery = `SELECT * FROM "weapon";`;
        return executeRequest(sqlQuery);
    },

    /**
     * Récupère toutes les armures du magasin --
     * Get all armors of the shop
     *
     * @async
     * @function getAllArmor
     * @memberof ShopDatamapper
     * @returns {Promise<Array<Object>>} - Résultat de la requête
     */
    async getAllArmor() {
        const sqlQuery = `SELECT * FROM "armor";`;
        return executeRequest(sqlQuery);
    },

    /**
     * Récupère les informations d'une arme par son ID --
     * Get all infos of a weapon by his id
     *
     * @async
     * @function getWeaponById
     * @memberof ShopDatamapper
     * @param {number} id - ID de l'arme.
     * @returns {Promise<Object>} - Résultat de la requête
     */
    async getWeaponById(id) {
        const sqlQuery = `SELECT * FROM "weapon" WHERE id = $1;`;
        const values = [id];
        return executeRequestWithSingleResult(sqlQuery, values);
    },

    /**
     * Récupère les informations d'une armure par son ID --
     * Get all infos of an armor by his id
     *
     * @async
     * @function getArmorById
     * @memberof ShopDatamapper
     * @param {number} id - ID de l'armure
     * @returns {Promise<Object>} - Résultat de la requête
     */
    async getArmorById(id) {
        const sqlQuery = `SELECT * FROM "armor" WHERE id = $1;`;
        const values = [id];
        return executeRequestWithSingleResult(sqlQuery, values);
    },

    /**
     * Récupère une arme aléatoire en fonction de la classe du personnage --
     * Get a random weapon depending on the class of the character
     *
     * @async
     * @function getRandomWeapon
     * @memberof ShopDatamapper
     * @param {number} id - ID de la classe
     * @returns {Promise<Array<Object>>} - Résultat de la requête
     */
    async getRandomWeapon(id) {
        const sqlQuery = `SELECT * FROM get_random_weapon($1);`;
        const values = [id];
        return executeRequest(sqlQuery, values);
    },

    /**
     * Récupère une armure aléatoire en fonction de la classe du personnage --
     * Get a random armor depending on the class of the character
     *
     * @async
     * @function getRandomArmor
     * @memberof ShopDatamapper
     * @param {number} id - ID de la classe
     * @returns {Promise<Array<Object>>} - Résultat de la requête
     */
    async getRandomArmor(id) {
        const sqlQuery = `SELECT * FROM get_random_armor($1);`;
        const values = [id];
        return executeRequest(sqlQuery, values);
    },

    async getRandomEquipment(classId) {
        const sqlQuery = `SELECT * FROM get_random_equipment($1);`;
        const values = [classId];
        return executeRequestWithSingleResult(sqlQuery, values);
    },

    /**
     * Achète une armure --
     * Buy an armor
     *
     * @async
     * @function buyArmor
     * @memberof ShopDatamapper
     * @returns {Promise<Object>} - Résultat de la requête
     */
    async buyArmor(body) {
        const { characterId, armorId } = body;
        const sqlQuery = `SELECT * FROM buy_armor($1, $2);`;
        const values = [characterId, armorId];
        return executeRequestWithSingleResult(sqlQuery, values);
    },
    
    /**
     * Achète une arme --
     * Buy a weapon
     *
     * @async
     * @function buyWeapon
     * @memberof ShopDatamapper
     * @returns {Promise<Object>} - Résultat de la requête
     */
    async buyWeapon(body) {
        console.log('body :', body);
        const { characterId, weaponId } = body;
        const sqlQuery = `SELECT * FROM buy_weapon($1, $2);`;
        const values = [characterId, weaponId];
        console.log('values :', values);
        return executeRequestWithSingleResult(sqlQuery, values);
    },

    /**
     * Rafraîchit l'équipement --
     * Refresh equipement
     *
     * @async
     * @function refreshEquipment
     * @memberof ShopDatamapper
     * @returns {Promise<Object>} - Résultat de la requête
     */
    async refreshEquipment() {
        const sqlQuery = `SELECT * FROM refresh_equipment;`;
        return executeRequest(sqlQuery);
    },

    /**
     * Met à jour les items après l'achat --
     * Update items after buying
     *
     * @async
     * @function updateItemsAfterBuy
     * @memberof ShopDatamapper
     * @param {Object} body - Informations pour le rafraîchessement des items
     * @returns {Promise<Object>} - Résultat de la requête
     */
    async updateItemsAfterBuy(body) {
        const { characterId, purse, weaponId, armorId } = body;
        const sqlQuery = {
            text:`
                UPDATE "character" SET 
                    purse = $2,
                    weapon_id = $3,
                    armor_id = $4
                WHERE
                    id = $1
                RETURNING *;`,
            values: [characterId, purse, weaponId, armorId]
        }

        return executeRequestWithSingleResult(sqlQuery);
    }
}

module.exports = shopDatamapper;
