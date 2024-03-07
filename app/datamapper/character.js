const { executeRequest, executeRequestWithSingleResult } = require('../helper/pgHelper');

/**
 * Datamapper pour la gestion des personnages --
 * Datamapper handling characters
 * 
 * @namespace CharacterDatamapper
 */
const characterDatamapper = {
    
    /**
     * Récupère toutes les classes de personnages
     * Get all classes of characters
     *
     * @async
     * @function getAllClass
     * @memberof CharacterDatamapper
     * @returns {Query} - Résultat de la requête
     */
    async getAllClass() {
        const sqlQuery = `SELECT * FROM "class";`;
        return executeRequest(sqlQuery);
    },
    
    /**
     * Ajoute un nouveau personnage -- 
     * Add a new character
     *
     * @async
     * @function addCharacter
     * @memberof CharacterDatamapper
     * @param {*} character - Données du personnage à ajouter
     * @returns {Promise<Array>} - Résultat de la requête
     */
    async addCharacter(character) {
        const sqlQuery = `SELECT * FROM add_character($1);`;
        const values = [character];
        return executeRequestWithSingleResult(sqlQuery, values);
    },
    
    /**
     * Récupère un personnage par son ID utilisateur --
     * Get a character by a user's id
     *
     * @async
     * @function getCharacterByUserId
     * @memberof CharacterDatamapper
     * @param {*} userId - ID de l'utilisateur
     * @returns {Promise<Array>} - Résultat de la requête
     */
    async getCharacterByUserId(userId) {
        const sqlQuery = `SELECT * FROM "character" WHERE user_id=$1;`;
        const values = [userId];
        return executeRequestWithSingleResult(sqlQuery, values);
    },

    /**
     * Met à jour les informations d'un personnage --
     * Update info on a character
     *
     * @async
     * @function updateCharacter
     * @memberof CharacterDatamapper
     * @param {number} id - ID du personnage
     * @param {object} body - Données du personnage
     * @returns {Promise<Array>} - Résultat de la requête
     */
    async updateCharacter(character) {
        const sqlQuery = `SELECT * FROM update_character($1);`;
        const values = [character];
        return executeRequestWithSingleResult(sqlQuery, values);
    },

    /**
     * Supprime un personnage par son ID --
     * Delete a character by his id
     *
     * @async
     * @function deleteCharacter
     * @memberof CharacterDatamapper
     * @param {number} id - ID du personnage
     * @returns {Promise<Array>} - Résultat de la requête
     */
    async deleteCharacter(id) {
        const sqlQuery = { 
            text: `
                DELETE FROM "character"
                WHERE id = $1
                RETURNING *;`,
            values: [id]
        };
        return executeRequestWithSingleResult(sqlQuery);
    },

    /**
     * Ajoute une classe à un personnage par son ID de classe --
     * Add a class on a character by the id of the class
     *
     * @async
     * @function addClassById
     * @memberof CharacterDatamapper
     * @param {number} classId - ID de la classe à ajouter
     * @returns {Promise<Array>} - Résultat de la requête
     */
    async addClassById(classId) {
        const sqlQuery = `SELECT * FROM add_class_by_id($1);`;
        const values = [classId];
        return executeRequestWithSingleResult(sqlQuery, values);
    },

    /**
     * Récupère une classe de personnage par son ID --
     * Get a class of a character by his id
     *
     * @async
     * @function getClassById
     * @memberof CharacterDatamapper
     * @param {number} id - ID de la classe
     * @returns {Promise<Array>} - Résultat de la requête
     */
    async getClassById(id) {
        const sqlQuery = `SELECT * FROM "class" WHERE id = $1;`;
        const values = [id];
        return executeRequestWithSingleResult(sqlQuery, values);
    },

    /**
     * Récupère un personnage par son ID --
     * Get a character by his id
     *
     * @async
     * @function getCharacterById
     * @memberof CharacterDatamapper
     * @param {number} id - ID du personnage
     * @returns {Promise<Array>} - Résultat de la requête
     */
    async getCharacterById(id) {
        const sqlQuery = `SELECT * FROM "character" WHERE id = $1;`;
        const values = [id];
        return executeRequestWithSingleResult(sqlQuery, values);
    },

    async updateCharacter(character) {
        const sqlQuery = `SELECT * FROM update_character($1);`;
        const values = [character];
        return executeRequestWithSingleResult(sqlQuery, values);
    },

    async updateCharacterStat(character, scroll) {
        const sqlQuery = `SELECT * FROM update_character_stat($1);`;
        const values = [JSON.stringify(2, null, { character, scroll })];
        return executeRequestWithSingleResult(sqlQuery, values);
    }
};

module.exports = characterDatamapper;
