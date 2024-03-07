const { executeRequest, executeRequestWithSingleResult } = require('../helper/pgHelper');

/**
 * Datamapper pour la gestion des monstres --
 * Datamapper handling monsters
 * 
 * @namespace MonsterDatamapper
 */
const monsterDatamapper = {
    /**
     * Récupère tous les monstres --
     * Get all monsters
     *
     * @async
     * @function getAllMonsters
     * @memberof MonsterDatamapper
     * @returns {Promise<Array<Object>>} - Résultat de la requête
     */
    async getAllMonsters() {
        const sqlQuery = `SELECT * FROM "monster";`;
        return executeRequest(sqlQuery);
    },

    /**
     * Récupère les informations d'un monstre par son ID --
     * Get all informations of a monster by his id
     *
     * @async
     * @function getMonsterById
     * @memberof MonsterDatamapper
     * @param {number} id - ID du monstre
     * @returns {Promise<Object>} - Résultat de la requête
     */
    async getMonsterById(id) {
        const sqlQuery = `SELECT * FROM "monster" WHERE id = $1;`;
        const values = [id];
        
        return executeRequestWithSingleResult(sqlQuery, values);
    },

    /**
     * Récupère un monstre aléatoire --
     * Get a random monster
     *
     * @async
     * @function getRandomMonsterById
     * @memberof MonsterDatamapper
     * @returns {Promise<Array<Object>>} - Résultat de la requête
     */
    async getRandomMonsterById() {
        const sqlQuery = `SELECT * FROM get_random_monster();`;
        return executeRequest(sqlQuery);
    },

    /**
     * Met à jour les informations d'un monstre --
     * Update info on a monster
     *
     * @async
     * @function updateMonster
     * @memberof MonsterDatamapper
     * @param {number} id - ID du monstre.
     * @param {Object} body - Nouvelles données du monstre.
     * @returns {Promise<Object>} - Résultat de la requête
     */
    async updateMonster(id, body) {
        const { label, description, life_point, physical_damage, magical_damage, escape } = body;
        const sqlQuery = {
            text: `
                UPDATE "monster" SET
                    label = $1,
                    description = $2
                    life_point = $3
                    physical_damage = $4
                    magical_damage = $5
                    escape = $6
                WHERE
                    id = $7
                RETURNING *;
                `,
            values: [label, description, life_point, physical_damage, magical_damage, escape, id]
        };
        return executeRequest(sqlQuery);
    },

    /**
     * Supprime un monstre par son ID --
     * Delete a monster by his id
     *
     * @async
     * @function deleteMonster
     * @memberof MonsterDatamapper
     * @param {number} id - ID du monstre à supprimer.
     * @returns {Promise<Object>} - Résultat de la requête
     */
    async deleteMonster(id) {
        const sqlQuery = {
            text: `
                DELETE FROM "monster"
                WHERE id = $1
                RETURNING*;`,
            values: [id]
        }
        return executeRequestWithSingleResult(sqlQuery); 
    },
    
    /**
     * Récupère aléatoirement un monstre (directement l'objet)
     * Gets a random monster.
     * @date 23/02/2024 - 21:33:43
     *
     * @async
     * @returns {Promise<Object>} The random monster.
     */
    async recoverRandomMonster() {
        const sqlQuery = `SELECT * FROM get_random_monster();`;
        return executeRequestWithSingleResult(sqlQuery);
    },
    
    /**
     * Obtenir une réplique aléatoire d'un monstre
     * Gets a replica of a monster.
     * @date 23/02/2024 - 21:35:09
     *
     * @async
     * @returns {Promise<Object>} The replica of the monster.
     */
    async getReplicaOfMonster() {
        const sqlQuery = `SELECT * FROM get_replica_of_monster();`;
        return executeRequestWithSingleResult(sqlQuery);
    }
};

module.exports = monsterDatamapper;
