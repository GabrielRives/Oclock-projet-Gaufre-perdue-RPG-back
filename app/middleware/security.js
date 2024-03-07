const bcrypt = require('bcrypt');
const jwt = require('./jwt.js'); // Assurez-vous d'importer la bibliothèque jwt

const { APIError } = require('./error/APIError.js');
const { userDatamapper } = require('../datamapper');

/**
 * Middleware de vérification du rôle 'Admin'
 *
 * @throws {APIError} - Erreur API générée en cas d'échec de vérification du rôle
 */
function isAdmin(req, res, next) {
    // Récupération du token
    const token = req.get("Authorization");
    // Vérification du token
    const { result, error } = jwt.decode(token);

    if (error) {
        // l'utilisateur a-t-il le rôle 'admin' ?
        if (result.role == 'admin') {
            next();
        }
        else {
            next(new APIError("Vous n'avez pas le droit",401));
        }
    }
    else {
        next(error);
    }
}

/**
 * Middleware de vérification du rôle 'Member'
 *
 * @throws {APIError} - Erreur API générée en cas d'échec de vérification du rôle
 */
function isMember(req, res, next) {

    const tokenBearer = req.get("Authorization");
    console.log('token authorization', tokenBearer);
    // Vérification du token

        if (tokenBearer && tokenBearer.startsWith('Bearer ')) {
            const token = tokenBearer.slice(7);
            const { result, error } = jwt.decode(token);

            if (error) {
                next(error);

            } else {
        // l'utilisateur a-t-il le rôle 'member' ou 'admin' ?
        if (result.role == 'member' || result.role == 'admin') {
            next();
        }
        else {
            next(new APIError("Vous n'avez pas le droit",401));
        }
    }
}
}

/**
 * Fonction hachage du mot de passe via bcrypt
 *
 * @async
 * @param {*} password
 * @returns {unknown}
 */
async function encodePassword(password){
    return await bcrypt.hash(password, parseInt(process.env.BCRYPT_SALT));
}

/**
 * Fonction de comparaison en deux mots de passe hachés
 *
 * @async
 * @param {*} password
 * @param {*} passwordHash
 * @returns {unknown}
 */
async function passwordMatch(password,passwordHash){
    return await bcrypt.compare(password, passwordHash);
}

module.exports = {
    isAdmin,
    isMember,
    encodePassword,
    passwordMatch
};
