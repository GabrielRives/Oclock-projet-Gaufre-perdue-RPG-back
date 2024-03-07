-- Suppression de l'existant
DROP DATABASE IF EXISTS "db_orpg";
DROP ROLE IF EXISTS "admin_orpg";
DROP ROLE IF EXISTS "api_orpg";

-- Création des comptes qui vont utiliser la BDD
CREATE USER "admin_orpg" WITH PASSWORD 'mdp_orpg';
CREATE USER "api_orpg" WITH PASSWORD 'mdp_apiorpg';

-- Création de la BDD
CREATE DATABASE "db_orpg" OWNER "admin_orpg";