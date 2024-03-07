const debug =  require("debug");
debug("error:API");

const logger = require('./logger.js');

const { APIError } = require("./APIError.js");

// https://expressjs.com/en/guide/error-handling.html
// eslint-disable-next-line no-unused-vars

/**
 * Middleware Express pour la gestion des erreurs --
 * Middleware Express for handling errors
 *
 * @param {Error} error - Erreur à gérer.
 * @param {Object} _ - Requête Express (vide car non utilisé).
 * @param {Object} response - Réponse Express.
 * @param {Function} next - Fonction de middleware suivante.
 *
 * @returns {Object} - Réponse JSON avec le statut HTTP approprié en fonction de l'erreur.
 *
 * @throws {Error} - Relance des erreurs pour être capturées par d'autres middlewares d'erreur.
 */
const errorHandler = (error, _, response, next) => {
    debug('errorHandler', error);
    console.log(error);
    logger.log('error', error.message);
    if (error instanceof APIError) {
        if (process.env.NODE_ENV === 'development') {
            return response.status(error.status).json({ status: 'error', message: error.message, stack: error.stack });
        }
        return response.status(error.status).json({ status: 'error', message: error.message });
    }
    if (process.env.NODE_ENV === 'development') {
        return response.status(500).json({ status: 'error', message: error.message, stack: error.stack });
    }
    return response.status(500).json({ status: 'error', message: 'Internal server error' });
};

// Amélioration possible ?? :
/*
const errorHandler = (error, _, response, next) => {
    debug('errorHandler', error);
    console.log(error);
    logger.log('error', error.message);

    if (error instanceof APIError) {
        return response.status(error.status).json({ status: 'error', message: error.message, stack: process.env.NODE_ENV === 'development' ? error.stack : undefined });
    }

    if (error instanceof NotFoundError) {
        return response.status(404).json({ status: 'error', message: error.message, stack: process.env.NODE_ENV === 'development' ? error.stack : undefined });
    }

    if (error instanceof ValidationError) {
        return response.status(400).json({ status: 'error', message: error.message, stack: process.env.NODE_ENV === 'development' ? error.stack : undefined });
    }

    return response.status(500).json({ status: 'error', message: process.env.NODE_ENV === 'development' ? error.message : 'Internal server error', stack: process.env.NODE_ENV === 'development' ? error.stack : undefined });
};
*/

module.exports = errorHandler;