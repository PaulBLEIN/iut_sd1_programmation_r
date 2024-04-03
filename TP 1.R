#TP1
#Excercice 1

#1.
iris
class(iris)
#Afficher le jeu de données iris puis afficher la classe de l'objet iris.

#2
View(iris)
#Afficher le jeu de données iris dans une vue avec la fonction View()

#3
nrow(iris)
#Afficher le nombre de lignes avec la fonction nrow()

#4
ncol(iris)
#Afficher le nombre de colonne avec la fonction ncol()

#5
colnames(iris)
#Afficher le nom des colonnes avec la fonction colnames()

#6
summary(iris)
#Afficher un résumé du dataframe avec la fonction summary()

#7
iris[c("Sepal.Length","Species")]
#Afficher uniquement les colonnes Sepal.Length et Species.

#8
iris[c(100,103,105),]
#Afficher uniquement la ligne 100,103 et 105.

#9
iris[c(50,100),]
#Afficher uniquement les lignes 50 à 100.

#10
mean(iris$Sepal.Length)
#Calculer la moyenne de la variable Sepal.Length

#11
median(iris$Sepal.Width)
#Calculer la médiane de la variable Sepal.Width.

#12
sd(iris$Petal.Length)
#Calculer l'écart-type de la variable Petal.Length.

#13
quantile(iris$Petal.Width)
#Calculer les déciles de la variable Petal.Width.

#Excercice 2

#1
dfManga <- read.csv("L:/BUT/SD/Promo 2023/kcostisor/manga.csv", header = TRUE , dec = "." , sep=",")
dfAnime <- read.csv("L:/BUT/SD/Promo 2023/kcostisor/anime.csv", header = TRUE , dec = "." , sep=",")
class(dfManga)
class(dfAnime)
#Importer le jeu de données manga.csv dans un objet appelé dfManga et 
#le jeu de données anime.csv dans un objet appelé dfAnime. Puis 
#afficher la classe des deux objets pour vérifier que la classe est data.frame.

#2
View(dfManga)
View(dfAnime)
#Afficher les jeux de données dans des vues pour les visualiser

#3
dim(dfManga)
dim(dfAnime)
#Afficher le nombre de lignes et colonnes avec la fonction dim()

#4
mean(dfAnime$Score)
mean(dfManga$Score)
#Calculer la moyenne de la variable Score pour les deux dataframe. Quelle est 
#la moyenne la plus élevée ?

#5
sum(dfAnime$Vote)
sum(dfManga$Vote)
#Calculer le nombre total de votes de la variable Vote pour les deux dataframe. 
#Ou y a t-il le plus de votes ?

#6
sd(dfAnime$Score)
sd(dfManga$Score)
#Calculer l'écart-type des notes de la variable Score pour les deux dataframe. 
#Ou est l'échantillon le plus homogènes au niveau des Score ?

#7
quantile(dfManga$Score, probs = seq(from = 0.1, to = 0.9, by = 0.1))
quantile(dfAnime$Score, probs = seq(from = 0.1, to = 0.9, by = 0.1))
#Calculer les déciles des notes de la variable Score pour les deux dataframe. 
#Quelle dataframe a le décile 1 le plus petit ?

#Les fonctions subset(), table() et prop.table()
#1

note <- subset(dfManga,Score >9)
nrow(note)
#Combien de Manga ont une note strictement supérieure à 9/10 ?

#2
votes <- subset(dfManga,Vote >= 200000)
nrow(note)
#Combien de Manga ont 200000 votes ou plus ?

#3
baw <- subset(dfManga,Vote >= 200000 & Score > 8)
nrow(baw)
#Combien de Manga ont strictement plus de 200000 votes et plus de 8/10 ?

#4
bouh <- subset(dfManga,Score >=7 & Score <=8)
nrow(bouh)
#Combien de Manga ont une note comprise entre 7/10 et 8/10 ?

#Filtre sur les Animes 

#1
variable <- table(dfAnime$Rating)
print(variable)
length(variable)
prop.table(variable)
#Calculer les effectifs de la variable Rating(). Combien de modalité de la 
#variable existe-t-il ? Calculer ensuite les effectifs en pourcentage.

#2
cab <- subset(dfAnime,Rating == "R - 17+ (violence & profanity)")
nrow(cab)
#Combien d'Anime sont concernés par le Rating : R - 17+ (violence & profanity) ?

#3
cab2 <- subset(dfAnime,Rating == "R - 17+ (violence & profanity)" & Score > 8)
nrow(cab2)
#Combien d'Anime sont concernés par le Rating : R - 17+ (violence & profanity) 
#et ont une note supérieur à 8/10 ?

#4
cab3 <- subset(dfAnime, Rating != "R - 17+ (violence & profanity)")
nrow(cab3)
#Combien d'Anime ne correspondent pas au Rating : R - 17+ (violence & profanity) ?

#5
cab4 <- subset(dfAnime, Rating %in% c("PG - Children","G - All Ages"))
nrow(cab4)
#Combien d'Anime correspondent au Rating : PG - Children et G - All Ages ?

#6
cab5 <- subset(dfAnime, !Rating %in% c("PG - Children","G - All Ages"))
nrow(cab5)
#Combien d'Anime ne correspondent pas au Rating : PG - Children et G - All Ages ?

#7
cab6 <- subset(dfAnime, Score <9 & Vote < 400000)
nrow(cab6)
#Combien d'Anime ont une note supérieure à 9/10 ou ont plus de 400000 votes ?

#Les fonctions rbind() et write.table()

#1
dfAnime1 <- dfAnime[ , c("Title","Score","Vote","Ranked")]
dfManga1 <- dfManga[ , c("Title","Score","Vote","Ranked")]
#Modifier les deux dataframe en ne conservant que les variables : Title,Score,Vote,Ranked.

#2
dfAnime1$Type <- "Anime"
dfManga1$Type <- "Manga"
#Pour chaque dataframe créer une colonne Type avec pour valeur Anime ou Manga selon l'objet.

#3
dfConcat <- rbind(dfManga1,dfAnime1)
View(dfConcat)
#Compiler les deux dataframe avec la fonction rbind() dans un objet appelé dfConcat. 
#Vérifier le résultat avec dans une vue.

#4
write.table(x = dfConcat, file = "L:/BUT/SD/Promo 2023/kcostisor/cava?.csv",
            sep = ";",row.names = FALSE)
#Exporter le dataframe dans un fichier csv nommée ExportTp1.csv avec la fonction write.table.

