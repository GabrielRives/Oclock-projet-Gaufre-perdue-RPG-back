const pkg = require ('pg');
const { Pool } = pkg;

/**
 * Pool de connexions à la base de données PostgreSQL --
 * Connection pool to the database PostgreSQL
 * 
 * @type {import('pg').Pool}
 * @memberof Database
 */
const pool = new Pool({
    user: 'admin_orpg', // user de la base de donnée
    host: 'localhost', // hôte
    database: 'db_orpg', // nom de la BDD
    password: 'mdp_orpg', // mot de passe de la BDD
    port: 5432, // port d'écoute de la BDD
});

pool.connect();

module.exports = pool;