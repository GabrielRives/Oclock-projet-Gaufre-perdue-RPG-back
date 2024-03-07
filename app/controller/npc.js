const { manageResponse } = require("../helper/controllerHelper.js");
const { APIError } = require("../middleware/error/APIError.js");
const { npcDatamapper } = require('../datamapper');
const jwt = require("../middleware/jwt.js");

/**
 * Contrôleur pour la gestion des personnages non-joueurs (PNJ) --
 * Controller for handling non-playable character (NPC)
 * 
 * @namespace NpcController
 */

const npcController = {
    /**
     * Récupère tous les PNJ --
     * Get all NPC
     *
     * @async
     * @function getAllNpc
     * @memberof NpcController
     */
    async getAllNpc(req, res, next) {
        const { error, result } = await npcDatamapper.getAllNpc();
        manageResponse(res, result, error, next);
    },

    /**
     * Récupère un PNJ par son identifiant --
     * Get a NPC by his id
     *
     * @async
     * @function getNpcById
     * @memberof NpcController
     */
    async getNpcById(req, res, next) {
        const { error, result } = await npcDatamapper.getNpcById(req.body);
        manageResponse(res, result, error, next);
    },

    /**
     * Récupère un PNJ aléatoire --
     * Get a random NPC
     *
     * @async
     * @function getRandomNpcById
     * @memberof NpcController
     */
    async getRandomNpcById(req, res, next) {
        const { error, result } = await npcDatamapper.getRandomNpcById();
        manageResponse(res, result, error, next);
    },

    /**
     * Obtenir la réplique du PNJ par son ID
     * Gets a replica of an NPC by its ID.
     * @date 23/02/2024 - 20:12:16
     *
     * @async
     * @param {Object} req The Express request object.
     * @param {Object} res The Express response object.
     * @param {Function} next The next middleware function.
     */
    async getReplicaOfNpc(req, res, next) {
        // console.log("req.params.id :", req.params.id);
        const npcId = parseInt(req.params.id);
        const { error, result } = await npcDatamapper.getReplicaNpc(npcId);
        manageResponse(res, result, error, next);
    },

    /**
     * Récupérer un PNJ par son ID
     * Recovers an NPC by its ID.
     * @date 23/02/2024 - 21:12:50
     *
     * @async
     * @param {Object} req The Express request object.
     * @param {Object} res The Express response object.
     * @param {Function} next The next middleware function.
     */
    async recoverNpcById(req, res, next) {
        const npcId = parseInt(req.params.id);
        const { error, result } = await npcDatamapper.getNpcById(npcId);
        manageResponse(res, result, error, next);
    }
};

module.exports = npcController;
