const { Router } = require('express');
const { userController } = require('../controller');
const characterRouter = require('./character.js');
const { isMember } = require('../middleware/security.js'); // import des fonctions vérification de rôles

//Import des schémas
const { signinSchema, signupSchema } = require('../middleware/validation/schemas.js');

//Middleware de validation
const { validate } = require ('../middleware/validation/validate.js');

const router = Router();

// Accueil Utilisateur
router.get('/', (req, res) => {
    res.send('Page utilisateur');
});

router.get("/", isMember, userController.getCurrentUser);

router.post("/signup",validate(signupSchema),userController.signup); //créer un compte
router.post("/signin", validate(signinSchema),userController.signin); //se connecter

router.get("/:id", isMember, userController.getCurrentUser);
router.patch("/:id", isMember, validate(signupSchema), userController.updateUser); //modifier son profil en se référent au signupSchema
router.delete("/:id", isMember, validate(signupSchema), userController.deleteUser); //modifier son profil en se référent au signupSchema

// Chemins vers d'autres routes
router.use('/character', characterRouter); // chemin vers character.js

module.exports = router;