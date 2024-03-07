const { manageResponse } = require("../helper/controllerHelper.js");
const { shopDatamapper, characterDatamapper } = require("../datamapper");
const characterController = require("./character.js");

/**
 * Contrôleur pour la gestion des boutiques --
 * Controller for handling shop
 * 
 * @namespace ShopController
 */

const shopController = {
    /**
     * Récupère toutes les armes --
     * Get all weapons
     *
     * @async
     * @function getAllWeapons
     * @memberof ShopController
     */
    async getAllWeapons(req, res, next) {
        const { error, result } = await shopDatamapper.getAllWeapon();
        manageResponse(res, result, error, next);
    },

    /**
     * Récupère toutes les armures --
     * Get all armors
     *
     * @async
     * @function getAllArmors
     * @memberof ShopController
     */
    async getAllArmors(req, res, next) {
        const { error, result } = await shopDatamapper.getAllArmor();
        manageResponse(res, result, error, next);
    },

    /**
     * Récupère une arme par son identifiant --
     * Get a weapon by his id
     *
     * @async
     * @function getWeaponById
     * @memberof ShopController
     */
    async getWeaponById(req, res, next) {
        const { id } = req.params;
        const { error, result } = await shopDatamapper.getWeaponById(id);
        manageResponse(res, result, error, next);
    },

    /**
     * Récupère une armure par son identifiant--
     * Get an armor by his id
     *
     * @async
     * @function getArmorById
     * @memberof ShopController
     */
    async getArmorById(req, res, next) {
        const { id } = req.params;
        const { error, result } = await shopDatamapper.getArmorById(id);
        manageResponse(res, result, error, next);
    },

    /**
     * Récupère l'équipement du personnage --
     * Get chracter's equipements
     *
     * @async
     * @function getRandomEquipment
     * @memberof ShopController
     */
    async getRandomEquipment(req, res, next) {

        const { classId } = req.body;
        console.log('class id :', classId);

        let results = []; // On place un tableau vide des résultats à envoyer
        let securityIndex = 0;
        let error; //sert à rien mais évite le bug plus bas

        while(results.length < 3 && securityIndex < 50) {
        let nb = Math.floor(Math.random()*100); // Un nombre aléatoire entre 0 et 100

        if (nb <= 50) {
            let { error, result } = await shopDatamapper.getRandomArmor(classId); // Armure Random
            result[0].category = 'armor';
            if(error) {
                next(error);
                return;
            } else {
                if (results.includes(result[0])) {
                    securityIndex++;
                } else {
                results.push(result[0]);
                }
            }

        } else if (nb <= 100) {
            let { error, result } = await shopDatamapper.getRandomWeapon(classId); // Arme Random
            result[0].category = 'weapon';
            if(error) {
                next(error);
                return;
            } else {
                if (results.includes(result[0])) {
                    securityIndex++;
                } else {
                results.push(result[0]);
                }
            }
        } else {
            console.log('chiffre pas bon :', nb);
            break;
        }
    }
        if(securityIndex === 50) {
            console.log('diversité d\'équipements problématiques');
            return error;
        } else {
        console.log('results :', results);
        manageResponse(res, results, error, next);
        }
    },
    

    /**
     * Achète un équipement (en construction) --
     * Buy an equipment (in progress)
     *
     * @async
     * @function buyEquipment
     * @memberof ShopController
     */
    async buyEquipement(req, res, next) {
        console.log(req.body);
        const equipment = req.body.selectedItem;
        const userId = req.body.user_id;
        const { error, result } = await characterDatamapper.getCharacterByUserId(userId);
        let newEquipment;
        switch (equipment.category) {
            case 'weapon':
                newEquipment = await shopDatamapper.getWeaponById(equipment.id);
                break;
            case 'armor':
                newEquipment = await shopDatamapper.getArmorById(equipment.id);
                break;
            default:
                console.error('aucun équipement sélectionné');
        }
        console.log(result);
        let price = newEquipment.result.price;
        if(result.purse >= parseInt(price)) {
            result.purse = result.purse - price;
        } else {
            console.error('Montant insuffisant');
            next(error);
        }
        let characterResult, characterError;
        let character;
        switch (equipment.category) {
            case 'weapon':
                result.weapon_id = newEquipment.result.id;
                characterResult = await characterDatamapper.updateCharacter(result);
                let { error: armorError, result: armorResult } = await shopDatamapper.getArmorById(result.armor_id);
                character = characterResult.result;
                character.weapon = newEquipment.result;
                character.armor = armorResult;

                break;
            case 'armor':
                result.armor_id = newEquipment.result.id;
                characterResult = await characterDatamapper.updateCharacter(result);
                let { error: weaponError, result: weaponResult } = await shopDatamapper.getWeaponById(result.weapon_id);
                character = characterResult.result;
                character.armor = newEquipment.result;
                character.weapon = weaponResult;

                break;
            default:
                console.error('erreur');
        }

        console.log('result des équipements :', characterResult);
        manageResponse(res, character, characterError, next);
    },

    
    /**
     * Achète une armure
     * @date 26/02/2024 - 20:12:16
     *
     * @async
     * @param {Object} req The Express request object.
     * @param {Object} res The Express response object.
     * @param {Function} next The next middleware function.
     * @returns {Object} The response object.
     */
    async buyArmor(req, res, next) {
        const body = req.body;
        console.log("req.body", req.body);
        const { error, result } = await shopDatamapper.buyArmor(body);
        manageResponse(res, result, error, next);
    },

    /**
     * Achète une arme (en construction) --
     * Buy a weapon (in progress)
     *
     * @async
     * @function buyWeapon
     * @memberof ShopController
     */
    async buyWeapon(req, res, next) {
        const body = req.body;
        console.log("req.body", req.body);
        const { error, result } = await shopDatamapper.buyWeapon(body);
        manageResponse(res, result, error, next);
    },

    /**
     * Achète un parchemin de statistique --
     * Buy a scroll of stat
     *
     * @async
     * @function buyStat
     * @memberof ShopController
     */
    async buyStat(req, res, next) {
        console.log(req.body);
        const stat = req.body.scroll.selectedScroll;
        const userId = req.body.user_id;
        const { error, result } = await characterDatamapper.getCharacterByUserId(userId);
        let price = req.body.scroll.price;
        if(result.purse >= parseInt(price)) {
            result.purse = result.purse - price;
        } else {
            error('Montant insuffisant');
        }
        switch (stat) {
            case 'strength':
                result.strength = result.strength + 1;
                break;
            case 'dexterity':
                result.dexterity = result.dexterity + 1;
                break;
            case 'intelligence':
                result.intelligence = result.intelligence + 1;
                break;
            default:
                console.error('erreur de choix de stat');
        }
        const { error : characterError, result : characterResult} = await characterDatamapper.updateCharacter(result);
        manageResponse(res, characterResult, characterError, next);
    }
};

module.exports = shopController;
