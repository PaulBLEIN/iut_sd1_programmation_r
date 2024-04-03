#TD 2
#Exercice 2
#2
getwd()
#3
setwd(dir = "L:/BUT/SD/Promo 2023/kcostisor/dataset")
getwd()
#4
bodies_karts = read.csv(file = "bodies_karts.csv", header = TRUE, sep = ";", dec = ",")
tires = read.csv(file = "tires.csv", header = TRUE, sep = "\t", dec = ",")
gliders = read.csv(file = "gliders.csv", header = TRUE, sep = "|", dec = ".")
drivers = read.csv(file = "drivers.csv", header = TRUE, sep = ";", dec = ",")
#5
dim(bodies_karts)
dim(tires)
dim(gliders)
dim(drivers)
#6
summary(bodies_karts)
summary(tires)
summary(gliders)
summary(drivers)
#7
plot(x = drivers$Weight,
     y = drivers$Acceleration, 
     main = "Drivers : Weight / Acceleration")
#8
cor(x = drivers$Weight,
    y = drivers$Acceleration)
#9
covXY = cov(x = drivers$Weight,
            y = drivers$Acceleration)
sX = sd(drivers$Weight)
sY = sd(drivers$Acceleration)
print(covXY / (sX*sY))
#10
coefCorr = cor(x = drivers$Weight,
               y = drivers$Acceleration)
coefDeter = coefCorr^2
print(coefDeter)
#11
matriceCor = cor(drivers[ , - 1])
matriceCor = round(matriceCor , 2)
View(matriceCor)
#12
install.packages("corrplot")
#13
library(corrplot)
corrplot(matriceCor, method="circle")
#14
matriceCor = round(cor(tires[ , - 1]),1)
corrplot(matriceCor, method="color",  
         type="upper", order="hclust", 
         addCoef.col = "black", # Ajout du coefficient de corrélation
         tl.col="black", tl.srt=45, #Rotation des étiquettes de textes
         # Cacher les coefficients de corrélation sur la diagonale
         diag=FALSE 
)
matriceCor = round(cor(bodies_karts[ , - 1]),1)
corrplot(matriceCor, method="color",  
         type="upper", order="hclust", 
         addCoef.col = "black", # Ajout du coefficient de corrélation
         tl.col="black", tl.srt=45, #Rotation des étiquettes de textes
         # Cacher les coefficients de corrélation sur la diagonale
         diag=FALSE 
)
matriceCor = round(cor(gliders[ , - 1]),1)
corrplot(matriceCor, method="color",  
         type="upper", order="hclust", 
         addCoef.col = "black", # Ajout du coefficient de corrélation
         tl.col="black", tl.srt=45, #Rotation des étiquettes de textes
         # Cacher les coefficients de corrélation sur la diagonale
         diag=FALSE 
)
#15
resultat = drivers[ , c("Driver" , "Weight")]
View(resultat)
#16
resultat = drivers[ 1:10 , c("Driver" , "Acceleration")]
View(resultat)
#17
resultat = drivers[ , -c(5,7,9)]
View(resultat)
#18
resultat = drivers[ , -c("Weight","Acceleration")] #cela fonctionne uniquement sur des index numériques.
resultat = drivers[ , -c(2,3)]
#19
resultat = drivers[ , c("Driver", "Acceleration", "Weight")]
View(resultat)
#Les colonnes sont dans l'ordre défini par le vecteur.
#20
resultat = drivers[ c(3,12,32) , ]
View(resultat)
#21
resultat = drivers[ c(32,3,12) , ]
View(resultat)
#Les lignes sont dans l'ordre défini par le vecteur.
#22
rang = order(drivers$Weight)
resultat = drivers[ rang  , c("Driver", "Weight") ]
View(resultat)
#23
rang = order(drivers$Acceleration, decreasing = TRUE)
resultat = drivers[ rang  , c("Driver", "Acceleration") ]
View(resultat)
#24
rang = order(drivers$Acceleration, drivers$Weight, decreasing = c(TRUE,FALSE))
resultat = drivers[ rang  , c("Driver", "Acceleration","Weight") ]
View(resultat)
#25
