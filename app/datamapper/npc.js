const { executeRequest, executeRequestWithSingleResult } = require('../helper/pgHelper');

/**
 * Datamapper pour la gestion des PNJ --
 * Datamapper handling NPC
 * 
 * @namespace NpcDatamapper
 */
const npcDatamapper = {
    /**
     * Récupère tous les PNJ --
     * Get all NPC
     *
     * @async
     * @function getAllNpc
     * @memberof NpcDatamapper
     * @returns {Promise<Array<Object>>} - Résultat de la requête
     */
    async getAllNpc() {
        const sqlQuery = `SELECT * FROM "npc";`;
        return executeRequest(sqlQuery);
    },

    /**
     * Récupère les informations d'un NPC par son ID --
     * Get all infos of a NPC by his id
     *
     * @async
     * @function getNpcById
     * @memberof NpcDatamapper
     * @param {number} id - ID du NPC
     * @returns {Promise<Object>} - Résultat de la requête, un objet représentant le NPC
     */
    async getNpcById(id) {
        const sqlQuery = {
            text: 
            `SELECT * FROM get_npc_by_id($1);`,
            values: [id]
        };
        return executeRequestWithSingleResult(sqlQuery);
    },

    /**
     * Récupère un PNJ aléatoire --
     * Get a random NPV
     *
     * @async
     * @function getRandomNpcById
     * @memberof NpcDatamapper
     * @returns {Promise<Array<Object>>} - Résultat de la requête, une liste d'objets représentant le NPC aléatoire
     */
    async getRandomNpcById() {
        const sqlQuery = `SELECT * FROM get_random_npc()`;
        return executeRequestWithSingleResult(sqlQuery);
    },

    /**
     * Obtenir la réplique du personnage non joueur par son id
     * Gets a replica of an NPC by its ID.
     * @date 23/02/2024 - 20:56:26
     *
     * @async
     * @param {number} id - The ID of the NPC.
     * @returns {Promise<Object>} The replica of the NPC.
     */
    async getReplicaNpc(id) {
        // console.log( "id :",id);
        const sqlQuery = {
            text: `SELECT * FROM get_replica_of_npc($1);`,
            values: [id]
        };
        return executeRequestWithSingleResult(sqlQuery);
    }
};

module.exports = npcDatamapper;
