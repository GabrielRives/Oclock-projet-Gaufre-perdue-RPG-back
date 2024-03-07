const { Router } = require('express');
const { shopController } = require('../controller');
const { isMember } = require('../middleware/security.js'); // import des fonctions vérification de rôles

const router = Router();

//? AFFICHAGE
// router.post('/', shopController.getRandomArmor); // Accueil SHOP ARMURE
// router.post('/', shopController.getRandomWeapon); // Accueil SHOP ARME
router.post('/', isMember, shopController.getRandomEquipment); // Accueil SHOP ARME & ARMURE

//? RAFRAICHIR
router.post('/refresh', isMember, shopController.getRandomEquipment); //!!Rafraîchir le magasin -- Pas vraiment besoin
//router.post('/refresh', shopController.getRandomWeapon);
//router.post('refresh', shopController.getRandomArmor);
//router.patch('/', shopController.newEquipmentAfterRefresh); //!!Modifier la liste des objets -- Peut etre plus tard pour l'admin

//? ACHATS
router.patch('/buy/equipment', isMember, shopController.buyEquipement); //UPDATE weapon_id || armor_id + stat
router.patch('/buy/stat', isMember, shopController.buyStat); // UPDATE stat personnage

module.exports = router;