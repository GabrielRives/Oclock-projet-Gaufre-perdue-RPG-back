const { Router } = require('express');
const { eventController, monsterController, npcController } = require('../controller');

const {  isMember } = require('../middleware/security.js'); // import des fonctions vérification de rôles

const router = Router();

router.get('/', isMember, eventController.getRandomEvent);

router.get('/monster', monsterController.getAllMonsters); // Obtenir tous les monstres
router.get('/monster/one/:id', monsterController.recoverMonsterById); // Récupérer un monstre par son id
router.get('/monster/random', monsterController.recoverRandomMonster); // Récupérer un monstre aléatoirement
router.get('/monster/replica', monsterController.getRandomReplicaOfMonster); // Récupérer une réplique aléatoire de monster

router.get('/npc', npcController.getAllNpc); // Obtenir tous les Personnage non joueur
router.get('/npc/one/:id', npcController.recoverNpcById); // Récupérer un personnage non joueur par son id
router.get('/npc/random', npcController.getRandomNpcById); // Obtenir un personnage non joueur aléatoirement
router.get('/npc/replica/:id', npcController.getReplicaOfNpc); // Obtenir la réplique du personnage non joueur

router.patch('/reward', isMember, eventController.getBattleReward); // UPDATE purse avec réussite (ou non) de l'event

module.exports = router;
