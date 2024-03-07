BEGIN;

TRUNCATE
"character_has_event",
"npc_has_quote",
"monster_has_quote",
"character",
"event",
"quote",
"npc",
"monster",
"class",
"weapon",
"armor",
"user";

-- Seeding pour public.user ''
--INSERT INTO "user" (nickname, password, mail, firstname, lastname, birthdate, role)
--VALUES 
--    ('Gaufre', 'Azerty1', 'tedy.berthe@oclock.school', 'Gaufre', 'Perdue', '2024-01-01', 'admin');


-- Seeding pour la table "weapon"
INSERT INTO "weapon" (label, description, physical_damage, magical_damage, critical_damage, critical_rate, object_level, price, type)
VALUES

    -- Guerrier
    ('Épée en mousse', 'Aussi douce qu’une pluie de confettis, chatouille plus qu’elle ne blesse', 5, 0, 1, 0, 1, 50, 1), -- arme de départ guerrier
    ('Masse-pain', 'Une masse qui distribue des pains, ça évite de se salir les mains ', 7, 0, 10, 0, 1, 100, 1), -- guerrier
    ('Pic à choc', 'Pour plus d’énergie dès la baston du matin ', 8, 0, 5, 10, 1, 100, 1), -- guerrier
    ('Pic à gaufre', 'Un épieu qui ressemble plus à un cure-dent qu’à une arme. Elle est si fine et si fragile que vous avez peur de la casser en la tenant.', 8, 0, 5, 10, 1, 100, 1), -- guerrier
    ('Épée rimée', 'A utiliser de préférence jusqu’à une semaine après la date inscrite sous le pommeau ', 7, 0, 3, 10, 1, 100, 1), -- guerrier 
    ('Épée à la vanille', 'Une épée qui dégage un parfum de vanille, et qui endort les adversaires.', 10, 0, 10, 10, 1, 150, 1), -- guerrier
    ('La Hache à gaufres', 'Une hache à deux mains qui a la forme d’un fer à gaufres, et qui imprime des motifs sur ses victimes.', 15, 1, 15, 20, 2, 200, 1), -- guerrier
    ('La Hallebarbapapa', 'Laisse des filaments roses et sucrés dans les plaies béantes infligées aux ennemis.', 18, 3, 13, 10, 2, 200, 1), -- guerrier
    ('Fléau d’oignon caramélisé', 'Un fléau d’armes qui fait pleurer les ennemies.', 25, 3, 25, 30, 3, 250, 1), -- guerrier
    ('Lance farine', 'Une hallebarde qui crée un nuage de farine à chaque coup, et qui aveugle ou étouffe les ennemis.', 30, 5, 20, 20, 3, 300, 1), -- guerrier
    ('Zweihanbeurre', 'Une épée lourde à deux mains qui tranche tout avec facilité.', 35, 2, 15, 20, 3, 300, 1), -- guerrier
    ('Le Hammeringue', 'Un marteau de guerre aussi délectable que redouté.', 33, 4, 17, 20, 3, 300, 1), -- guerrier
    
    --Mage
    ('Bout de bois', 'Découvert par hasard dans une flaque boueuse, semble plus approprié pour un feu de camp que pour la magie.', 0, 5, 1, 0, 1, 50, 2), -- arme de départ mage
    ('Baguette à la levure', 'Une baguette qui permet de lancer des sorts de gonflement ou de fermentation.', 0, 7, 5, 10, 1, 100, 2), -- Mage
    ('Le french baguette', 'Efficace, mais ne fonctionne qu’en portant un béret et en démarrant les incantations par "hon hon  le croissooont!".', 1, 6, 10, 10, 1, 100, 2), -- Mage
    ('Bâton de sucette', 'Un bâton de sortilège qui lance une boule recouverte de sucre glace, et qui colle aux armures ennemies.', 2, 10, 15, 10, 2, 150, 2), -- Mage    
    ('Bâton à la bière', 'Un bâton qui est fait avec une bouteille de bière, et qui permet de lancer des sorts de fermentation ou d’ivresse.', 2, 10, 15, 10, 1, 150, 2), -- Mage
    ('Le Sceptropézienne de Tahrte', 'Un Sceptre moelleux ayant appartenu au célèbre magicien Tahrte.', 1, 17, 11, 10, 2, 200, 2), -- Mage
    ('Sceptre à la gaufrette', 'Un Sceptre qui permet de lancer des sorts de croustillant ou de friable, en fonction de la pression exercée sur la gaufrette qui le surmonte.', 3, 15, 10, 10, 2, 200, 2), -- Mage
    ('Livre de recettes', 'Un livre qui contient des recettes de gaufres, et qui permet de lancer des sorts de cuisson ou de gourmandise.', 1, 20, 15, 10, 2, 200, 2), -- Mage
    ('Livre de sorts-baies sauvages', 'Un livre qui contient des sortilèges interdis d’invocation de fruits rouges.', 1, 22, 15, 20, 3, 250, 2), -- Mage
    ('Livre de sortiliègeois de Djoc Olat', 'Un livre qui contient des sortilèges dessertiques d’une grande fraîcheur.', 1, 22, 22, 10, 3, 250, 2), -- Mage
    ('Grimoire crémeux', 'Un grimoire qui contient des sorts de douceur ou de fraîcheur.', 2, 25, 15, 20, 3, 250, 2), -- Mage
    ('Grimoire aux mille-feuilles', 'Très long à parcourir de bout en bout...', 1, 33, 15, 20, 3, 300, 2), -- Mage
    ('Calice à la liqueur', 'Un calice qui contient une liqueur de gaufre, et qui permet de lancer des sorts de feu ou d’eau, en fonction de la température de la liqueur.', 3, 30, 20, 20, 3, 300, 2), -- Mage

    --Rôdeur
    ('Lance-pierre', 'Subtilisé à un enfant des rues, il n’a plus que ses yeux pour pleurer cheh !', 3, 0, 3, 1, 1, 50, 3), -- arme de départ rôdeur
    ('Sarbacane à sucre', 'Une sarbacane qui tire des billes de sucre, et qui provoquent des caries ou des allergies', 6, 0, 7, 10, 1, 100, 3), -- rôdeur
    ('Dague au beurre', 'Un couteau de lancé qui est enduit de beurre, et qui glisse entre les mailles des armures.', 7, 0, 5, 10, 1, 100, 3), -- rôdeur
    ('La Taga-dague à la fraise', 'Un couteau de lancé à la lame de sucre cristallisé.', 8, 1, 9, 0, 1, 100, 3), -- rôdeur
    ('Dagaufre', 'Une dague qui a un manche en forme de gaufre, et qui est cachée dans un étui en forme de gaufrier. Elle peut surprendre les ennemis ou se coincer dans l’étui.', 8, 1, 10, 10, 2, 150, 3), -- rôdeur
    ('Sarbacanelé à sarbacanelle enrichie ', 'Une arme bien trop épaisse et délicieuse aux munitions bien trop volatiles...', 11, 2, 11, 10, 2, 150, 3), -- rôdeur
    ('Arc à la cannelle', 'Un arc qui tire des flèches aromatisées à la cannelle, et qui provoquent des éternuements.', 10, 3, 15, 10, 2, 150, 3), -- rôdeur
    ('Arc Amasylum', 'Chaque flèche décochée augmente le risque d’apparition d’un guerrier lunatique déguisé en chauve-souris', 12, 2, 18, 10, 2, 150, 3), -- rôdeur
    ('Boomgaufre', 'Un boomerang qui a la forme et le motif d’une gaufre, et qui revient toujours vers son lanceur, sauf s’il est attrapé par un gourmand. Il peut assommer les ennemis ou les faire saliver.', 12, 5, 20, 10, 3, 200, 3), -- rôdeur
    ('Gaufrahawk', 'Un tomahawk qui a une lame en forme de gaufre, et qui est tranchant et croustillant. Il peut couper les armures ou les chairs, ou se briser en morceaux.', 15, 3, 20, 20, 3, 250, 3), -- rôdeur
    ('Bombe à gaufre', 'Une bombe qui ressemble à une gaufre fourrée, et qui explose en projetant du sirop, du chocolat, de la chantilly et des fruits. Elle peut blesser les adversaires ou les rendre collants et sucrés', 18, 5, 20, 10, 3, 300, 3), -- rôdeur
    ('Fouet à la chantilly', 'Un fouet qui est garni de chantilly, et qui aveugle les ennemis.', 23, 3, 25, 20, 4, 300, 3), -- rôdeur
    ('Bombe au nappage brûlant', 'Une bombe largement utilisée pendant l’antique guerre du Diète-Nam, brûle et caramélise les ennemis dans une zone', 25, 10, 15, 20, 4, 350, 3), -- rôdeur
    ('Arc Atrekar à double cour-bugne', 'Un arc redoutable né de la fusion de deux pâtisseries de combat célèbres.', 28, 2, 20, 20, 5, 400, 3), -- rôdeur
    ('Shurigaufre', 'Un shuriken en forme de gaufre et qui inflige des blessures sucrées et collantes.', 30, 5, 25, 20, 5, 500, 3); -- rôdeur

    -- ('', '', , , , , ), --


-- Seeding pour la table "armor"
INSERT INTO "armor" (label, description, life_point, physical_defense, magical_defense, object_level, price, type)
VALUES

    -- Guerrier
    ('Casque cabossé', 'Un casque bosselé, rayé et déformé, et ne vous protège plus la tête. Il vous donne un air stupide et ridicule.', 5, 3, 0, 1, 50, 1), -- armure de départ guerrier
    ('Boîte de conserve', 'Un équipement de protection complet qui donne l’impression d’être enfermé. Il est si étroit que vous ne pouvez ni voir ni entendre correctement. Il vous fait transpirer à grosses gouttes, et vous empêche de respirer normalement. Il vous donne aussi un mal de crâne terrible.', 8, 5, 1, 1, 100, 1), -- guerrier
    ('Le Welcome heaume', 'Sans doute  le casque le plus accueillant que vous pourrez vous procurer', 9, 3, 2, 1, 50, 1), -- guerrier
    ('Le Bisc-heaume', 'Protège entre autre des pains et des envies d’épicé', 7, 4, 2, 1, 50, 1), -- guerrier
    ('Gaufrocu', 'Un bouclier en forme de gaufre, son odeur attire les enemies et peuvent rester coller en le touchant' ,10, 10, 3, 2, 150, 1), -- guerrier
    ('Rondache Oukett', 'Un bouclier rond et perlé de sucre' ,9, 11, 4, 2, 150, 1), -- guerrier
    ('La Sacristarge', 'Un bouclier tressé et parsemé de noix... un concept original' ,15, 8, 5, 2, 150, 1), -- guerrier
    ('Cuiwaffle', 'une cuirasse en métal qui a la forme d’une gaufre. Elle donne un bonus de défense, mais aussi un malus de souplesse, car elle rend le personnage très rigide et inconfortable. Elle est aussi très chaude et sujette à la rouille, ce qui peut provoquer des irritations ou des infections. Elle peut aussi servir à griller des aliments sur son torse, mais cela peut être dangereux si elle s’enflamme.', 16, 15, 8, 3, 200, 1), -- guerrier
    ('Biscuirasse', 'une armure sèche et croustillante qu’on peut se procurer à peut près n’importe où ', 20, 13, 10, 3, 200, 1), -- guerrier

    -- Mage
    ('Cape déchiré', 'Une cape trouée, tachée et râpée, qui a subi les affres du temps et des combats. Elle ne vous tient plus chaud et vous donne un air misérable et négligé.', 5, 0, 3, 1, 50, 2), -- armure de départ mage
    ('Chapeau fraise', 'Une fraise géante, elle est si grande qu’elle peut être mise sur une tête. Si un mage la porte, elle renforce sa magie ainsi que ses points de vie', 10, 1, 5, 1, 100, 2), -- Mage
    ('Cape Outchino', 'Attention le port abusif de cette cape provoque des insomnies.', 8, 2, 4, 1, 100, 2), -- mage
    ('Chapkake de Tchiise', 'Un couvre-chef sucré au fromage tout à fait distingué', 13, 1, 6, 1, 100, 2), -- Mage
    ('Flémardo', 'Une amulette qui protège rarement sont utilisateurs', 12, 2, 7, 1, 100, 2), -- Mage
    ('Gaufrobe', 'Une robe en tissu qui ressemble à une gaufre géante. Elle donne un bonus de charisme, mais aussi un malus de discrétion, car elle rend le personnage très visible et appétissant. Elle peut aussi servir à nourrir les alliés en cas de famine, mais cela réduit sa durabilité.', 15, 3, 10, 2, 150, 2), -- Mage
    ('Chapeau des crèpes Ïh', 'Usé par le temps, ce chapeau de sorcier sert à imiter la mage Ïh ', 11, 5, 8, 2, 150, 2), -- Mage
    ('La Robe Retzel', 'Une robe de magicien qui croise souvent les bras.', 15, 8, 17, 3, 150, 2), -- Mage
    ('Capaufre', 'une cape en tissu qui a l’aspect d’une gaufre. Elle donne un bonus de camouflage, mais aussi un malus de charisme, car elle rend le personnage ridicule et repoussant. Elle est aussi très salissante et difficile à nettoyer, ce qui peut provoquer des infections ou des allergies. Elle peut aussi servir à se réchauffer en cas de froid, mais cela peut être dangereux si elle prend feu.', 17, 5, 15, 3, 200, 2), -- Mage
    ('Robe Rioche', 'Une robe bien aérée et moelleuse.', 20, 9, 13, 3, 200, 2), -- Mage
    
    -- Rôdeur
    ('Sandale trouée', 'Des scandales usées par les marches et les frottements. Elles sont éraflées, détendues, et ne vous soutient plus le pied. Elle vous donne un air pauvre et maladroit.', 5, 1, 1, 1, 50, 3), -- armure de départ rôdeur
    ('Les babûches de Nawel', 'Des souliers festifs et colorés qui ont cependant le défaut de refroidir les pieds plutôt que les réchauffer.', 7, 2, 2, 1, 100, 3), -- rôdeur
    ('Petit gilet en mad laine', 'Cousu dans l’haleine d’un mouton très énervé.', 6, 4, 2, 1, 100, 3), -- rôdeur
    ('Justaucorne de gazelle', 'Un justaucorps aux motifs de petits croissants de lune blancs.', 8, 8, 3, 1, 120, 3), -- rôdeur
    ('JustOgaufre', 'Un justaucorps qui est fait avec des gaufrettes fines, et qui offre une protection discrète contre les armes à distance, mais qui est aussi très sec et cassant.', 10, 5, 2, 1, 120, 3), -- rôdeur
    ('Gaufure', 'Des chaussures en cuir qui ont la forme de gaufres. Elles donnent un bonus de dextérité, mais aussi un malus de résistance, car elles rendent le personnage vulnérable aux morsures et aux piétinements. Elles peuvent aussi servir à lancer des projectiles croustillants sur les ennemis, mais cela n’est pas très efficace ni hygiénique.', 13, 8, 5, 2, 150, 3), -- rôdeur
    ('Gaufrolleur', 'des roller en bois qui ont la forme de gaufres. Ils donnent un bonus de mobilité, mais aussi un malus de stabilité, car ils rendent le personnage très rapide mais aussi très imprudent. Ils sont aussi très bruyants et inadaptés aux terrains accidentés, ce qui peut attirer l’attention des ennemis ou des pièges.', 15, 11, 8, 3, 200, 3), -- rôdeur
    ('Ganfrosucre', 'Des gants en laine qui ont la texture de gaufres. Ils donnent un bonus de chaleur, mais aussi un malus de précision, car ils rendent le personnage maladroit et engourdi. Ils peuvent aussi servir à étouffer les ennemis en leur enfonçant dans la bouche, mais cela peut être considéré comme un crime de guerre.', 18, 13, 11, 4, 250, 3), -- rôdeur
    ('Mitaine Saïmadas', 'Des mitaines importées du Sud qui vous donneront un bel accent..', 20, 11, 13, 4, 250, 3), -- rôdeur
    ('Les Gants Efferal', 'Des gants qui apaisent les migraines après des heures à crocheter des serrures ou fourrer des chaussons aux pommes', 22, 13, 9, 4, 250, 3); -- rôdeur
    
    -- (' ', '  ', , , , ), --


-- Seeding pour la table "class"
INSERT INTO "class" (label, description, weapon_id, armor_id, strength, dexterity, intelligence, life_point)
VALUES
    ('Guerrier', 'Une brute tout en muscle qui tape fort. Il porte une armure qui pue et grinçante il n’est donc pas discret. Il est bête, borné et colérique. Il a peur de tout ce qui n’est pas lui.', 1, 1, 20, 10, 5, 150),
    ('Mage', 'Un rat de bibliothèque qui joue avec la magie. Il porte une robe voyante qui le rend ridicule. Il est snob, distrait et imprudent. Il se croit tout permis, mais s’enfuit quand il provoque des conflits.', 2, 2, 5, 10, 25, 80),
    ('Rôdeur', 'Un voleur qui se cache dans la nature et se bat à distance. Il porte une tenue qui le rend invisible et lui permet de fuir. Il est fourbe, égoïste et opportuniste. Il ne pense qu’à lui.', 3, 3, 10, 20, 10, 100);


-- Seeding pour public.monster
INSERT INTO "monster" (label, description, life_point, physical_damage, magical_damage, escape, coin_min, coin_max)
VALUES

    -- CLASSIQUES
    -- Commun ''
    ('Gobelin', 'Créature humanoïde de petite taille à la peau verte et aux oreilles pointues. Attaque toujours en groupe, il est lâche, fourbe, constipé, bavard et malicieux.', 5, 1, 0, 100, 0, 5), --monster.id : 1
    ('Orc', 'Un humanoïde brutal et sanguinaire qui vit dans les marais. Il est très fort, très violent et très stupide. Il aime se battre, piller et manger de la viande. Il n’aime pas les humains, les elfes et la diplomatie., ', 10, 5, 1, 80, 0, 5), --monster.id : 2
    ('Troll', 'Une créature humanoïde de grande taille, à la peau grise, aux cheveux hirsutes et aux griffes acérées. aux cheveux hirsutes et aux griffes acérées. Il est brutal, vorace et stupide.', 20, 10, 2, 70, 0, 5), --monster.id : 3
    ('Gnome', 'Une créature humanoïde de petite taille, à la barbe fournie et au nez pointu. Il porte des des lunettes et des vêtements en lambeaux. Il est explosif, nerveux et colérique. Il vit dans les jardins, les forêts ou les mines, et fabrique des bombes ou des pièges. Il se fait sauter par ses inventions, et aime se faire enterrer.', 5, 2, 3, 90, 0, 5), --monster.id : 4
    ('Kobold', 'Créature humanoïde de petite taille, cousines des gobelins. Attaque toujours en groupe, il est lâche, stupide et bruyant.', 5, 1, 0, 100, 0, 5), --monster.id : 5
    ('Wokie', 'Non il ne s’agit pas d’un grande créature bruyante  à poils bruns et longs, mais d’une petite créature humanoïde teigneuse, agressive, encore plus bruyante et à la pilosité aux couleurs vives,criardes, souvent roses ou bleues... parfaitement inoffensif, il sait juste crier.', 1, 0, 0, 100, 0, 0), --monster.id : 6
    ('Zombie', 'Cadavre animé par l’intervention d’une magie obscure, on le reconnaît aisément à l’odeur, ou à défaut en tendant l’oreille on peut l’entendre de loin chantonner le plus gros hit de The Cranberries.', 8, 2, 0, 100, 0, 5), --monster.id : 7
    ('Beauf', 'C’est un humain, il parait, prétentieux, égocentré, narcissique mais absolument et indéniablement pathétique. Il pense que sa coupe mulet le rend supérieur, il ne vous faudra pas beaucoup d’effort pour le rétamer cependant...', 5, 1, 0, 100, 0, 5), --monster.id : 8
    ('Trader BitCoin', 'Créature étrange qui vit dans son petit monde de chiffre pensant qu’il contrôle le marché... Ces aptitudes de combat sont inversement proportionnelles à sa capacité à se bercer d’illusions. ', 1, 0, 0, 100, 0, 2), --monster.id : 9
    ('Comic Sans', 'Parce que tout le monde hait le comic sans.', 10, 4, 0, 50, 0, 7), --monster.id : 10



    --Rare
    ('Minotaure', 'Une créature humanoïde qui a la tête et les cornes d’un taureau. Il est obèse, glouton et paresseux. Il vit dans les labyrinthes, les cavernes ou les arènes, et passe son temps à manger et à dormir. Il ronfle très fort, et se fait réveiller souvent. Il a le mal des transports, et se perd souvent.', 45, 25, 0, 30, 5, 10), --monster.id :11
    ('Griffon', 'Une créature hybride qui a le corps d’un lion et la tête et les ailes d’un aigle. Il est chétif, ridicule et prétentieux. Il vit dans les montagnes, les forêts ou les plaines, et se prend pour le roi des animaux. Il se coiffe avec du gel, et se fait des mèches colorées. Il se moque des autres, et se fait chasser souvent.', 40, 15, 10, 40, 5, 10), --monster.id : 12
    ('Basilic', 'Une créature reptilienne qui a le pouvoir de pétrifier ceux qui croisent son regard. Il est borgne, myope et timide. Il vit dans les déserts, les ruines ou les souterrains, et se cache dès qu’il voit quelqu’un. Il a peur de son ombre, et se pétrifie lui-même souvent.', 40, 10, 20, 30, 5, 10), --monster.id : 13
    ('Géant', 'Une créature humanoïde qui a une taille démesurée. Il est complexé et timide. Il vit dans les collines, les forêts ou les châteaux, et se nourrit de fleurs et de papillons. Il porte des vêtements trop petits, et se fait des bonnets. Il se fait moquer par les autres, et se fait rétrécir souvent.', 50, 20, 0, 30, 5, 10), --monster.id : 14
    ('Centaure', 'Une créature hybride qui a le corps d’un cheval et le torse d’un humain. Il est impuissant, frustré et jaloux. Il vit dans les forêts, les prairies ou les villages, et se fait rejeter par les femmes et les juments. Il se masturbe avec des carottes, et se fait des poupées gonflables. Il harcèle les voyageurs, et se fait castrer souvent.', 70, 45, 30, 30, 5, 10), -- -18ans --monster.id : 15
    ('Elfe noir', 'Une créature humanoïde qui a la peau noire et les cheveux blancs. Il est masochiste, soumis et lâche. Il vit dans les souterrains, les cités ou les temples, et subit les ordres de ses maîtres. Il porte des armures cloutées, et se fait des scarifications. Il se fait battre par les autres, et se fait humilier souvent et il aime ça...', 65, 30, 60, 40, 5, 10), -- -18ans --monster.id : 16
    ('Cyclope', 'Une créature humanoïde qui n’a qu’un seul œil au milieu du front. Il est daltonien, stupide et maladroit. Il vit dans les montagnes, les grottes ou les îles, et se nourrit de cailloux et de bouses. Il se fait des chapeaux en peau de mouton et se cogne partout.', 80, 50, 10, 30, 5, 10), -- 16ans --monster.id : 17

    -- Épique
    ('Sphinx', 'Une créature hybride qui a le corps d’un lion, la tête d’un humain et les ailes d’un aigle. Il est intelligent, énigmatique et arrogant. Il vit dans les déserts, les pyramides ou les temples, et pose des énigmes aux voyageurs. Il se croit très cultivé, mais il répète toujours les mêmes énigmes. Il a un accent très prononcé, et se fait comprendre difficilement.', 200, 30, 50, 20, 10, 15), --monster.id : 18
    ('Dragon', 'Une créature reptilienne ailée qui crache du feu ou un autre élément. Il est cupide et vole tous l’or qu’il trouve, il garde son trésor à l’abri dans sa tanière', 100, 50, 50, 20, 10, 15), --monster.id : 19
    ('Djinn', 'Une créature magique qui peut exaucer les vœux de ceux qui l’invoquent. Il est sadique, pervers et vicieux. Il vit dans les déserts, les lampes ou les anneaux, et se divertit en torturant les mortels. Il porte des vêtements en latex, et se fait des fouets. Il inverse les vœux, et se fait insulter souvent.', 90, 40, 60, 25, 10, 15), -- 16ans --monster.id : 120
    ('La Licorne ', 'Une créature féerique qui a le corps d’un cheval et une corne au milieu du front. Elle est prétentieuse, snob et hypocrite. Elle vit dans les forêts enchantées, les arc-en-ciels ou les châteaux, et se fait adorer par les enfants et les princesses. Elle porte des rubans, des fleurs et des paillettes. Elle se drogue avec de la poudre de fée, et se fait sodomiser par des nains.', 70, 70, 70, 20, 10, 15), -- -18ans --monster.id : 21
    ('Liche', 'Mage mort-vivant excentrique et puissant, le liche manie la nécromancie avec un humour sinistre. Entre vengeances et quête de repos éternel, il hante les lieux lugubres, souvent ignoré par les vivants. Parfois, il choisit de suspendre sa propre existence tumultueuse en vain.', 110, 20, 70, 20, 10, 15), -- 16ans --monster.id : 22

    -- DÉLICIEUX
    -- Commun
    ('L’Hu-Gaufre-haie', 'Un buisson à gaufres chantant, il disparaît souvent quand vient l’hiver, mais il réapparait quand le printemps revient.', 15, 8, 0, 80, 0, 5), --monster.id : 23
    ('Gaufrophage ', 'Un mimic qui a pris l’apparence d’une gaufre, il attire ses proies avec son parfum sucré. Elle peut se refermer brusquement sur elles et les digérer lentement.', 25, 15, 0, 40, 0, 5), --monster.id : 24
    ('Loup-gaufrou', 'Une gaufre qui a failli se faire dévorer par un loup et qui s’est transformé en loup à cause de la plein lune', 15, 8, 0, 80, 0, 5), --monster.id : 25
    ('Gaufrodon ', 'Un semi-homme qui passe à travers champs munis de gaufres. Il attire ses victimes par l’odeur entêtante de la pâtisserie et les dévore crues. Il est très gourmand et défend jalousement son butin.', 8, 3, 0, 90, 0, 5), --monster.id : 26
    ('Gaufreux', 'Un spectre qui a le visage en forme de gaufre, et qui hante les lieux où il y a des gaufres. Il est translucide, effrayant et vengeur. Il vit dans les châteaux, les églises ou les cimetières, et terrorise les gens qui mangent ou font des gaufres.', 20, 5, 15, 70, 0, 5), --monster.id : 27
    ('Gaufrelet', 'Un squelette qui a les os en forme de gaufre, et qui se reconstitue avec des gaufres. Il est mort-vivant, agile et obstiné. Il vit dans les catacombes, les tombeaux ou les cryptes, et poursuit les gens qui lui volent ses gaufres.', 10, 7, 0, 60, 0, 5), --monster.id : 28
    ('Gaufrelin', 'Un gremlin qui a les yeux en forme de gaufre, et qui sabote tout ce qui est lié aux gaufres. Il est petit, vil et destructeur. Il vit dans les usines, les ateliers ou les laboratoires, et s’infiltre dans les machines ou les appareils qui fabriquent ou utilisent des gaufres.', 5, 2, 3, 95, 0, 5), --monster.id : 29
    ('Gaufriton', 'Un lutin qui a les cheveux en forme de gaufre, et qui adore faire des farces avec des gaufres. Il est petit, malin et espiègle. Il vit dans les forêts, et s’amuse à piéger les gens avec des gaufres empoisonnées, explosives ou vivantes.', 7, 1, 4, 85, 0, 5), --monster.id : 30
    ('Gaufreau', 'Un taureau qui a les cornes en forme de gaufre, et qui charge tout ce qui ressemble à une gaufre. Il est robuste, fougueux et colérique. Il vit dans les plaines, les prairies ou les arènes, et défie les gens qui portent des vêtements ou des objets en forme de gaufre.', 25, 15, 0, 40, 0, 5), --monster.id : 31
    -- On pourrait récupérer les stats de pv et de dégâts d'attaques du joueur pour les apposé à ce monstre là.
    ('L’Alter E-Gaufre', 'Une gaufre qui vous ressemble à s’y méprendre, peut-être est-t-elle vous? Êtes-vous bien sûr(e) d’être l’original?', 20, 10, 0, 80, 0, 10), --monster.id : 32

    -- Rare
    ('Gaufre-au-trésor ', 'Un mimic en fore de gaufre elle-même en forme de coffre...c’est conceptuel mais attention ce monstre à des crocs.', 50, 25, 0, 30, 5, 50), --monster.id : 33
    ('Gaufroy de Saint-Denis ', 'Un chevalier aux intentions mystérieuses qui ne trépasse que s’il faiblit', 60, 30, 0, 30, 5, 30), --monster.id : 34
    ('Sangaufre', 'Un vampire qui pleure les nuits de pleine lune. Attristé de ne pas avoir de gaufre dans sa vie, il hante les maisons attiré par l’odeur du beurre et du sucre. Il peut mordre ses victimes et les infecter avec sa malédiction.', 30, 10, 10, 60, 5, 10), --monster.id : 35
    ('Wafflestein ', 'Un golem de gaufres assemblé par un savant fou. Il est doté d’une force prodigieuse, mais aussi d’une faiblesse pour le chocolat.', 50, 25, 0, 30, 5, 10), --monster.id : 36
    ('Gaufrouille', 'Un troll qui a les dents en forme de gaufre, et qui se cache sous les ponts où il y a des gaufres. Il est laid, bête et méchant. Il vit dans les marécages, les grottes ou les égouts, et demande un tribut en gaufres aux gens qui veulent passer.', 40, 20, 5, 20, 5, 10), --monster.id : 37
    ('Gaufrogre', 'Un ogre qui a la peau en forme de gaufre, et qui se nourrit exclusivement de gaufres. Il est énorme, baveux et gourmand. Il vit dans une cabane en gaufres, et kidnappe les voyageurs qui passent près de chez lui pour les transformer en gaufres.', 60, 30, 0, 10, 5, 10), --monster.id : 38
    ('Gaufrolim', 'Une créature gélatineuse faite de pâte à gaufre. Il peut changer de forme et absorber tout ce qu’il touche. Il est sensible au froid et au feu.', 30, 10, 10, 60, 5, 10), --monster.id : 39
    
    -- Épique
    ('Dragaufre', 'Un dragon géant recouvert de gaufres croustillantes. Il peut cracher du sirop d’érable brûlant sur ses ennemis.', 150, 75, 75, 10, 10, 15), --monster.id : 40
    ('Gaufrix', 'Un phénix qui a les plumes en forme de gaufre, et qui renaît de ses cendres sous forme de gaufre. Il est majestueux, flamboyant et immortel. Il vit dans les volcans, et se consume en faisant des étincelles de sucre glace.', 80, 40, 40, 50, 10, 15), --monster.id : 41
    ('Gaufrosaure', 'Un dinosaure qui a la peau en forme de gaufre, et qui rugit en faisant des bulles. Il est herbivore, pacifique et gourmand. Il aime se rouler dans le sirop et la chantilly.', 100, 65, 30, 30, 10, 15), --monster.id : 42
    ('Baba Yagaufre', 'Une créature mi-divine mi-cauchemar née de la sorcellerie e tde la consomation abusive d’alcool de pomme-de-terre.', 140, 70, 80, 10, 25, 50), --monster.id : 43
    ('Jörmungaufre', 'Entité semi-divine ressemblant à un gigantesque serpent marin dont les anneaux sont fait de colossales gaufres aux sucre. Le laisser libre pourrait causer la destruction totale de notre monde par le Sucre et la Pâtisserie', 999, 99, 99, 30, 250, 500); --monster.id : 44
    -- ('', '', , , , , , ), --


-- Seeding pour public.npc
INSERT INTO "npc" (firstname, lastname, description)
VALUES 
    ('Le marchand', 'Gogo', 'Le vendeur de notre village'), -- npc.id : 1
    ('Inconnu', 'Inconnu', 'Une aventure'), -- npc.id : 2
    ('Une nomade', 'Waffy', 'Un elfe excentrique qui voyage avec sa carriole à gaufres, et qui parle avec un accent incompréhensible.'), -- npc.id : 3
    ('Un nain artisan gaufre', 'Gaufredor', 'Une personne de petite taille gourmande qui vend des gaufres magiques, mais qui a tendance à les manger avant ses clients'), -- npc.id : 4
    ('Une charlatan', 'Gaufry', 'Une jeune femme charmante qui attire les clients avec son sourire, mais qui cache un caractère bien trempé et un sens de l’arnaque'), -- npc.id : 5
    ('Un forgeron de gaufre ', 'Gaufroy', 'Un ancien paladin qui a renoncé à sa foi pour se consacrer à la fabrication de gaufres, et qui prétend que c’est un don divin.'), -- npc.id : 6
    ('Une sorcière', 'Gaufine', 'Une magicienne maléfique qui utilise des gaufres empoisonnées pour ensorceler les gens et les transformer en animaux.'), -- npc.id : 7
    ('Un marchand ambulant', 'Gaufrix', ' un être mystérieux du peuple du desert qui vend des gaufres dans son chariot. Il est très jovial et enthousiaste, mais il est aussi très rusé et opportuniste. Il profite de la faim et de la curiosité des gens pour leur vendre ses gaufres, mais il n’hésite pas à augmenter ses prix ou à baisser sa qualité.'), -- npc.id : 8
    ('Une gourmet', 'Madeleine', 'une généreuse femme cuisinière qui tient une boulangerie. Elle est très douce et maternelle, mais elle est aussi très curieuse et bavarde. Elle fait des gaufres délicieuses, qu’elle offre volontiers aux clients et aux amis. Elle aime discuter et écouter les histoires des voyageurs, mais elle pose aussi beaucoup de questions et révèle parfois des secrets.'), -- npc.id : 9
    ('Un collectionneur', 'Clement', 'Un sorcier qui collectionne des gaufres. Il est très intelligent et habile, mais il est aussi très orgueilleux et solitaire. Il utilise la magie pour créer des gaufres extraordinaires, qu’il conserve dans son laboratoire. Il aime expérimenter et découvrir de nouvelles recettes, mais il n’aime pas partager ses gaufres ni ses connaissances. Il a aussi tendance à se méfier et à se moquer des autres.'), -- npc.id : 10
    ('Une religieuse', 'Crème', 'Une croyante qui réside dans un monastère. Elle est très pieuse et dévouée, mais elle est aussi très gourmande et paresseuse. Elle prie et médite, mais elle mange et dort beaucoup. Elle a aussi tendance à se faire pardonner et à se faire des indulgences.'), -- npc.id : 11
    ('Un écureuil', 'Noisette', 'Un petit mammifère roux qui vit dans la forêt. Il est très mignon et espiègle, mais il est aussi très curieux et imprévisible. Il collectionne les noisettes et les objets brillants, mais il vole et cache tout ce qu’il trouve. Il a aussi tendance à se faire des amis et à se faire des blagues.'), -- npc.id : 12
    ('Un villageois', 'Beurre', 'Un paysan qui travaille dans une ferme. Il est très fort et travailleur, mais il est aussi très simple et rustre. Il s’occupe des animaux et des cultures, mais il n’a pas beaucoup de culture ni d’éducation. Il a aussi tendance à se faire exploiter et à se plaindre.'), -- npc.id : 13
    ('Une princesse', 'Gaufrette', 'La fille de la reine gaufre qui vit seul avec ses domestiques dans un immense un château. Elle est très belle et raffinée, mais elle est aussi très capricieuse et arrogante. Elle aime se faire admirer et obéir, mais elle déteste partager et aider. Elle a aussi tendance à se faire kidnapper'), -- npc.id : 14
    ('Un voleur', 'Chocotin', 'Un chapardeur Skavens êtres mi-hommes mi-rats qui vivent dans les égouts, les ruines ou les souterrains. Il est très agile et audacieux, mais il est aussi imprudent et très gourmand surtout quand il s’agit de chocolat.Il vole tout ce qui trouve, mais il se fait souvent prendre la main dans le sac. Il a aussi tendance à se faire des ennemis et à provoquer des poursuites.'), -- npc.id : 15
    ('Une réceptionniste', 'Framboise', 'Une fée qui tient une auberge. Elle est très gentille et généreuse, mais elle est aussi très naïve et crédule. Elle croit tout ce qu’on lui dit, même les mensonges les plus gros. Elle a aussi tendance à confondre les mots et à dire des bêtises.'), -- npc.id : 16
    ('Un bourgegaufre', 'Gaufresou', 'Un êtres mi-hommes mi-canard qui possède une fortune colossale. Il est obsédé par les gaufres et il en achète et en mange sans arrêt. Il n’est jamais satisfait et il cherche toujours à avoir plus de gaufres, de variétés, de garnitures et de saveurs. Il est aussi très avide et égoïste, et il refuse de partager ses gaufres avec quiconque. Il a aussi tendance à se faire des ennemis et à se faire des indigestions.'), -- npc.id : 17
    ('Agent du fisc', 'Alain Poe', 'Le mec que t’as pas envie de voir arriver chez toi.'), -- npc.id : 18
    ('Ramasseur de champignon', 'Mike Oz', 'Il aime la forêt et ramasser des champignons... au point que ça en est perturbant.'), -- npc.id : 19
    ('Volaille de Thanksgiving', 'Crystal', 'Une travailleuse déterminée de la DDE qui vous mettra le coeur en chantier.'), -- npc.id : 20
    ('Une personne', 'John Doe', 'Une personne nous raconte une anecdote'); -- npc.id : 21
    
    -- ('', '', ''), --


-- Seeding pour public.quote
INSERT INTO "quote" (content)
VALUES 
    ('Bienvenu mon ami, nous avons de nouvelle marchandises, fait toi plaisir'), -- quote.id : 1 et npc.id : 1 = Notre marchand
    ('Quelle aventure !'), -- quote.id : 2 et npc.id : 2 = Inconnu
    ('Salut, les gars ! Moi, c’est Waffy, l’elfe à la carriole. Je voyage de ville en ville pour vendre mes gaufres délicieuses. Elles sont faites avec des ingrédients secrets que je ramasse dans la forêt. Vous voulez en acheter ? C’est pas cher, c’est pas cher ! Mais il faut parler vite, car je n’ai pas le temps de bavarder !'), -- quote.id : 3 et npc.id : 3 = Une nomade, Waffy
    ('Bonjour, aventuriers ! Je suis Gaufredor, le maître des gaufres. Si vous avez faim, venez goûter mes gaufres magiques. Elles vous donneront de la force, de la sagesse, et peut-être même des pouvoirs ! Mais attention, il faut les manger vite, car je ne peux pas résister à l’envie de les croquer !'), -- quote.id : 4 et npc.id : 4 = Un artisan gaufre, Gaufredor
    ('Bienvenue chez Gaufry, la reine des gaufres. Je vous propose les meilleures gaufres du royaume, croustillantes à l’extérieur, moelleuses à l’intérieur. Elles sont garnies de chantilly, de chocolat, de fruits, ou de ce que vous voulez. Vous n’avez qu’à choisir ! Mais ne vous fiez pas à mon sourire, car je ne fais pas de cadeau. Si vous ne payez pas, vous le regretterez !'), -- quote.id : 5 et npc.id : 5 = Une charlatan, Gaufry
    ('Salutations, mes frères. Je suis Gaufroy, le prophète des gaufres. J’ai renoncé à ma vie de paladin pour me consacrer à la fabrication de gaufres, car c’est le seul moyen de rendre grâce à Dieu. Mes gaufres sont bénies, elles vous apporteront la paix, la joie, et la rédemption. Mais il faut avoir la foi, car elles ne sont pas données. Elles valent plus que de l’or !'), -- quote.id : 6 et npc.id : 6 = Un forgeron, Gaufroy
    ('Hé hé hé, mes chéris. Je suis Gaufine, la sorcière des gaufres. Je vous invite à goûter mes gaufres ensorcelées, elles vous feront voir la vie en rose. Elles sont parfumées à la fleur de lotus, à la mandragore, ou à la belladone. Vous ne pourrez plus vous en passer ! Mais attention, car il y a un prix à payer. Si vous mangez mes gaufres, vous serez à moi !'), -- quote.id : 7 et npc.id : 7 = Une sorcière, Gaufine
    ('Eh, vous là ! Vous avez l’air d’avoir faim. Ça tombe bien, j’ai ce qu’il vous faut. Des gaufres, des gaufres, et encore des gaufres ! Il y en a pour tous les goûts, et pour toutes les bourses. Alors, qu’est-ce que vous attendez ? Venez vite profiter de mon offre exceptionnelle !'), -- quote.id : 8 et npc.id : 8 = Une bourgegaufre, Gaufrix
    ('Bonjour, mes amis. Je suis ravi de vous rencontrer. Je suis une passionnée de gaufres, et je parcours le monde pour faire découvrir ma spécialité. Mes gaufres sont faites avec amour, et avec des ingrédients de qualité. Elles sont si bonnes, que vous ne pourrez plus vous en passer. Vous voulez essayer ? C’est gratuit, c’est gratuit !'), -- quote.id : 9 et npc.id : 9 = Une gourmet, Madeleine
    ('Bien le bonjour, voyageurs. Je vois que vous êtes curieux de mes gaufres. Elles sont uniques, vous savez. Elles ont un secret, un secret que je ne peux pas vous révéler. Mais je peux vous dire une chose : elles sont magiques. Elles vous feront vivre des expériences incroyables. Vous voulez tenter l’aventure ? C’est à vos risques et périls !'), -- quote.id : 10 et npc.id : 10 = Un collectionneur, Clement
    ('Bonjour, mon enfant. Vous êtes le bienvenu dans notre monastère. Vous avez l’air fatigué et affamé. Venez, je vais vous offrir une gaufre. C’est une spécialité de notre ordre. Nous les faisons avec amour et dévotion. Vous verrez, c’est un régal pour le corps et pour l’âme.'), -- quote.id : 11 et npc.id : 11 = Une religieuse, Crème
    ('Coucou, c’est moi, Noisette. Tu veux jouer avec moi ? Je connais plein de jeux rigolos. Comme cache-cache, saute-mouton, ou attrape-gaufre. Tu connais attrape-gaufre ? C’est très simple. Tu vois cette gaufre là-bas ? Elle est à toi. Mais tu dois la mériter. Tu dois la rattraper avant qu’elle ne s’envole. Oui, oui, elle s’envole. C’est une gaufre volante. Elle a des ailes. Et des dents. Et des yeux. Et elle parle. Elle dit : “Viens me chercher, si tu l’oses”. Alors, tu l’oses ?'), -- quote.id : 12 et npc.id : 12 = Un écureuil
    ('Salut, l’étranger. Tu viens d’où ? Tu cherches quoi ? Moi, je suis Beurre, le fermier. Je travaille dur toute la journée, pour nourrir ma famille et payer mes impôts. Mais je n’ai pas grand-chose en retour. Les seuls moments de bonheur que j’ai, c’est quand je mange une bonne gaufre. Tu veux goûter ? C’est ma femme qui les fait. Elles sont délicieuses.'), -- quote.id : 13 et npc.id : 13 = villageois, Beurre 
    ('Bonjour, mon beau. Tu es venu pour me voir ? Tu as bien fait. Je suis Gaufrette, la princesse gaufre. Je suis la plus belle et la plus riche du royaume. Tout le monde m’envie et me désire. Mais personne ne me mérite. Sauf peut-être toi. Tu as l’air courageux et aventurier. Tu veux me sauver ? C’est facile. Il suffit de me donner une gaufre. Mais attention, pas n’importe laquelle. Une gaufre digne de moi. Une gaufre royale'), -- quote.id : 14 et npc.id : 14 = Une princesse, Gaufrette 
    ('Hé, toi ! Arrête-toi ! Tu as quelque chose qui m’intéresse. C’est quoi, ça ? Une gaufre ? Au chocolat ? Miam, ça a l’air bon. Donne-la moi, vite ! Quoi, tu refuses ? Tu ne sais pas à qui tu parles. Je suis Chocotin, le roi des voleurs. Je prends tout ce que je veux, quand je veux. Et je veux ta gaufre. Alors, tu me la donnes, ou je te la prends de force. Qu’est-ce que tu choisis ?'), -- quote.id : 15 et npc.id : 15 = Un voleur, Chocotin
    ('Bienvenue dans mon auberge, cher voyageur. Vous allez être bien ici. J’ai des chambres confortables, un service impeccable, et surtout, des gaufres succulentes. Vous voulez une gaufre ? C’est gratuit. C’est mon cadeau de bienvenue. Mais attention, ne mangez pas trop. Les gaufres sont magiques. Elles vous donnent des pouvoirs extraordinaires. Mais elles ont aussi des effets secondaires. Comme des hallucinations, des transformations, ou des explosions. Mais ne vous inquiétez pas, c’est très rare. Et très drôle.'), -- quote.id : 16 et npc.id : 16 = Une réceptionniste, Framboise 
    ('Salut, toi. Tu es nouveau dans le coin ? Tu ne me connais pas ? Je suis Gaufresou, le maître des gaufres. J’ai la plus grande collection de gaufres du monde. J’en ai de toutes les sortes, de toutes les couleurs, de tous les goûts. Tu veux voir ? Suis-moi. Mais ne touche à rien. Les gaufres sont à moi. Rien qu’à moi. Si tu en prends une, je te fais la peau. Tu comprends ? Les gaufres sont ma vie. Ma passion. Mon obsession.'), -- quote.id : 17 et npc.id : 17 = bourgegaufre, Gaufresou 
    ('Tu as l’air aussi menaçant qu’une limace en colère !'), -- quote.id : 18 = MONSTRE
    ('Je vais te manger tout cru… après avoir fini ma sieste.'), -- quote.id : 19 = MONSTRE
    ('Tu es aussi effrayant qu’un lapin avec une carotte !'), -- quote.id : 20 = MONSTRE
    ('Tu veux parler ? Parle à ma main… ou plutôt à ma patte.'), -- quote.id : 21 = MONSTRE
    ('Insulte-moi encore et je te transforme en sac à main.'), -- quote.id : 22 = MONSTRE
    ('Négocier ? Je suis un monstre, pas un marchand !'), -- quote.id : 23 = MONSTRE
    ('Tes insultes sont aussi vides que ta tête, héros.'), -- quote.id : 24 = MONSTRE
    ('Tu crois que tu es drôle ? Tu te trompes ! Tu es pathétique !'), -- quote.id : 25 = MONSTRE
    ('Quand je parle en combat je vomis, *vomit sur le héros*'), -- quote.id : 26 = MONSTRE
    ('Tu n’as aucune chance contre moi ! Je suis le roi des monstres ! Le maître du donjon ! Le seigneur des ténèbres ! Le... le... zut, j’ai oublié la suite !'), -- quote.id : 26 = MONSTRE
    ('Tu as peur de moi, n’est-ce pas ? Tu trembles comme une feuille !'), -- quote.id : 27 = MONSTRE
    ('Tu veux me faire des compliments ? Tu crois que ça va m’attendrir ?'), -- quote.id : 28 = MONSTRE
    ('Tu crois que je vais te faire des confidences ?'), -- quote.id : 29 = MONSTRE
    ('Tu crois que je vais te donner des conseils ?'), -- quote.id : 30 = MONSTRE
    ('Je suis Poe, Alain Poe, et je représente la branche nomade de la caisse des Donjons. Avez-vous pensé à payer votre côtisation mensuelle sur l’activité professionelle intra-dojonesque?'), -- quote.id : 31 et npc.id : 18 = Alain Poe
    ('Mon nom est Mike Oz, collecteur de champignons pour le village. Je vous réquisitionne des vesses-de-loups et des phallus impudicus!'), -- quote.id : 32 et npc.id : 19 = Mike Oz
    ('Salut! Moi c’est Crystal. je suis en quelque sorte agent de la DDE vu que je travaille au bord de la route... Tu voudrais pas m’aider à ôter ces re-vêtements?'), -- quote.id : 33 et npc.id : 19 = Crystal
    ('Je bosse dans la branche allemande de Syctom, tu imagines tout ce que nous re-zyklon chaque année?'), -- quote.id : 34 = PNJ-NON-PERSONNALISE
    ('....   ......... noob.'), -- quote.id : 35 = PNJ-NON-PERSONNALISE
    ('Les gobelins sont des créatures pensantes comme les autres, ils ne méritent pas d’être exterminés à vue comme ça... Vous voudriez pas me rejoindre pour lutter pour leurs droits?'), -- quote.id : 36 = PNJ-NON-PERSONNALISE
    ('Alors? Vous avez trouvé la gaufre perdue? .... non sans blague j’ai la dalle, dites-moi que vous l’avez!'), -- quote.id : 37 = PNJ-NON-PERSONNALISE
    ('Attention, derrière toi ! Un monstre horrible ! Ah, non, c’est juste ton reflet dans le miroir.'), -- quote.id : 38 = PNJ-NON-PERSONNALISE
    ('Tu es le héros de la prophétie ? Celui qui doit sauver le monde ? Quelle déception. Tu es petit, maigre, et tu as une drôle de tête.'), -- quote.id : 39 = PNJ-NON-PERSONNALISE
    ('Tu es venu pour le trésor ? Désolé, il n’y en a plus. Le dernier aventurier est parti avec tout… et ma femme.'), -- quote.id : 40 = PNJ-NON-PERSONNALISE
    ('Quoi ? Tu veux me parler ? Mais tu ne vois pas que je suis occupé ? Je dois finir ce sudoku avant la fin du monde.'), -- quote.id : 41 = PNJ-NON-PERSONNALISE
    ('Tu as l’air d’un aventurier. Tu sais ce qu’on dit : un aventurier sans chapeau, c’est comme un donjon sans dragon. Tu devrais investir dans un couvre-chef.'), -- quote.id : 42 = PNJ-NON-PERSONNALISE
    ('Tu as soif ? Tu as faim ? Tu as besoin d’un ami ? Viens, je t’invite à boire un verre à la taverne. C’est moi qui régale… enfin, c’est toi qui payes.'), -- quote.id : 43 = PNJ-NON-PERSONNALISE
    ('Tu as entendu parler de la légende du héros ? Celui qui doit sauver le monde de la menace du mal ? Moi, je n’y crois pas. C’est juste une histoire pour faire peur aux enfants. Et aux adultes.'), -- quote.id : 44 = PNJ-NON-PERSONNALISE
    ('Tu vois cette montagne là-bas ? C’est le Mont Chauve. Il paraît qu’un jour, un géant s’est endormi dessus, et qu’il a perdu tous ses cheveux à force de frotter sa tête contre la roche.'), -- quote.id : 45 = PNJ-NON-PERSONNALISE (histoire)
    ('Tu connais la forêt des Mille Feuilles ? C’est un endroit magique, où les arbres changent de couleur selon les saisons. Mais attention, il ne faut pas s’y aventurer la nuit, car les feuilles se transforment en papillons carnivores.'), -- quote.id : 46 = PNJ-NON-PERSONNALISE (histoire)
    ('Tu as déjà entendu parler du lac des Larmes ? C’est un lac salé, qui a été formé par les pleurs d’une princesse. Elle pleurait son amant, qui avait été tué par un dragon. Le dragon, lui, s’est noyé dans le lac, et son corps est toujours au fond.'), -- quote.id : 47 = PNJ-NON-PERSONNALISE (histoire)
    ('Tu sais ce que c’est, le désert des Sables Mouvants ? C’est un désert où le sol est instable, et où on peut s’enfoncer à tout moment. Il y a une légende qui dit qu’un trésor est caché sous le sable, mais personne n’a jamais réussi à le trouver.'), -- quote.id : 48 = PNJ-NON-PERSONNALISE (histoire)
    ('Tu vois ce château là-haut ? C’est le château du Roi Fou. Il était tellement obsédé par la guerre, qu’il a fait construire des canons partout. Mais un jour, il a fait une erreur de calcul, et il a fait exploser son propre château.'), -- quote.id : 49 = PNJ-NON-PERSONNALISE (histoire)
    ('Tu connais le marais des Brumes ? C’est un marais où il y a toujours du brouillard, et où on peut se perdre facilement. Il y a des créatures étranges qui y vivent, comme des grenouilles géantes, des serpents volants, et des plantes carnivores.'), -- quote.id : 50 = PNJ-NON-PERSONNALISE (histoire)
    ('Tu vois cette grotte là-bas ? C’est la grotte des Échos. Si tu y entres, tu peux entendre ta voix résonner dans tout le donjon. C’est très amusant, sauf quand tu dis quelque chose de stupide, ou de honteux.'), -- quote.id : 51 = PNJ-NON-PERSONNALISE (histoire)
    ('Tu connais le pont des Soupirs ? C’est un pont où les amoureux viennent se déclarer leur flamme. Mais il y a un piège : si tu mens, ou si tu trompes ton partenaire, le pont se brise, et tu tombes dans le vide.'), -- quote.id : 52 = PNJ-NON-PERSONNALISE (histoire)
    ('Tu sais ce que c’est, le volcan des Colères ? C’est un volcan qui entre en éruption quand il est en colère. Et il est souvent en colère. Il n’aime pas qu’on le dérange, qu’on le critique, ou qu’on lui fasse des blagues.'), -- quote.id : 53 = PNJ-NON-PERSONNALISE (histoire)
    ('Tu as déjà entendu parler du labyrinthe des Illusions ? C’est un labyrinthe où tu peux voir tes rêves se réaliser. Mais attention, ce ne sont que des illusions. Si tu te laisses séduire, tu restes prisonnier du labyrinthe pour toujours.'), -- quote.id : 54 = PNJ-NON-PERSONNALISE (histoire)
    ('Tu vois ce temple là-haut ? C’est le temple du Dieu Rigolo. C’est un dieu qui aime rire, et qui fait des farces à ses fidèles. Il leur envoie des pluies de confettis, des coussins péteurs, et des tartes à la crème.'), -- quote.id : 55 = PNJ-NON-PERSONNALISE (histoire)
    ('Tu connais la tour des Secrets ? C’est une tour où tu peux apprendre tous les secrets du monde. Mais il y a un prix à payer : tu dois aussi révéler tes propres secrets. Et crois-moi, tu n’as pas envie que tout le monde les sache.'), -- quote.id : 56 = PNJ-NON-PERSONNALISE (histoire)
    ('Tu sais ce que c’est, le jardin des Merveilles ? C’est un jardin où tu peux voir des fleurs extraordinaires, des fruits délicieux, et des animaux fantastiques. Mais il ne faut pas les toucher, ni les goûter, ni les caresser. Sinon, tu te transformes en plante, en fruit, ou en animal.'), -- quote.id : 57 = PNJ-NON-PERSONNALISE (histoire)
    ('Tu as déjà entendu parler du palais des Glaces ? C’est un palais tout en glace, où tu peux admirer des sculptures magnifiques, des fontaines scintillantes, et des miroirs magiques. Mais il fait très froid, et si tu restes trop longtemps, tu risques de geler sur place.'), -- quote.id : 58 = PNJ-NON-PERSONNALISE (histoire)
    ('Tu vois cette île là-bas ? C’est l’île des Pirates. C’est une île où vivent des pirates, qui pillent, qui boivent, et qui chantent. Ils ont un trésor caché, mais ils ne le partagent avec personne. Sauf si tu leur fais rire, ou si tu leur donnes du rhum.'), -- quote.id : 59 = PNJ-NON-PERSONNALISE (histoire)
    ('Tu connais le cimetière des Oubliés ? C’est un cimetière où sont enterrés les héros qui ont échoué dans leur quête. Personne ne se souvient d’eux, ni de leurs exploits. C’est triste, mais c’est comme ça. La vie est cruelle, et le donjon aussi.'); -- quote.id : 60 = PNJ-NON-PERSONNALISE (histoire)



-- Seeding pour public.event
INSERT INTO "event" (label, description, type, monster_id, npc_id)
VALUES 
    ('La gaufre des gobelins', 'Vous entrez dans une forêt, à la recherche d’un raccourci. Vous sentez une odeur de gaufre. Vous suivez votre nez, et vous tombez sur un groupe de gobelins qui se disputent une gaufre. Ils vous voient, et ils vous disent : "Tu veux notre gaufre ? Tu dois nous battre !". Ils vous sautent dessus, et le combat commence.', 'battle', 1, NULL), -- 1 gobelins
    ('La viande des orcs', 'Vous traversez un marais, à la recherche d’un passage. Vous voyez un feu de camp, avec une marmite qui mijote. Vous vous approchez, et vous découvrez que c’est de la viande humaine. Vous êtes dégoûté, et vous voulez partir. Mais vous êtes repéré par des orcs qui gardent le camp. Ils vous disent : "Tu veux goûter à notre viande ? Tu n’as qu’à entrer dans la marmite !". Ils vous poursuivent, et le combat commence.', 'battle', 2, NULL), -- 2 Orcs
    ('Le trésor du troll', 'Vous entrez dans une grotte, à la recherche d’un trésor. Vous voyez une pile de pièces d’or qui brille dans l’obscurité. Vous vous précipitez, mais vous réalisez trop tard que c’est un piège. Un troll sort de derrière un rocher, et vous dit : "C’est à moi, ça ! Tu veux me le voler ?". Il brandit sa massue, et le combat commence.', 'battle', 3, NULL), -- 3 Troll
    ('La clochette du gnome', 'Vous marchez tranquillement dans la forêt, quand vous entendez un bruit de grelot. Vous vous approchez, et vous découvrez un gnome qui a attaché une clochette à sa barbe. Il vous regarde avec un sourire narquois, et vous lance : "Tu veux jouer avec moi ?". Avant que vous puissiez répondre, il vous jette une bombe artisanale, et le combat commence.', 'battle', 4, NULL), -- 4 Gnome
    ('Le défi du minotaure', 'Vous traversez un pont, quand vous entendez un grognement. Vous levez les yeux, et vous voyez un minotaure qui vous bloque le passage. Il vous dit : "Tu veux passer ? Tu dois me battre !". Il charge vers vous, et le combat commence.', 'battle', 5, NULL), -- 5 Minotaure
    ('La coiffure du griffon', 'Vous volez dans le ciel, sur le dos d’un aigle géant. Vous admirez le paysage, quand vous voyez un griffon qui vous fait signe. Il vous dit : "Tu veux voir ma nouvelle coiffure ?". Il se rapproche, et vous montre ses mèches colorées. Il vous demande : "Tu aimes ?". Vous lui dites que non, et il se vexe. Il vous attaque, et le combat commence.', 'battle', 6, NULL), -- 6 Griffon
    ('Le regard du basilic', 'Vous explorez une ruine, quand vous tombez sur une statue de pierre. Vous la trouvez étrange, car elle ressemble à un aventurier. Vous vous approchez, et vous voyez un basilic qui vous fixe du regard. Il vous dit : "Tu veux devenir comme lui ? Tu n’as qu’à me regarder !". Il vous lance son regard pétrifiant, et le combat commence.', 'battle', 7, NULL), -- 7 Basilic
    ('Le bonnet du géant', 'Vous escaladez une montagne, à la recherche d’une grotte secrète. Vous arrivez au sommet, et vous voyez un géant qui dort. Il porte un bonnet ridicule, qui cache ses oreilles. Vous vous approchez, et vous lui enlevez son bonnet. Il se réveille, et vous dit : "Qui a fait ça ?". Il vous voit, et il se fâche. Il vous dit : "Rends-moi mon bonnet !". Il vous lance des rochers, et le combat commence.', 'battle', 8, NULL), -- 8 Géant
    ('La fleur du centaure', 'Vous marchez dans une prairie, à la recherche d’une source magique. Vous voyez une fleur magnifique, qui brille au soleil. Vous vous approchez, et vous la cueillez. Vous entendez un hennissement. Vous vous retournez, et vous voyez un centaure qui vous charge. Il vous dit : "C’est ma fleur ! Tu me l’as volée !". Il vous tire des flèches, et le combat commence.', 'battle', 9, NULL), -- 9 Centaure
    ('L’intrus de l’elfe noir', 'Vous visitez une cité, quand vous croisez un elfe noir. Il vous dévisage, et vous dit : "Tu es un intrus ! Tu n’as rien à faire ici !". Il sort sa dague, et le combat commence.', 'battle', 10, NULL), -- 10 Elfe noir
    ('L’œil du cyclope', 'Vous naviguez sur la mer, à la recherche d’une île inconnue. Vous apercevez une silhouette qui émerge de l’eau. Vous vous approchez, et vous découvrez un cyclope qui vous regarde. Il vous dit : "Tu veux voir mon œil ?". Il se rapproche, et vous montre son œil unique et gigantesque. Il vous demande : "Tu aimes ?". Vous lui dites que non, et il se vexe. Il vous attaque, et le combat commence.', 'battle', 11, NULL), -- 11 Cyclope
    ('L’énigme du sphinx', 'Vous marchez dans le désert, à la recherche d’une pyramide ancienne. Vous voyez une statue de pierre qui garde l’entrée. Vous vous approchez, et vous entendez une voix. C’est le sphinx qui vous parle. Il vous dit : "Tu veux entrer ? Tu dois répondre à mon énigme !". Il vous pose une question, mais vous ne comprenez pas son accent. Vous lui demandez de répéter, mais il s’énerve. Il vous dit : "Tu as échoué !". Il vous attaque, et le combat commence.', 'battle', 12, NULL), -- 12 Sphinx
    ('Le trésor du dragon', 'Vous volez dans le ciel, sur le dos d’un griffon. Vous cherchez une grotte secrète. Vous la trouvez, et vous y entrez. Vous voyez un tas d’or qui brille dans l’obscurité. Vous vous précipitez, mais vous réalisez trop tard que c’est un piège. Un dragon sort de derrière un rocher, et vous dit : "C’est à moi, ça ! Tu veux me le voler ?". Il crache du feu, et le combat commence.', 'battle', 13, NULL), -- 13 Dragon
    ('Le vœu du djinn', 'Vous explorez une cité perdue, à la recherche d’un artefact magique. Vous trouvez une lampe ancienne, qui attire votre attention. Vous la frottez, et vous voyez un nuage de fumée. Un djinn en sort, et vous dit : "Tu m’as libéré ! Tu as droit à un vœu !". Vous lui demandez ce que vous voulez, mais il vous dit que c’est impossible. Vous insistez, mais il se fâche. Il vous dit : "Tu es trop gourmand !". Il vous attaque, et le combat commence.', 'battle', 14, NULL), -- 14 Djinn
    ('La corne de la licorne', 'Vous marchez dans une forêt, à la recherche d’une source enchantée. Vous voyez une licorne qui broute tranquillement. Vous vous approchez, et vous admirez sa beauté. Vous voulez toucher sa corne, mais elle vous repousse. Elle vous dit : "Ne me touche pas ! Tu vas salir ma corne !". Elle se cabre, et le combat commence.', 'battle', 15, NULL), -- 15 Licorne
    ('Le sort de la liche', 'Vous entrez dans un château, à la recherche d’un sorcier maléfique. Vous le trouvez, mais il est mort. Vous voyez son corps desséché, qui tient un livre. Vous vous approchez, et vous ouvrez le livre. Vous lisez une formule, mais vous ne savez pas ce qu’elle signifie. Vous entendez un rire. C’est la liche qui vous parle. Il vous dit : "Tu as prononcé le mot qui m’a ramené à la vie ! Tu vas le regretter !". Il vous lance un sort, et le combat commence.', 'battle', 16, NULL), -- 16 Liche
    ('La pâte du gaufrophage', 'Vous entrez dans une boulangerie, et vous achetez une gaufre. Vous la croquez, mais vous sentez quelque chose de visqueux. Vous regardez, et vous voyez un gaufrophage qui vous sourit. Il vous dit : "Tu es ma proie ! Tu n’as pas le choix !". Il se referme sur vous, et le combat commence.', 'battle', 17, NULL), -- 17 Gaufrophage
    ('La gaufre du loup-gaufrou', 'Vous faites une pause dans une auberge, et vous commandez une gaufre. Vous la savourez, quand vous entendez un hurlement. Vous vous retournez, et vous voyez un loup-gaufrou qui vous saute dessus. Il vous dit : "C’est ma gaufre ! Tu me l’as volée !". Il essaie de vous mordre, et le combat commence.', 'battle', 18, NULL), -- 18 Loup-gaufrou
    ('Le parfum du gaufrodon', 'Vous flânez dans un champ, et vous cueillez une fleur. Vous la sentez, mais vous entendez un cri. Vous vous retournez, et vous voyez un gaufrodon qui vous court après. Il vous dit : "C’est ma fleur ! Tu me l’as arrachée !". Il vous mord, et le combat commence.', 'battle', 19, NULL), -- 19 Gaufrodon
    ('La malédiction du gaufreux', 'Vous entrez dans une église, quand vous sentez une odeur de gaufre. Vous suivez votre nez, et vous trouvez une pile de gaufres sur l’autel. Vous vous apprêtez à en prendre une, quand vous entendez un cri. Vous vous retournez, et vous voyez un gaufreux qui vous regarde avec colère. Il vous dit : "Tu oses toucher à mes gaufres sacrées ? Tu vas payer pour ton sacrilège !". Il vous lance une malédiction, et le combat commence.', 'battle', 20, NULL), -- 20 Gaufreux
    ('La course du gaufrelet', 'Vous descendez dans une tombe, quand vous entendez un bruit de pas. Vous avancez, et vous voyez un gaufrelet qui court vers vous. Il vous dit : "Tu as volé mes gaufres ! Rends-les moi !". Il vous poursuit, et le combat commence.', 'battle', 21, NULL), -- 21 Gaufrelet
    ('La panne du gaufrelin', 'Vous visitez une usine, quand vous voyez une machine à gaufres. Vous avez envie d’en faire une, mais la machine ne marche pas. Vous regardez à l’intérieur, et vous voyez un gaufrelin qui a saboté le mécanisme. Il vous dit : "Tu veux faire des gaufres ? Tu n’as pas le droit ! Les gaufres sont à moi !". Il vous attaque, et le combat commence.', 'battle', 22, NULL), -- 22 Gaufrelin
    ('La farce du gaufriton', 'Vous marchez dans la forêt, quand vous voyez une cabane. Vous vous approchez, et vous voyez une pancarte qui dit : "Venez goûter mes gaufres ! Elles sont délicieuses !". Vous entrez, et vous voyez un gaufriton qui vous sourit. Il vous dit : "Tu veux une gaufre ? Tiens, prends celle-ci !". Il vous tend une gaufre, mais vous vous méfiez. Vous la regardez, et vous voyez qu’elle est vivante. Elle vous mord, et le combat commence.', 'battle', 23, NULL), -- 23 Gaufriton
    ('La charge du gaufreau', 'Vous traversez une prairie, quand vous voyez un troupeau de vaches. Vous les admirez, quand vous voyez un gaufreau qui se détache du lot. Il vous dit : "Tu veux une gaufre ? Tu n’en auras pas ! Les gaufres sont à moi !". Il charge vers vous, et le combat commence.', 'battle', 24, NULL), -- 24 Gaufreau
    ('La morsure du sangaufre', 'Vous rentrez chez vous, quand vous voyez une silhouette sur votre toit. Vous vous approchez, et vous voyez un sangaufre qui pleure. Il vous dit : "Tu as de la chance, tu peux manger des gaufres. Moi, je ne peux pas. Je suis maudit. Je ne peux que boire du sang. Et je vais boire le tien !". Il saute sur vous, et le combat commence.', 'battle', 25, NULL), -- 25 Sangaufre
    ('Le chocolat du Wafflestein', 'Vous visitez un laboratoire, et vous trouvez une tablette de chocolat. Vous la prenez, mais vous entendez un grondement. Vous vous retournez, et vous voyez un Wafflestein qui vous fonce dessus. Il vous dit : "C’est mon chocolat ! Tu me l’as pris !". Il vous frappe, et le combat commence.', 'battle', 26, NULL), -- 26 Wafflestein
    ('Le tribut du gaufrouille', 'Vous passez sous un pont, quand vous entendez une voix. Vous regardez, et vous voyez un gaufrouille qui vous interpelle. Il vous dit : "Tu veux passer ? Tu dois me donner des gaufres !". Vous lui dites que vous n’en avez pas, et il se met en colère. Il vous dit : "Pas de gaufres, pas de passage !". Il vous attaque, et le combat commence.', 'battle', 27, NULL), -- 27 Gaufrouille
    ('La gourmandise du gaufrogre', 'Vous suivez un sentier, quand vous sentez une odeur de gaufre. Vous suivez votre nez, et vous trouvez une cabane en gaufres. Vous vous approchez, et vous voyez un gaufrogre qui sort de la cabane. Il vous dit : "Tu veux une gaufre ? Viens, entre dans ma cabane !". Vous refusez, et il se fâche. Il vous dit : "Tu ne veux pas de gaufre ? Tu vas devenir une gaufre !". Il vous attrape, et le combat commence.', 'battle', 28, NULL), -- 28 Gaufrogre
    ('La fusion du gaufrolim', 'Vous explorez un souterrain, quand vous voyez une flaque de pâte à gaufre. Vous vous approchez, et vous voyez que la flaque bouge. Vous réalisez que c’est un gaufrolim, une créature gélatineuse qui peut changer de forme. Il vous dit : "Tu veux une gaufre ? Tu vas en avoir une !". Il se transforme en gaufre, et essaie de vous absorber. Le combat commence.', 'battle', 29, NULL), -- 29 Gaufrolim
    ('Le feu du dragaufre', 'Vous escaladez un volcan, quand vous voyez une fumée. Vous avancez, et vous voyez un dragaufre qui crache du sirop d’érable. Il vous dit : "Tu veux une gaufre ? Tu vas en avoir une !". Il vous crache du sirop brûlant, et le combat commence.', 'battle', 30, NULL), -- 30 Dragaufre
    ('La renaissance du gaufrix', 'Vous entrez dans un volcan, quand vous voyez des plumes de gaufre. Vous avancez, et vous voyez un gaufrix qui se consume. Il vous dit : "Tu veux une gaufre ? Tu vas en avoir une !". Il explose en faisant des étincelles de sucre glace, et renaît sous forme de gaufre. Le combat commence.', 'battle', 31, NULL), -- 31 Gaufrix
    ('La bulle du gaufrosaure', 'Vous marchez dans la jungle, quand vous voyez des traces de gaufre. Vous les suivez, et vous trouvez un gaufrosaure qui broute des plantes. Il vous dit : "Tu veux une gaufre ? Tu vas en avoir une !". Il rugit en faisant des bulles, et vous lance une bulle géante. Le combat commence.', 'battle', 32, NULL), -- 32 Gaufrosaure
    ('Rencontre inattendu', 'Une elfe nous parle', 'encounter', NULL, 3), -- Une nomade, Waffy
    ('Rencontre inattendu', 'Un nain nous parle', 'encounter', NULL, 4), -- Un nain artisan gaufre, Gaufredor
    ('Rencontre inattendu', 'Une femme nous parle', 'encounter', NULL, 5), -- Une charlatan, Gaufry
    ('Rencontre inattendu', 'Un homme nous parle', 'encounter', NULL, 6), -- Un forgeron, Gaufroy
    ('Rencontre inattendu', 'Une magicienne nous parle', 'encounter', NULL, 7), -- Une sorcière, Gaufine
    ('Rencontre inattendu', 'Un homme mystérieux s’approche de nous', 'encounter', NULL, 8), -- Un marchand ambulant du peuple du desert, Gaufrix
    ('Rencontre inattendu', 'Une femme nous parle', 'encounter', NULL, 9), -- Une gourmet, Madeleine
    ('Rencontre inattendu', 'Un magicien nous parle', 'encounter', NULL, 10), -- Un collectionneur sorcier, Clement
    ('Rencontre inattendu', 'Une femme nous parle', 'encounter', NULL, 11), -- Une religieuse, 'Crème'
    ('Rencontre inattendu', 'Un animal nous parle', 'encounter', NULL, 12), -- Un écureuil, 'Noisette'
    ('Rencontre inattendu', 'Un individu nous adresse la parole', 'encounter', NULL, 13), -- Un villageois, 'Beurre'
    ('Rencontre inattendu', 'Une femme nous parle', 'encounter', NULL, 14), -- Une princesse, 'Gaufrette'
    ('Rencontre inattendu', 'Un Skavens nous parle', 'encounter', NULL, 15), -- Un voleur, 'Chocotin'
    ('Rencontre inattendu', 'Une fée nous parle', 'encounter', NULL, 16), -- Une réceptionniste, 'Framboise'
    ('Rencontre inattendu', 'Un bourgegaufre nous parle', 'encounter', NULL, 17), -- Un bourgegaufre, 'Gaufresou'
    ('Événement surprise', 'Notre aventurier arrive dans un village où les habitants sont obsédés par les gaufres. Ils organisent un concours de la meilleure gaufre, et invite l’aventurier à y participer. Mais il y a un piège : les gaufres sont truffées de pièces d’or, et celui qui en mange le plus devra payer une fortune au village.', 'encounter', NULL, 2), -- Inconnu, Une aventure
    ('Événement surprise', 'L’aventurier trouve une carte au trésor qui indique l’emplacement d’une grotte secrète. Il décide de s’y rendre, le chemin est compliqué avec plein de piège, arrivé à l’emplacement, il doit résoudre une énigmes. N’ayant pas réussi à la résoudre, il repart bredouille', 'encounter', NULL, 2), -- Inconnu, Une aventure
    ('Événement surprise', 'L’aventurier trouve une flûte enchantée qui peut contrôler les animaux. Il décide de l’utiliser pour se faire des amis, mais il se rend compte qu’il ne sait pas jouer de la flûte. Il produit des sons horribles qui font fuir ou attaquer les bêtes. Il doit se débarrasser de la flûte avant de se faire dévorer, sans avoir pu se faire des compagnons.', 'encounter', NULL, 2), -- Inconnu, Une aventure
    ('Événement surprise', 'Notre hero trouve une porte secrète qui mène à un royaume souterrain. Il décide de l’explorer, mais il se rend compte qu’il est tombé dans un piège. Il est accueilli par des nains qui le prennent pour leur roi, mais qui lui imposent des épreuves ridicules et dangereuses. Il doit s’échapper avant d’être couronné, sans avoir pu découvrir les merveilles du royaume.', 'encounter', NULL, 2), -- Inconnu, Une aventure
    ('Événement surprise', 'L’aventurier trouve une auberge qui propose des chambres confortables et des gaufres à volonté. Il décide de s’y reposer, mais il se rend compte qu’il s’agit d’un repaire de bandits. Il est pris en otage par les malfrats, qui lui demandent une rançon en échange de sa liberté. Il doit négocier pour s’en sortir, sans avoir pu profiter de l’auberge.', 'encounter', NULL, 2), -- Inconnu, Une aventure
    ('Événement surprise', 'L’aventurier trouve une oasis qui offre de l’eau fraîche et des fruits juteux. Il décide de s’y rafraîchir, mais il se rend compte qu’il s’agit d’un mirage. Il est victime d’une hallucination, qui lui fait voir des choses étranges et effrayantes. Il doit retrouver ses esprits et son chemin, sans avoir pu se désaltérer à l’oasis.', 'encounter', NULL, 2),-- Inconnu, Une aventure
    ('Événement surprise', 'L’aventurier trouve une taverne qui organise des concours de boisson et de chant. Il décide de s’y amuser, mais il se rend compte qu’il a trop bu et trop chanté. Il se réveille le lendemain avec une gueule de bois et une voix cassée. Il se réveille le lendemain avec une gueule de bois et une voix cassée. Il se lève péniblement et cherche ses affaires, mais il se rend compte qu’il n’a plus rien. Il a été dépouillé de toutes ses possessions pendant son sommeil, il lui reste ses équipements et sa bourse qu’il avait bien caché. Il est nu comme un ver, et il ne sait pas qui lui a fait ce coup. Il doit trouver des habilles au plus vite !', 'encounter', NULL, 2), -- Inconnu, Une aventure
    ('Rencontre inattendu', 'Un homme nous parle', 'encounter', NULL, 18), -- 'Agent du fisc', 'Alain Poe'
    ('Rencontre inattendu', 'Un épouvantail se balade', 'encounter', NULL, 19), -- 'Ramasseur de champignon'
    ('Rencontre inattendu', 'Une femme nous parle', 'encounter', NULL, 20), -- 'Volaille de Thanksgiving'
    ('Rencontre inattendu', 'Une commère', 'encounter', NULL, 21); -- Anecdote
    
    -- ('', '', 'battle', 0, NULL), -- 
    -- ('', '', 'encounter', NULL, 0), --


-- Seeding pour public.character
--INSERT INTO "character" (nickname, strength, dexterity, intelligence, user_id, class_id, weapon_id, armor_id, event_id, purse, moral)
--VALUES 
--    ('hero1', , , , , , , , , , ),
--    ('mage2', , , , , , , , , , ),
--    ('archer3', , , , , , , , , , );


-- Seeding pour public.npc_has_quote
INSERT INTO "npc_has_quote" (npc_id, quote_id)
VALUES 
    (1, 1), -- Notre marchand, Gogo
    (2, 2), -- Inconnu, Inconnu
    (3, 3), -- Une nomade, Waffy
    (4, 4), -- Un artisan gaufre, Gaufredor
    (5, 5), -- Une charlatan, Gaufry
    (6, 6), -- Un forgeron, Gaufroy
    (7, 7), -- Une sorcière, Gaufine
    (8, 8), -- Un bourgegaufre, Gaufrix
    (9, 9), -- Une gourmet, Madeleine
    (10, 10), -- Un collectionneur, Clement
    (11, 11), -- Une religieuse', 'Crème'
    (12, 12), -- Un écureuil', 'Noisette'
    (13, 13), -- Un villageois', 'Beurre '
    (14, 14), -- Une princesse', 'Gaufrette'
    (15, 15), -- Un voleur', 'Chocotin',
    (16, 16), -- Une réceptionniste ', 'Framboise'
    (17, 17), -- Un bourgegaufre', 'Gaufresou'
    (18, 31), -- Un agent du fisc, Alain Poe
    (19, 32), -- Un Ramasseur de champignon, Mike Oz
    (20, 33), -- Une Volaille de Thanksgiving

    (21, 34), -- Repique non personnalisé
    (21, 35), -- Repique non personnalisé
    (21, 36), -- Repique non personnalisé
    (21, 37), -- Repique non personnalisé
    (21, 38), -- Repique non personnalisé
    (21, 39), -- Repique non personnalisé
    (21, 40), -- Repique non personnalisé
    (21, 41), -- Repique non personnalisé
    (21, 42), -- Repique non personnalisé
    (21, 43), -- Repique non personnalisé
    (21, 44), -- Repique non personnalisé
    (21, 45), -- Repique non personnalisé
    (21, 46), -- Repique non personnalisé
    (21, 47), -- Repique non personnalisé
    (21, 48), -- Repique non personnalisé
    (21, 49), -- Repique non personnalisé
    (21, 50), -- Repique non personnalisé
    (21, 51), -- Repique non personnalisé
    (21, 52), -- Repique non personnalisé
    (21, 53), -- Repique non personnalisé
    (21, 54), -- Repique non personnalisé
    (21, 55), -- Repique non personnalisé
    (21, 56), -- Repique non personnalisé
    (21, 57), -- Repique non personnalisé
    (21, 58), -- Repique non personnalisé
    (21, 59), -- Repique non personnalisé
    (21, 60); -- Repique non personnalisé

    -- (, ), --


INSERT INTO "monster_has_quote" (monster_id, quote_id)
VALUES 

    (1, 18),
    (1, 19),
    (1, 20),
    (1, 21),
    (1, 22),
    (1, 23),
    (1, 24),
    (1, 25),
    (1, 26),
    (1, 27),
    (1, 28),
    (1, 29),
    (1, 30),

    (2, 18),
    (2, 19),
    (2, 20),
    (2, 21),
    (2, 22),
    (2, 23),
    (2, 24),
    (2, 25),
    (2, 26),
    (2, 27),
    (2, 28),
    (2, 29),
    (2, 30),

    (3, 18),
    (3, 19),
    (3, 20),
    (3, 21),
    (3, 22),
    (3, 23),
    (3, 24),
    (3, 25),
    (3, 26),
    (3, 27),
    (3, 28),
    (3, 29),
    (3, 30),

    (4, 18),
    (4, 19),
    (4, 20),
    (4, 21),
    (4, 22),
    (4, 23),
    (4, 24),
    (4, 25),
    (4, 26),
    (4, 27),
    (4, 28),
    (4, 29),
    (4, 30),

    (5, 18),
    (5, 19),
    (5, 20),
    (5, 21),
    (5, 22),
    (5, 23),
    (5, 24),
    (5, 25),
    (5, 26),
    (5, 27),
    (5, 28),
    (5, 29),
    (5, 30),

    (6, 18),
    (6, 19),
    (6, 20),
    (6, 21),
    (6, 22),
    (6, 23),
    (6, 24),
    (6, 25),
    (6, 26),
    (6, 27),
    (6, 28),
    (6, 29),
    (6, 30),

    (7, 18),
    (7, 19),
    (7, 20),
    (7, 21),
    (7, 22),
    (7, 23),
    (7, 24),
    (7, 25),
    (7, 26),
    (7, 27),
    (7, 28),
    (7, 29),
    (7, 30),

    (8, 18),
    (8, 19),
    (8, 20),
    (8, 21),
    (8, 22),
    (8, 23),
    (8, 24),
    (8, 25),
    (8, 26),
    (8, 27),
    (8, 28),
    (8, 29),
    (8, 30),

    (9, 18),
    (9, 19),
    (9, 20),
    (9, 21),
    (9, 22),
    (9, 23),
    (9, 24),
    (9, 25),
    (9, 26),
    (9, 27),
    (9, 28),
    (9, 29),
    (9, 30),

    (10, 18),
    (10, 19),
    (10, 20),
    (10, 21),
    (10, 22),
    (10, 23),
    (10, 24),
    (10, 25),
    (10, 26),
    (10, 27),
    (10, 28),
    (10, 29),
    (10, 30),

    (11, 18),
    (11, 19),
    (11, 20),
    (11, 21),
    (11, 22),
    (11, 23),
    (11, 24),
    (11, 25),
    (11, 26),
    (11, 27),
    (11, 28),
    (11, 29),
    (11, 30),

    (12, 18),
    (12, 19),
    (12, 20),
    (12, 21),
    (12, 22),
    (12, 23),
    (12, 24),
    (12, 25),
    (12, 26),
    (12, 27),
    (12, 28),
    (12, 29),
    (12, 30),

    (13, 18),
    (13, 19),
    (13, 20),
    (13, 21),
    (13, 22),
    (13, 23),
    (13, 24),
    (13, 25),
    (13, 26),
    (13, 27),
    (13, 28),
    (13, 29),
    (13, 30),

    (14, 18),
    (14, 19),
    (14, 20),
    (14, 21),
    (14, 22),
    (14, 23),
    (14, 24),
    (14, 25),
    (14, 26),
    (14, 27),
    (14, 28),
    (14, 29),
    (14, 30),

    (15, 18),
    (15, 19),
    (15, 20),
    (15, 21),
    (15, 22),
    (15, 23),
    (15, 24),
    (15, 25),
    (15, 26),
    (15, 27),
    (15, 28),
    (15, 29),
    (15, 30),

    (16, 18),
    (16, 19),
    (16, 20),
    (16, 21),
    (16, 22),
    (16, 23),
    (16, 24),
    (16, 25),
    (16, 26),
    (16, 27),
    (16, 28),
    (16, 29),
    (16, 30),

    (17, 18),
    (17, 19),
    (17, 20),
    (17, 21),
    (17, 22),
    (17, 23),
    (17, 24),
    (17, 25),
    (17, 26),
    (17, 27),
    (17, 28),
    (17, 29),
    (17, 30),
    
    (18, 18),
    (18, 19),
    (18, 20),
    (18, 21),
    (18, 22),
    (18, 23),
    (18, 24),
    (18, 25),
    (18, 26),
    (18, 27),
    (18, 28),
    (18, 29),
    (18, 30),

    (19, 18),
    (19, 19),
    (19, 20),
    (19, 21),
    (19, 22),
    (19, 23),
    (19, 24),
    (19, 25),
    (19, 26),
    (19, 27),
    (19, 28),
    (19, 29),
    (19, 30),

    (20, 18),
    (20, 19),
    (20, 20),
    (20, 21),
    (20, 22),
    (20, 23),
    (20, 24),
    (20, 25),
    (20, 26),
    (20, 27),
    (20, 28),
    (20, 29),
    (20, 30),

    (21, 18),
    (21, 19),
    (21, 20),
    (21, 21),
    (21, 22),
    (21, 23),
    (21, 24),
    (21, 25),
    (21, 26),
    (21, 27),
    (21, 28),
    (21, 29),
    (21, 30),

    (22, 18),
    (22, 19),
    (22, 20),
    (22, 21),
    (22, 22),
    (22, 23),
    (22, 24),
    (22, 25),
    (22, 26),
    (22, 27),
    (22, 28),
    (22, 29),
    (22, 30),

    (23, 18),
    (23, 19),
    (23, 20),
    (23, 21),
    (23, 22),
    (23, 23),
    (23, 24),
    (23, 25),
    (23, 26),
    (23, 27),
    (23, 28),
    (23, 29),
    (23, 30),

    (24, 18),
    (24, 19),
    (24, 20),
    (24, 21),
    (24, 22),
    (24, 23),
    (24, 24),
    (24, 25),
    (24, 26),
    (24, 27),
    (24, 28),
    (24, 29),
    (24, 30),

    (25, 18),
    (25, 19),
    (25, 20),
    (25, 21),
    (25, 22),
    (25, 23),
    (25, 24),
    (25, 25),
    (25, 26),
    (25, 27),
    (25, 28),
    (25, 29),
    (25, 30),

    (26, 18),
    (26, 19),
    (26, 20),
    (26, 21),
    (26, 22),
    (26, 23),
    (26, 24),
    (26, 25),
    (26, 26),
    (26, 27),
    (26, 28),
    (26, 29),
    (26, 30),

    (27, 18),
    (27, 19),
    (27, 20),
    (27, 21),
    (27, 22),
    (27, 23),
    (27, 24),
    (27, 25),
    (27, 26),
    (27, 27),
    (27, 28),
    (27, 29),
    (27, 30),

    (28, 18),
    (28, 19),
    (28, 20),
    (28, 21),
    (28, 22),
    (28, 23),
    (28, 24),
    (28, 25),
    (28, 26),
    (28, 27),
    (28, 28),
    (28, 29),
    (28, 30),

    (29, 18),
    (29, 19),
    (29, 20),
    (29, 21),
    (29, 22),
    (29, 23),
    (29, 24),
    (29, 25),
    (29, 26),
    (29, 27),
    (29, 28),
    (29, 29),
    (29, 30),

    (30, 18),
    (30, 19),
    (30, 20),
    (30, 21),
    (30, 22),
    (30, 23),
    (30, 24),
    (30, 25),
    (30, 26),
    (30, 27),
    (30, 28),
    (30, 29),
    (30, 30),

    (31, 18),
    (31, 19),
    (31, 20),
    (31, 21),
    (31, 22),
    (31, 23),
    (31, 24),
    (31, 25),
    (31, 26),
    (31, 27),
    (31, 28),
    (31, 29),
    (31, 30),

    (32, 18),
    (32, 19),
    (32, 20),
    (32, 21),
    (32, 22),
    (32, 23),
    (32, 24),
    (32, 25),
    (32, 26),
    (32, 27),
    (32, 28),
    (32, 29),
    (32, 30),

    (33, 18),
    (33, 19),
    (33, 20),
    (33, 21),
    (33, 22),
    (33, 23),
    (33, 24),
    (33, 25),
    (33, 26),
    (33, 27),
    (33, 28),
    (33, 29),
    (33, 30),


    (34, 18),
    (34, 19),
    (34, 20),
    (34, 21),
    (34, 22),
    (34, 23),
    (34, 24),
    (34, 25),
    (34, 26),
    (34, 27),
    (34, 28),
    (34, 29),
    (34, 30),

    (35, 18),
    (35, 19),
    (35, 20),
    (35, 21),
    (35, 22),
    (35, 23),
    (35, 24),
    (35, 25),
    (35, 26),
    (35, 27),
    (35, 28),
    (35, 29),
    (35, 30),

    (36, 18),
    (36, 19),
    (36, 20),
    (36, 21),
    (36, 22),
    (36, 23),
    (36, 24),
    (36, 25),
    (36, 26),
    (36, 27),
    (36, 28),
    (36, 29),
    (36, 30),

    (37, 18),
    (37, 19),
    (37, 20),
    (37, 21),
    (37, 22),
    (37, 23),
    (37, 24),
    (37, 25),
    (37, 26),
    (37, 27),
    (37, 28),
    (37, 29),
    (37, 30),

    (38, 18),
    (38, 19),
    (38, 20),
    (38, 21),
    (38, 22),
    (38, 23),
    (38, 24),
    (38, 25),
    (38, 26),
    (38, 27),
    (38, 28),
    (38, 29),
    (38, 30),

    (39, 18),
    (39, 19),
    (39, 20),
    (39, 21),
    (39, 22),
    (39, 23),
    (39, 24),
    (39, 25),
    (39, 26),
    (39, 27),
    (39, 28),
    (39, 29),
    (39, 30),

    (40, 18),
    (40, 19),
    (40, 20),
    (40, 21),
    (40, 22),
    (40, 23),
    (40, 24),
    (40, 25),
    (40, 26),
    (40, 27),
    (40, 28),
    (40, 29),
    (40, 30),

    (41, 18),
    (41, 19),
    (41, 20),
    (41, 21),
    (41, 22),
    (41, 23),
    (41, 24),
    (41, 25),
    (41, 26),
    (41, 27),
    (41, 28),
    (41, 29),
    (41, 30),

    (42, 18),
    (42, 19),
    (42, 20),
    (42, 21),
    (42, 22),
    (42, 23),
    (42, 24),
    (42, 25),
    (42, 26),
    (42, 27),
    (42, 28),
    (42, 29),
    (42, 30),

    (43, 18),
    (43, 19),
    (43, 20),
    (43, 21),
    (43, 22),
    (43, 23),
    (43, 24),
    (43, 25),
    (43, 26),
    (43, 27),
    (43, 28),
    (43, 29),
    (43, 30),

    (44, 18),
    (44, 19),
    (44, 20),
    (44, 21),
    (44, 22),
    (44, 23),
    (44, 24),
    (44, 25),
    (44, 26),
    (44, 27),
    (44, 28),
    (44, 29),
    (44, 30);

    -- (?, 18),
    -- (?, 19),
    -- (?, 20),
    -- (?, 21),
    -- (?, 22),
    -- (?, 23),
    -- (?, 24),
    -- (?, 25),
    -- (?, 26),
    -- (?, 27),
    -- (?, 28),
    -- (?, 29),
    -- (?, 30);


COMMIT;