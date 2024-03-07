const { APIError } = require('../error/APIError.js');

/**
 * Middleware de validation via Joi --
 * Middleware of validation via Joi
 *
 * @function validate
 * @param {import('joi').ObjectSchema} schema - Schéma de validation Joi
 * @param {string | null} [subKey=null] - Clé spécifique à valider dans le corps de la requête
 * @returns {import('express').RequestHandler} - Middleware d'Express pour la validation
 *
 * @throws {APIError} - Erreur API générée en cas d'échec de la validation
 */
function validate(schema, subKey = null){

    return (request, _ , next) => {

        // si on précise une clé, seule cette clé sera validée
        const data = (subKey) ? request.body[subKey] : request.body;
        console.log(data);
        const { error } = new APIError(schema.validate(data),400);

        if (error) {
            next(error);
            return;
        }

        next();
    };
    
};

module.exports = { validate };