const { manageResponse } = require("../helper/controllerHelper.js");
const { eventDatamapper, monsterDatamapper, npcDatamapper, characterDatamapper, shopDatamapper } = require("../datamapper");

/**
 * Contrôleur pour la gestion des événements --
 * Controller for handling events
 * 
 * @namespace EventController
 */
const eventController = {
    /**
     * Récupère un événement aléatoire et gère les réponses en fonction de son type --
     * Get a random event and handle answers depending on his type
     *
     * @async
     * @function getRandomEvent
     * @memberof EventController
     */
    async getRandomEvent(req, res, next) {
        let { error, result } = await eventDatamapper.getRandomEvent();
        console.log('result event : ', result);

        const event = result[0];

        if (event.type === 'battle') {
            let { error: errorMonster, result: resultMonster } = await monsterDatamapper.getMonsterById(event.monster_id);
            event.monster = resultMonster;
            manageResponse(res, event, errorMonster, next);
        } else if (event.type === 'encounter') {
            let { error: errorEncounter, result: resultEncounter } = await npcDatamapper.getNpcById(event.npc_id);
            event.npc = resultEncounter;
            manageResponse(res, event, errorEncounter, next);
        } else {
            console.log('aucun événement trouvé !');
        }
    }

/*
    async getBattle(req, res, next) {
        const monsterId = req.body.monster_id;
        let { error, result } = await eventDatamapper.getBattle(monsterId);
        manageResponse(res, result, error, next);
    },

    async getEncounter(req, res, next) {
        const npcId = req.body.npc_id;
        let { error, result } = await eventDatamapper.getEncounter(npcId);
        manageResponse(res, result, error, next);
    },

    async getBattleReward(req, res, next) {
        console.log('req.body', req.body);
        const monsterId = parseInt(req.body.monster_id);
        const userId = parseInt(req.body.user_id);
        const { error: characterError, result: characterResult } = await characterDatamapper.getCharacterByUserId(userId);
        const { error: monsterError, result: monsterResult } = await monsterDatamapper.getMonsterById(monsterId);
        console.log(characterResult, monsterResult);
        const reward = Math.floor(Math.random() * (monsterResult.coin_max - monsterResult.coin_min + 1)) + monsterResult.coin_min;
        console.log(reward);
        characterResult.weapon = await shopDatamapper.getWeaponById(characterResult.weapon_id);
        characterResult.armor = await shopDatamapper.getArmorById(characterResult.armor_id);

        characterResult.purse = characterResult.purse + reward;

        let { error, result } = await characterDatamapper.updateCharacter(characterResult);
        manageResponse(res, result, error, next);
    }
*/
};

module.exports = eventController;