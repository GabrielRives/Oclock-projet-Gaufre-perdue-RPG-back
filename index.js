const dotenv = require('dotenv') //Gestion des données du .env
dotenv.config()

const express = require('express');
const session = require('express-session');
const cors = require('cors'); //Sécurité

const router = require('./app/router');

const app = express();

/**
 * Autorisation de requête sur le port 3000
 * @date 06/02/2024 - 15:14:37
 *
 * @type {{ origin: string; optionSuccessStatus: number; }}
 */
const corsOptions = {
    origin: 'http://localhost:8080',
    optionSuccessStatus: 200
};

// Mise en place d'une SESSION
app.use(session({
    secret: process.env.APP_SECRET,
    resave: true, // sauvegarde automatique de la session en fin de requête
    saveUninitialized: true, // sauvegarde de la session même si elle est vide.
    cookie: {
      secure: false // true c'est uniquement si on a un certificat ssl pour avoir https
    }
}));

app.use(cors(corsOptions));

app.use(express.json());

app.use(router);

app.set('PORT', process.env.PORT || 3001);
app.set('URL', process.env.BASE_URL || 'http://localhost');

app.listen(app.get('PORT'), () => {
    console.log(`Listening on ${app.get('URL')}:${app.get('PORT')}`);
});
