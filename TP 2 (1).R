#TP2
#Exercice1

#1
#Importer le jeu de données fao.csv avec la fonction read.csv() uniquement dans 
#un objet appelé df. Vérifier le type des colonnes pour vérifier que les colonnes
#aient le bon type.

dffao =read.csv("L:/BUT/SD/Promo 2023/kcostisor/fao.csv",header = TRUE, dec = ",",sep=";")

#2
#Combien de pays sont présents dans ce dataset ?

nrow(dffao)#permet de calculer toutes les lignes
class(dffao)
#Il ya 186 pays dans ce dataset

#3
#Affichez un résumé des données avec la fonction adaptée. Il semble que ce jeu 
#de données présente quelques valeurs manquantes.
summary(dffao) #Permet de voir le resumé de toutes ses colonnes

#Exercice 2
#1
#Quelle est la disponibilité alimentaire moyenne mondiale en Kcal/personne/jour ?
mean(dffao$Dispo_alim, na.rm= TRUE)

#2
#Quelle est le nombre d’habitant dans le monde ?
sum(dffao$Population, na.rm= TRUE)

#3
#Quelle est l’écart-type du volume des exportations et importations de viande.
sd(dffao$Import_viande, na.rm=TRUE)
sd(dffao$Export_viande, na.rm=TRUE)

#4
#Quelle est la médiane du volume de production de viande ?
median(dffao$Prod_viande,na.rm=TRUE)

#5
#Calculez les quartiles du nombre de Kcal de disponibilité alimentaire.
quantile(dffao$Dispo_alim, na.rm = TRUE)

#6
#Calculez les centiles du volume d’importation de viande.
quantile(dffao$Import_viande,probs=seq(0,1,0.01),na.rm = TRUE)
min(dffao$Import_viande)
max(dffao$Import_viande)

#Exercice 3

#1
#Construire une requête pour extraire les lignes du dataset avec les 5 pays les 
#moins peuplés.
pays_moins_peuples <- head(dffao[order(dffao$Population), ], 5)
print(pays_moins_peuples)

#2
#Construire une requête pour extraire les lignes du dataset avec les 5 pays les 
#plus peuplés.

pays_plus_peuplées = head(dffao[order(-dffao$Population),],5)
print(pays_plus_peuplées)

#3
#Construire une requête pour extraire les lignes du dataset avec les 5 pays qui 
#produisent le plus de viande.
pays_plus_viande = head(dffao[order(-dffao$Prod_viande),],5)
print(pays_plus_viande)

#4
#Construire une requête pour extraire les lignes du dataset avec les 5 pays qui 
#importent le plus de viande.
pays_plus_importe = head(dffao[order(decreasing = TRUE ,dffao$Import_viande),],5)
print(pays_plus_importe)

#5
#En moyenne, le besoin énergétique moyen d’une adulte est de 2300 kcal par jour.
#Construire une requête pour extraire les lignes du dataset avec les pays qui 
#ont une disponibilité alimentaire supérieure ou égale à 2300 kcal. Combien de pays sont concernés ?

extraction = subset(dffao, Dispo_alim > 2300)
print(extraction)

#6
#Construire une requête pour extraire les lignes du dataset avec les pays qui 
#ont une disponibilité alimentaire strictement supérieure à 3500 kcal et qui 
#importe un volume de viande supérieure ou égale à 1 000 000 tonnes par an. Combien de pays sont concernés ?

extraction2 = subset(dffao, Dispo_alim > 3500 & Import_viande > 1000)
print(extraction2)

#7
#Construire une requête pour extraire les lignes du dataset avec la France et la Belgique.
extraction3 = subset(dffao ,dffao$Nom %in% c("France","Belgique"))
print(extraction3)
extraction4 = subset(dffao, Nom == "France" | Nom == "Belgique") #le symbole | = a ou 
print(extraction4)

#Exercice 4 
#1
#Ajouter une colonne nommée part_export qui correspond à la part des exportations
#de viande par rapport à la production de viande.
#Ajouter une colonne nommée part_export qui correspond à la part des exportations de viande par rapport à la production de viande.


