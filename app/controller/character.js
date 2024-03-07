const { manageResponse } = require("../helper/controllerHelper.js");

const { APIError } = require("../middleware/error/APIError.js");

/**
 * Handle characters controller
 * 
 * @namespace CharacterController
 */
const { characterDatamapper, shopDatamapper, userDatamapper } = require("../datamapper");

/**
 * Contrôleur pour la gestion des personnages --
 * Controller for handling characters
 * 
 * @namespace CharacterController
 */
const characterController = {
    /**
     * Récupère toutes les classes de personnages -- 
     * Get all classes of characters
     *
     * @async
     * @function getAllClass
     * @memberof CharacterController
     */
    async getAllClass(req, res, next) {
        const { error, result } = await characterDatamapper.getAllClass();

        manageResponse(res, result, error, next);
    },

    /**
     * Ajoute un nouveau personnage --
     * Add a new character
     *
     * @async
     * @function addCharacter
     * @memberof CharacterController
     */
    async addCharacter(req,res,next) {
        let classId = req.body.class_id;

        console.log("classId :", classId);

        let baseWeapon, baseArmor;
        
           switch (parseInt(classId)) {
            case 1:
                baseWeapon = 1;
                baseArmor = 1;
                break;
            case 2:
                baseWeapon = 2;
                baseArmor = 2;
                break;
            case 3:
                baseWeapon = 3;
                baseArmor = 3;
                break;
            default:
                console.error('aucune classe n\'a été choisie');
        }

        const { error: classError, result: classResult } = await characterDatamapper.getClassById(classId);

        console.log('classResult : ', classResult);
        console.log('classResult la force : ', classResult.strength);
        if(classError) {
            console.log('aucune classe sélectionné');
            next(classError);
        }

        let characterData = {
            nickname : req.body.nickname,
            purse : 0,
            moral : 0,
            user_id : req.body.user_id,
            class_id : classId,
            strength : classResult.strength,
            dexterity : classResult.dexterity,
            intelligence : classResult.intelligence,
            weapon_id : baseWeapon,
            armor_id : baseArmor,
            intro_is_played : false,
        };

        const { error, result } = await characterDatamapper.addCharacter(characterData);

        console.log('character Data :', characterData);
        let { error: weaponError, result: weaponResult } = await shopDatamapper.getWeaponById(characterData.weapon_id);
        let { error: armorError, result: armorResult } = await shopDatamapper.getArmorById(characterData.armor_id);
        
        characterData.weapon = weaponResult;
        characterData.armor = armorResult;
        
        console.log('weaponResult :', weaponResult);
        manageResponse(res, characterData, weaponError, armorError, error, next);
            
    },

    /**
     * Récupère un personnage par identifiant d'utilisateur --
     * Get a character by the user's id
     *
     * @async
     * @function getCharacter
     * @memberof CharacterController
     */
    async getCharacter(req, res, next) {
        const userId = req.params.id;
        
        const { error: characterError, result: characterResult } = await characterDatamapper.getCharacter(userId);
        console.log('character :', characterResult);

        const character = characterResult;

        let { error: weaponError, result: weaponResult } = await shopDatamapper.getWeaponById(character.weapon_id);
        let { error: armorError, result: armorResult } = await shopDatamapper.getArmorById(character.armor_id);
        console.log('weaponResult :', weaponResult);
        console.log('character final :', character);
        manageResponse(res, characterResult, weaponResult, armorResult, characterError, weaponError, armorError, next);
    },

    /**
     * Met à jour un personnage existant --
     * Update an existing character
     *
     * @async
     * @function updateCharacter
     * @memberof CharacterController
     */
    async updateCharacter(req, res, next) {
        const id = parseInt(req.params.id);
        const body = req.body;

        const { error, result } = await characterDatamapper.updateCharacter(id, body);  
        
        manageResponse(res, result, error, next);
    },

    /**
     * Supprime un personnage par identifiant d'utilisateur --
     * Delete a character by the user's id
     *
     * @async
     * @function deleteCharacter
     * @memberof CharacterController
     */
    async deleteCharacter(req, res, next) {
        const id = parseInt(req.params.id);

        const { error, result } = await characterDatamapper.deleteCharacter(id);

        manageResponse(res, result, error, next);
    },
};

module.exports = characterController;