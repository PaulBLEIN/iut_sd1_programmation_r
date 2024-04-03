#TD 1
#Excercice 1
#1
a <- 10
b <- 5
#Créer un objet a avec la valeur 10 et un objet b avec la valeur 5.

#2
resultat <- a * b
print(resultat)
#Multiplier les deux objets et stocker le résultat dans un objet resultat.
#Afficher cet objet avec la fonction print() 

#3
A <- 7.2
B <- 10.1
print("On a trop de case donc on risque de ce perdre")
#Créer un objet A avec la valeur 7.2 et un objet B avec la valeur 10.1. 
#Que remarquons-nous avec les deux premiers objets ?

#4
resultat <- A + B 
print(resultat)
print("La précédente valeur de l'object resultat a été supprimée et 
      remplacée par la somme de A et B. ")
#Additionner les deux objets A et B puis stocker le résultat dans un
#objet resultat. Que remarquons-nous avec le précédent objet resultat ?

#5
rm(a,b,A,B,resultat)
#Supprimer l'ensemble des objets des questions précédentes avec la
#fonction rm()

#Excercice 2 
#1
vecteur <- c(1,2,3,4,5)
class(vecteur)
vecteur[3]
#Créer un vecteur numérique de nombres de 1 à 5 et afficher sa classe.
#Afficher le troisième élément du vecteur.

#2
v1 <- 1:5
class(v1)
#Ensuite, créer un vecteur v2 en ajoutant 3 à chaque élément de v1.

#3
v2 <- v1 +3
#Ensuite, créer un vecteur v2 en ajoutant 3 à chaque élément de v1.

#4
v3 <- 1:6
#Créer un vecteur v3 avec les nombres de 1 à 6.

#5
v4 <- v3^2
#Ensuite, créer un vecteur v4 avec les carrés de chaque élément 
#de v3.

#6
v5 <- v4/2
#Ensuite, créer un vecteur v5 en divisant chaque élément de v4 par 2.

#7
vecteur <- c("Lundi","Mardi","Mercredi","Jeudi",
             "Vendredi","Samedi","Dimanche")
class(vecteur)
vecteur[c(2,7)]
#Créer un vecteur caractère avec les jours de la semaine et afficher 
#sa classe. Afficher le 2ème et 7ème éléments du vecteur.

#8
vecteur1 <- c(TRUE,FALSE)
class(vecteur1)
#Créer un vecteur avec des valeurs booléennes et afficher sa classe.

#9
vecteur2 <- c(1.2,3.3,6.9,4.8)
class(vecteur2)
vecteur2[-3]
#Créer un vecteur numérique contenant des nombres décimaux et afficher sa classe
#. Afficher tous les éléments sauf le 3ème.

#10
vecteur3 <- c("Janvier","Fevrier","Mars","Avril","Mai","Juin","Juillet","Aout",
              "Septembre","Octobre","Novembre","Decembre")
class(vecteur3)
vecteur3[c(1,2,3)]
#Créer un vecteur caractère avec le nom des mois et afficher sa classe. Afficher
#les mois du premier trimestre.

#11
vecteur4 <- c(-4,-3,-10,-121)
class(vecteur4)
vecteur4[c(4,1)]
#Créer un vecteur numérique avec des nombres négatifs et afficher sa classe. 
#Afficher le dernier et premier éléments du vecteur.

#12
vecteur5 <- c("Ananas","Banane","Noix de coco")
class(vecteur5)
vecteur5[-c(1,2)]
#Créer un vecteur caractère contenant des noms de fruits et afficher sa classe. 
#Afficher tous les éléments sauf les deux premiers.

#13
vecteur6 <- c(1, 2, NA, 4, 5)
class(vecteur6)

#Les fonctions c(), seq(), lenght()

#1
seq1 <- seq(from = 1, to = 10)
length(seq1)
#Créer une séquence de nombres de 1 à 10 puis calculer la longueur du vecteur.

#2
seq2 <- seq(from=2 , to = 20 , by=2)
length(seq2)
#Générer une séquence de nombres pairs de 2 à 20 puis calculer la longueur du 
#vecteur.

#3
seq3 <- seq(from=0 , to=-5)
length(seq3)
#Créer une séquence décroissante de 0 à -5 puis calculer la longueur du vecteur.

#4
seq4 <- seq(from=5 , to=50 , by=5)
length(seq4)
#Générer une séquence de nombres de 5 à 50 avec un pas de 5 puis calculer la 
#longueur du vecteur.

#5
seq5<- seq(from=10 , to = 1, by=-1)
length(seq5)
#Créer une séquence de 10 à 1 en ordre décroissant puis calculer la longueur du 
#vecteur.

#6 
seq6 <- seq(from=0 , to=1 , by=0.1)
length(seq6)
#Générer une séquence de nombres de 0 à 1 avec un pas de 0.1 puis calculer la 
#longueur du vecteur.

#7
seq7 <- seq(from=5 ,to = -5 , by= -1 )
length(seq7)

#Les fonctions c(), rep()
#1
rep1 <- rep(3 , times=5)
#Répéter le nombre 3 cinq fois et stocker le résultat dans un vecteur.

#2
rep2 <- rep(c("A","B","C"), times=3 )
#Créer un vecteur répétant les lettres 'A', 'B', 'C' trois fois chacune.

#3
rep3 <- rep(c(1:3), times = 3 )
#Répéter la séquence de nombres de 1 à 3 trois fois et stocker le résultat dans 
#un vecteur.

#Excercice 3
#1
vecteur7 <- runif(n = 5, min = 0, max = 1)
vecteur8
mean(vecteur7)
median(vecteur7)
min(vecteur7)
max(vecteur7)
#Générez un vecteur de 5 nombres aléatoires compris entre 0 et 1 en utilisant la
#fonction runif().

#2
vecteur8 <- runif(n = 10, min = -5, max = 5)
vecteur8
mean(vecteur8)
median(vecteur8)
min(vecteur8)
max(vecteur8)
#Créez une séquence de 10 nombres aléatoires compris entre -5 et 5 à l'aide de 
#la fonction runif().

#Les fonctions rnorm(), mean(), sd(), hist(), quantile()
#1
echantillon <- rnorm(n = 20, mean = -2, sd = 3)
moyenne <- mean(echantillon)
ecart_type <- sd(echantillon)
print(paste("Moyenne : ", moyenne))
print(paste("Écart-type : ", ecart_type))
hist(echantillon)

#2 
echantillon2 <- rnorm(n=2000 , mean=-2,sd=3)
moyenne2 <- mean(echantillon2)
ecart_type2 <- sd(echantillon2)
print(paste("Moyenne : ", moyenne2))
print(paste("Ecart_type : ", ecart_type2))
hist(echantillon2)

#4
quantile(echantillon, probs = c(0.25))
quantile(echantillon, probs = c(0.50))
quantile(echantillon, probs = c(0.75))
#Calculez les quantiles à 25%, 50%, puis 75% de cet échantillon précédent.

#5 





