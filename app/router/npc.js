const { Router } = require('express');
const { npcController } = require('../controller');

const { isMember } = require('../middleware/security.js'); // import des fonctions vérification de rôles

const router = Router();

router.get('/', isMember, npcController.getAllNpc); // afficher tous les Personnage non joueur
router.post('/:id', isMember, npcController.getNpcById); // afficher en détail un personnage non joueur sélectionné

module.exports = router;