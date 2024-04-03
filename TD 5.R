#Exercice

#1Créer une graphique vide avec comme borne d'abscisse [-5,5] et d'ordonnées [0,1].
par(mfrow = c(1,1))
plot(NA, xlim=c(-5, 5), ylim=c(0, 1), xlab="X", 
     ylab="Densité de probabilité", 
     main="Densités de probabilité \n de lois normales")

#2Programmer une boucle for qui à chaque itération, ajoute une courbe densité issue d'une des 4 combinaisons de paramètres de loi normale suivant :
#N(μ=0, σ=0.45)
#N(μ=0, σ=1)
#N(μ=0, σ=2.25)
#N(μ=-2, σ=0.7)

moyennes <- c(0, 0, 0, -2)
sigmas <- c(0.45, 1, 2.25, 0.7)
colors <- c("red", "blue", "green", "orange")
legend_labels <- c()
for (i in 1:length(moyennes)) {
  serie = rnorm(n = 1000, 
                mean = moyennes[i], 
                sd = sigmas[i])
  lines(density(serie), col = colors[i])
  legend_labels <- c(legend_labels, paste("m =", moyennes[i], ",", "s =", sigmas[i]))
}

legend("topright", legend=legend_labels, col=colors, lwd=2, cex=0.8)

#3 Simuler une loi normale N(μ=0, σ=1) de taille 10 000.
serie = rnorm(n = 1e4, mean = 0, sd = 1)

#4 Contruire l'histograme de la distribution de la série avec sa courbe densité.

hist(serie, main = "loi normal centrée-réduite",
     probability = TRUE)
lines(density(serie))

#5 Calculer la médiane de la série.
median(serie)

#6 Calculer les quartiles de la série.

quantile(serie)

#7Calculer les centiles de la série. Quelle valeur de la série correspond au centile 0.95 ?

quantile(serie, 
         probs = seq(from = 0, 
                     to = 1, by = 0.01))

quantile(serie, 
         probs = 0.95) 

#8 Calculer la valeur théorique à l'aide de la fonction qnorm(). Vérifier cette 
#valeur avec la fonction réciproque pnorm()

qnorm(p = 0.95, mean = 0, sd = 1)
pnorm(q = 1.644854, mean = 0, sd = 1)

#9Quelle est la valeur théorique pour P(X < x) = 0.975.
qnorm(p = 0.975, mean = 0, sd = 1)

#10 Quelle est la probabilité théorique pour P(X >= 1.96) = p.

1 - pnorm(q = 1.96, mean = 0, sd = 1)

#11A l'aide de boucle for. Construire une vecteur avec les probabilités de la 
#première colonne de la table de loi normale. On souhaite une précision avec uniquement 4 décimales.
indices_lignes = seq(from = 0, to = 3.9, by = 0.1)

#on crée un vecteur vide pour ajouter les probas au fur et à mesure
all_probas = c()
#On parcourt les indices lignes
for (i in indices_lignes){
  proba = pnorm(q = i, mean = 0, sd = 1)
  #on ajoute la nouvelle proba au vecteur existant
  all_probas = c(all_probas,proba)
  all_probas = round(all_probas,digits = 4)
}

#12 Modifier ce code pour construire la table de loi normale.
indices_colones = seq(from = 0.00, to = 0.09, by = 0.01)
indices_lignes = seq(from = 0, to = 3.9, by = 0.1)

resultat = NULL
for (j in indices_colones) {
  all_probas = c()
  for (i in indices_lignes){
    quantile = i + j
    proba = pnorm(q = quantile, mean = 0, sd = 1)
    all_probas = c(all_probas,proba)
    all_probas = round(all_probas,digits = 4)
  }

  resultat = cbind(resultat,all_probas)
}
#13Modifier le nom des lignes et colonnes.

class(resultat)
table = data.frame(resultat)
colnames(table) = indices_colones
rownames(table) = indices_lignes
View(table)

#14Produire les tailles d'une population simulée de 10.000.000 de français 
#répartis suivant une loi normale *N(171,9). Stocker ces tailles dans un vecteur population.
moyenne_pop<-171
sd_pop<-9
population<-rnorm(n = 1e7, 
                  mean=moyenne_pop, 
                  sd=sd_pop)
#15Calculer la moyenne et l'écart-type de la population. Retrouvez-vous les valeurs attendues ?
mean(population)
sd(population)
#16Etablir l'histogramme de la taille. Retrouvez-vous la forme bien connues ?
hist(population)
#17Combien de personnes ont une taille inférieur à 190cm ? Combien devriez-vous en trouver théoriquement ?
#observé
pop190 = population[population < 190]
length(pop190)
length(pop190) / length(population)

#en théorie
pnorm(q = 190, mean=moyenne_pop, sd=sd_pop)*1e7
#18Combien de personnes ont une taille supérieur à 200 cm ? Combien devriez-vous en trouver théoriquement ?.
#observé
pop200 = population[population >= 200]
length(pop200)
length(pop200) / length(population)

#en théorie
#proba de P( X < 200cm)
proba_inf_200 = pnorm(q = 200, mean=moyenne_pop, sd=sd_pop)
#proba de P( X >= 200cm)
1 - proba_inf_200
#19Tirez un échantillon de taille 100 dans la population initiale, à l'aide de 
#la fonction sample. Quelle est la taille moyenne dans l'échantillon ? Quelle est 
#l'écart-type dans l'échantillon ? Ces deux valeurs sont-elles proches de celles de la population ?
taille_ech<-100
echantillon<-sample(x = population, 
                    size = taille_ech, 
                    replace = TRUE)
mean(echantillon)
sd(echantillon)
#20 A partir de l'écart-type estimé, calculez la largeur du demi-intervalle de confiance,
#puis les bornes inférieures et supérieures de l'intervalle de confiance (toujours à 95%).
#Pour rappel, la formule est disponible ici.
largeur<-qnorm(p = 0.975,mean=0,sd=1)*sd_pop/sqrt(taille_ech)
borne_inf<-moyenne_pop-largeur
borne_sup <-moyenne_pop+largeur
#21 A l'aide de la fonction replicate(), tirez 1000 échantillons de taille 100. Stockez
#dans un dataframe la moyenne et l'écart-type de chaque échantillon à l'aide de la fonction apply().
taille_ech<-100
nb_replicat<-1000
echantillons<-replicate(n = nb_replicat,
                        expr =  sample(population,
                                       taille_ech, 
                                       replace = TRUE))

moyennes<-apply(X = echantillons,
                MARGIN = 2,
                FUN = function(x) mean(x))
ecart_types<-apply(echantillons,
                   MARGIN = 2,
                   FUN = function(x) sd(x))
#22 Tracer l'histogramme des moyennes des échantillons. Retrouve-t-on une forme connue ?
hist(moyennes)
#23 Calculez la moyenne des moyennes des échantillons, ainsi que l'écart-type des moyennes des échantillons.
mean(moyennes)
sd(moyennes)
#24Combien d'échantillons ont une moyenne supérieure à 172,8cm ? Quelle est le nombre théorique ?
#observé
moy172 = moyennes[moyennes > 172]
length(moy172)
length(moy172) / length(moyennes)

#en théorie
#proba de P( X < 172cm)
proba_inf_172 = pnorm(q = 172, 
                      mean=moyenne_pop, 
                      sd=sd_pop/sqrt(taille_ech))
#proba de P( X >= 172cm)
1 - proba_inf_172
#25