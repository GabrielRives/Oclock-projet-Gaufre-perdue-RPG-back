const pool = require ( "../middleware/pgPool.js");

/**
 * Fonction générique qui retourne les lignes d'une requête SQL
 * @param {string} sqlQuery - Requêtes SQL 
 * @param {array} values - Valeurs de la requête
 * @returns 
 */

const pgHelper = {
    async executeRequest(sqlQuery,values){
    let result;
    let error;

    try{
        const response = await pool.query(sqlQuery,values);
        result = response.rows;
    }
    catch(err){
        error = err;
    }

    return {result,error};
},

/**
 * Fonction générique qui retourne la première ligne d'une requête SQL
 * @param {*} sqlQuery 
 * @returns 
 */async executeRequestWithSingleResult(sqlQuery,values){
    let result;
    let error;

    try{
        const response = await pool.query(sqlQuery,values);
        result = response.rows[0];
    }
    catch(err){
        error = err;
    }

    return {result,error};
}

};

module.exports = pgHelper;
