const jwt = require ('jsonwebtoken');

const jwtUtils = {
    /**
    * Génère un token à partir des données de l'utilisateur --
    * Generate a token based on the infos of a user
    *
    * @function encode
    * @memberof JWTUtils
    * @param {*} user - Données de l'utilisateur
    * @returns {string} - Retourne un token
    */
    encode(user){
        return jwt.sign(user, process.env.JWT_SECRET);
    },
    /**
    * Déchiffre un token et renvoie le résultat ou une erreur --
    * Decipher a token and send the result of an error
    *
    * @function decode
    * @memberof JWTUtils
    * @param {string} token - Token à déchiffrer
    * @returns {{result: *, error: Error | undefined}} - Renvoie un objet contenant le résultat du déchiffrement et une éventuelle erreur
    */
    decode(token){
        let result;
        let error;
        try{
            result = jwt.verify(token,process.env.JWT_SECRET);
        }
        catch(err){
            error = new Error("petit malin tu essaies de pirater mon site, je vais envoyer ton ip à la police russe");
        }
        return {result,error};
    }
};

module.exports = jwtUtils;