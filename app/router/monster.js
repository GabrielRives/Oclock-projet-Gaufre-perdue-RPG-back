const { Router } = require('express');
const { monsterController, eventController } = require('../controller');

const { isAdmin, isMember } = require('../middleware/security.js'); // import des fonctions vérification de rôles

const router = Router();


router.get('/', isMember, monsterController.getAllMonsters);
router.post('/:id',isMember, monsterController.getMonsterById);

router.patch('/:id', isAdmin, monsterController.updateMonster);
router.delete('/:id', isAdmin, monsterController.deleteMonster);


module.exports = router;
