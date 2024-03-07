# A la Recherche de la Gaufre Perdue - Partie BackEnd

## Intro

Bienvenue à toutes les petites gaufres curieuses

## Présentation

Partez à l’aventure dans de terribles et mystérieux donjons, découvrez les sucrés... secrets autour de la tant convoitée Gaufre perdue et affrontez les ennemis vous barrant la voie jusqu’à elle !

## Liste des routes

|Nom|URL|GET|POST|PATCH|DELETE|
|--|--|--|--|--|--|
|Accueil|/|accéder à la page d'accueil|-|-|-|
|Inscription|/user/signup|accéder au formulaire d'inscription|Remplir le formulaire pour créer son compte|-|-|
|Connexion|/user/signin|Récupérer le formulaire de connexion|Se connecter|-|-|
|Admin|/admin|Accéder à la page Admin|-|-|-|
|Admin|/admin/user/:id|-|-|Modifier un utilisateur|Supprimer un utilisateur|
|Admin|/admin/monster/:id|-|-|Modifier un monstre|Supprimer un monstre|
|Profil|/user|Accéder à sa page profil|-|Modifier ses informations personnelles|Supprimer son compte|
|Introduction|/story|Accéder au synopsis du jeu|-|-|-|
|Création Personnage|/create-character|Accéder à la création de personnage|Ajouter un personnage|-|-|
|Village|/town|Accéder à la page du village|-|-|-|
|Village|/town/shop|Accéder au marchand|-|Modifier la liste des objets en rafraîchissant|-|
|Village|/town/character|Accéder au personnage|-|-|-|
|Village|/town/event|Accéder à un événement|-|-|-|
|Village|/town/event/encounter|Déclenchement d'un événement 'Rencontre'|-|-|-|
|Village|/town/event/battle|Déclenchement d'un événement 'Combat'|-|-|-|
|A propos|/about|Accéder à la page 'à propos', 'crédits' et 'contact'|-|-|-|

## User stories

Les user stories vont résumer la liste des fonctionnalités présentes dans les différentes pages.

Un visiteur a moins de droits qu'un utilisateur.

Un utilisateur peut créer un personnage alors qu'un visiteur non.

Un administrateur a plus de droits qu'un utilisateur.

Un administrateur peut modifier les utilisateurs et les monstres.

Product backlog (ensemble des user stories) :

|en tant que|je veux|afin de|
|--|--|--|
|visiteur|accéder à la page d'accueil|d'accéder au site|
|visiteur|créer un compte|répondre au sondage|
|utilisateur|se connecter|accéder à son compte|
|utilisateur|créer un personnage|commencer l'aventure|
|utilisateur|lancer une exploration|progresser dans l'histoire|
|utilisateur|revenir au village|restaurer le personnage|
|utilisateur|aller au marchand|acheter de l'équipement|
|utilisateur|supprimer son compte|supprimer ses informations personnelles|
|utilisateur|modifier son profil|changer ses informations personnelles|
|utilisateur|supprimer son personnage|Jouer une autre partie|

## Modules

### Back

express, express-session, pg, dotenv, cors, bcrypt, joi, debug, *jsonwebtoken*

### Front

vite

## Commande Sqitch

```bash
sqitch init orpg --top-dir migrations --engine pg
```

```bash
sqitch config --user engine.pg.client psql
```

```bash
sqitch config --bool deploy.verify true
```

```bash
sqitch add 1.create_tables -n "création des tables"
```

## Techno utilisé

Outil de documentation : JSDoc Generator.\


```bash
sudo nano /etc/postgresql/15/main/pg_hba.conf

systemctl restart postgresql

nano ~/.bashrc

source ~/.bashrc
```

## Mise en place des fonctions SQL

|Description|Utilisation|
|--|--|
|find_all|Trouver toutes les données d'une table|
|find_by_id|Trouver un élément par son id|
|add_user|Ajouter un utilisateur|
|verify_user|Vérifier un utilisateur|
|get_user|Trouver un utilisateur avec son id|
|get_random_equipment|Afficher 3 équipements (armure et arme) aléatoirement|
|get_equipment_by_id|Afficher un équipement (armure et arme)|
|get_characters| Affiche le/les différent(s) personnage(s) de l'utilisateur|
|get_one_random_event|Sélectionne un événement aléatoirement|
|get_all_monsters|Afficher tous les monstres|
|get_monster_by_id|Trouver un monstre avec son id|
|get_all_npc|Afficher tout les personnage non joueur|
|get_npc_by_id|Trouver un pnj avec son id|
|||
|||
||Récupérer les infos utilisateur et des monstres pour l'admin|
|||

```bash

```