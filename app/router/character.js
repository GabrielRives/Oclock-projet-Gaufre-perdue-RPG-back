const { Router } = require('express');
const { isMember } = require('../middleware/security.js'); // import des fonctions vérification de rôles

const characterController = require('../controller/character');

const router = Router();

router.post("/", isMember, characterController.getCharacter);

router.get("/create", isMember, characterController.getAllClass);
router.post("/create", isMember, characterController.addCharacter);

router.patch("/update", isMember, characterController.updateCharacter);
router.delete("/delete", isMember, characterController.deleteCharacter);

module.exports = router;
