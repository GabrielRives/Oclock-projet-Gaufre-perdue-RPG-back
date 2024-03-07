/**
 * Envoie erreur 500 par défaut --
 * Send an error 500 by default
 *
 * @class APIError
 * @extends {Error}
 *
 * @param {string} message - Message d'erreur associé à l'erreur.
 * @param {number} [status=500] - Statut HTTP erreur 500 par défaut.
 *
 * @property {number} status - Statut HTTP de l'erreur.
 */
class APIError extends Error {
    constructor(message, status = 500) {
        super(message);
        this.status = status;
    }
}

module.exports = { APIError };