/**
 * Retourne la réponse en vérifiant s'il y a une erreur
 * @param {*} res réponse d'express
 * @param {*} result données à transmettre
 * @param {*} error erreur éventuelle
 * @param {*} next middleware pour déclencher le système de gestion d'erreur d'express
 */
const manageResponse = function (res,result,error,next) {
    if(error){
        next(error);
    }
    else{
        res.json(result);
    }
};

module.exports = { manageResponse };