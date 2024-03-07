const { Router } = require('express');

const adminRouter = require('./admin.js');
const userRouter = require('./user.js');
const townRouter = require('./town.js');

const { isAdmin, isMember } = require('../middleware/security.js'); // import des fonctions vérification de rôles

const errorHandler = require('../middleware/error/errorHandler.js');

const router = Router();

// Chemins vers d'autres routes
router.use('/admin', isAdmin, adminRouter); // chemin vers admin.js
router.use('/user', userRouter); // chemin vers user.js
router.use('/town', isMember, townRouter); // chemin vers town.js

router.use(errorHandler); // Gestion des erreur 404 et 500

module.exports = router;