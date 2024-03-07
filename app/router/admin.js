const { Router } = require('express');
const { monsterController, userController } = require('../controller');
const monsterRouter = require('./monster.js');
const userRouter = require('./user.js');

const { isAdmin } = require('../middleware/security.js'); // import des fonctions vérification de rôles

const router = Router();

router.get("/", isAdmin, userController.getAllUsers);
router.get("/", isAdmin, monsterController.getAllMonsters);

// Chemins vers d'autres routes
router.use('/user', userRouter); // Chemin vers user.js
router.use('/monster', monsterRouter); // Chemin vers monster.js

module.exports = router;
