#TD3
#Exercice 1

#1
#Importer le jeu de données pokemon.xlsx à l’aide du package readxl."

library(readxl)
pokemon = read_excel(path="L:/BUT/SD/Promo 2023/kcostisor/pokemon.xlsx", sheet = "pokemon")

#2
#Combien de lignes, colonnes sont présentes dans ce dataset (utilisez les fonctions adaptées) ?
dim(pokemon)
ncol(pokemon)
nrow(pokemon)

#3
#Affichez un résumé des données avec la fonction adaptée. On remarque peut-être 
#que les variables qualitatives n'ont pas de statistique. En R, il est important
#que les variables qualitatives soit de type factor.

summary(pokemon)

#4
#On souhaite analyser les variables generation, is_legendary, et type en tant que
#variables qualitatives. Modifier le type de ces variables pour les transformer en
#type factor
pokemon$is_legendary = as.factor(pokemon$is_legendary)
pokemon$generation = as.factor(pokemon$generation)
pokemon$type = as.factor(pokemon$type)

#5
#Affichez un nouveau résumé des données avec la fonction adaptée.
summary(pokemon)

#Exercice 2
#1
#Créer une colonne attack_group avec la valeur attack+ si la valeur d'attack est
#supérieure ou égale à la médiane, sinon attack-. Convertir cette variable en factor
#puis effectuer un résumé de cette colonne avec la fonction summary().

med = median(pokemon$attack)
pokemon$attack_group = ifelse(pokemon$attack >= med,"attack+","attack-")
pokemon$attack_group = as.factor(pokemon$attack_group)
summary(pokemon$attack_group)

#2
#Créer une colonne water_fire avec la valeur yes si le type est water ou fire, 
#sinon renseigner la valeur no. Convertir cette variable en factor puis effectuer
#un résumé de cette colonne avec la fonction summary().
pokemon$water_fire = ifelse(pokemon$type %in% c("water","fire"), "yes","no")
pokemon$water_fire = as.factor(pokemon$water_fire)
summary(pokemon$water_fire)

#3
#Créer une colonne best avec la valeur yes si la valeur d'attack fait parti du 
#troisième quartile et si la valeur de defense fait parti du troisième quartile 
#et si la valeur de speed fait parti du troisième quartile, sinon renseigner la 
#valeur no. Convertir cette variable en factor puis effectuer un résumé de cette
#colonne avec la fonction summary().

q3_attack = quantile(pokemon$attack, probs = 0.75)
q3_defense = quantile(pokemon$defense, probs = 0.75)
q3_speed = quantile(pokemon$speed, probs = 0.75)
pokemon$best = ifelse(pokemon$attack > q3_attack &
                        pokemon$defense > q3_defense &
                        pokemon$speed > q3_speed , "yes","no")
pokemon$best <-as.factor(pokemon$best)
summary(pokemon$best)

#4
#Filtrer les données dans un objet nommé requete avec les pokemons ayant des 
#valeurs manquantes sur la colonne weight_kg.

requete = subset(pokemon, is.na(weight_kg))
View(requete)

#5
#Filtrer les données dans un objet nommé requete avec les pokemons n'ayant pas 
#des valeurs manquantes sur la colonne weight_kg.

requete = subset(pokemon, !is.na(weight_kg))
View(requete)

#6
#Créer des nouvelles variables nommées weight_kgNa et height_mNA avec les mêmes 
#valeurs pour les valeurs déjà renseignées mais en remplaçant les valeurs manquantes 
#NA par leur valeurs médianne.

med_weight_kg = median(pokemon$weight_kg, na.rm = TRUE)
pokemon$weight_kgNa = ifelse(is.na(pokemon$weight_kg) , 
                             med_weight_kg ,
                             pokemon$weight_kg)

med_height_m = median(pokemon$height_m, na.rm = TRUE)
pokemon$height_mNA = ifelse(is.na(pokemon$height_m) , 
                            med_height_m ,
                            pokemon$height_m)

#7
#Créer une nouvelle variable nommée weight_group en regroupant en 3 tranches 
#avec les labels léger / moyen / lourd.




