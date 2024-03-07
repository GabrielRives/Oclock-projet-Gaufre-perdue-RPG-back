const Joi = require('joi');

/**
 * Schéma de validation pour la connexion (signin) en regex --
 * Schema of validation for the connection (signin) in regex
 *
 * @type {import('joi').ObjectSchema}
 *
 * @property {import('joi').StringSchema} nickname - Schéma de validation pour le pseudo
 * @property {import('joi').StringSchema} password - Schéma de validation pour le mot de passe
 */
const signinSchema =  Joi.object({
    nickname: Joi.string().pattern(/^[a-zA-Z0-9]{3,24}$/), // doit contenir entre 3 et 24 caractères alphanumérique
    password: Joi.string().pattern(/^[a-zA-Z0-9!?*_%]{8,24}$/) // doit contenir en plus des caractères spéciaux entre 8 et 24 caractères
}).required().length(2);

/**
 * Schéma de validation pour l'inscription (signup) en regex --
 * Schema of validation for the inscription (signup) in regex
 *
 * @type {import('joi').ObjectSchema}
 *
 * @property {import('joi').StringSchema} nickname - Schéma de validation pour le pseudo
 * @property {import('joi').StringSchema} password - Schéma de validation pour le mot de passe
 * @property {import('joi').StringSchema} mail - Schéma de validation pour l'adresse e-mail
 * @property {import('joi').StringSchema} firstname - Schéma de validation pour le prénom
 * @property {import('joi').StringSchema} lastname - Schéma de validation pour le nom de famille
 * @property {import('joi').DateSchema} birthdate - Schéma de validation pour la date de naissance
 */
const signupSchema =  Joi.object({
    nickname: Joi.string().pattern(/^[a-zA-Z0-9]{3,24}$/),
    password: Joi.string().pattern(/^[a-zA-Z0-9!?*_%]{8,24}$/),
    mail: Joi.string().email(),
    firstname:Joi.string(),
    lastname:Joi.string(),
    birthdate:Joi.date()
}).required().length(2);

module.exports = {
    signinSchema,
    signupSchema
}