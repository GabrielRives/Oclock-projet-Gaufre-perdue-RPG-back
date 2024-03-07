const winston = require('winston');

/**
 * Journalisation personnalisés --
 * Custom logging
 * 
 * @typedef {Object} LogLevel
 * @property {number} error - Erreurs critiques
 * @property {number} warn - Avertissements
 * @property {number} info - Informations générales
 * @property {number} http - Journalisation spécifique à HTTP
 * @property {number} debug - Informations de débogage
 */

/**
 * Détermine les niveaux des messages
 */
const levels = {
  error: 0,
  warn: 1,
  info: 2,
  http: 3,
  debug: 4,
};

/**
 * Fonction qui détermine le niveau de journalisation --
 * Function how determines the level of logging
 * 
 * @function
 * @returns {string} - Niveau de journalisation
 */
const level = () => {
  const isDevelopment = process.env.NODE_ENV === 'development';
  return isDevelopment ? 'debug' : 'http';
};

/**
 * Couleurs associées aux niveaux de journalisation --
 * Colors linked at the level of logging
 * 
 * @typedef {Object} LogColors
 * @property {string} error - Rouge
 * @property {string} warn - Jaune
 * @property {string} info - Vert
 * @property {string} http - Bleu
 * @property {string} debug - Blanc
 */

/**
 * Configuration des couleurs pour les niveaux de journalisation --
 * Configuration of the colors for the levels of logging
 * 
 * @type {LogColors}
 */
const colors = {
  error: 'red',
  warn: 'yellow',
  info: 'green',
  http: 'blue',
  debug: 'white',
};

// Ajout des couleurs à Winston
winston.addColors(colors);

/**
 * Format de journalisation combinant plusieurs formats --
 * Format of logging combining multiple formats
 * 
 * @type {object}
 */
const format = winston.format.combine(
  winston.format.timestamp({ format: 'DD-MM-YYYY HH:mm:ss:ms' }),
  winston.format.colorize({ all: true }),
  winston.format.printf((info) => `${info.timestamp} ${info.level}: ${info.message}`),
);

/**
 * Liste des transports pour l'enregistrement des journaux --
 * List of transports for logging's journals
 * 
 * @type {Array}
 */
const transports = [
  // new winston.transports.Console(),
  new winston.transports.File({
    filename: 'logs/all.log',
  }),
  new winston.transports.File({
    filename: 'logs/error.log',
    level: 'error',
  }),
];

/**
 * Instance du logger Winston --
 * Instance of logger Winston
 * 
 * @type {winston.Logger}
 */
const logger = winston.createLogger({
  level: level(),
  levels,
  format,
  transports,
});

module.exports = logger;