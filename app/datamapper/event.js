const { executeRequest, executeRequestWithSingleResult } = require('../helper/pgHelper');

/**
 * Datamapper pour la gestion des événements --
 * Datamapper handling events
 * 
 * @namespace EventDatamapper
 */
const eventDatamapper = {
    
    /**
     * Récupère un événement aléatoire en utilisant une fonction SQL --
     * Get a random event using SQL function
     *
     * @async
     * @function getRandomEvent
     * @memberof EventDatamapper
     * @returns {Promise<Array>} - Résultat de la requête
     */
    async getRandomEvent() {
        const sqlQuery = `SELECT * FROM get_random_event();`;
        return executeRequest(sqlQuery);
    },

    /**
     * Récupère un monstre par son ID pour un événement de type 'battle' --
     * Get a monster's id for an event of type 'battle'
     *
     * @async
     * @function getBattle
     * @memberof EventDatamapper
     * @param {number} id - ID du monstre
     * @returns {Promise<Array>} - Résultat de la requête
     */
    async getBattle(id) {
        const sqlQuery = {
            text: `SELECT * FROM "monster" WHERE id=$1`,
            values: [id]
        };
        return executeRequestWithSingleResult(sqlQuery);
    },

    /**
     * Récupère une rencontre par son ID pour un événement de type 'encounter'
     * Get an encounter by his id for event of type 'encounter'
     *
     * @async
     * @function getEncounter
     * @memberof EventDatamapper
     * @param {number} id - ID du pnj à rencontrer
     * @returns {Promise<Array>} - Résultat de la requête
     */
    async getEncounter(id) {
        const sqlQuery = {
            text: `SELECT * FROM "npc" WHERE id=$1`,
            values: [id]
        };
        return executeRequestWithSingleResult(sqlQuery);
    }
};

module.exports = eventDatamapper;
