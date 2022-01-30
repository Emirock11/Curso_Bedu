u1011 <- "https://www.football-data.co.uk/mmz4281/1011/SP1.csv"
u1112 <- "https://www.football-data.co.uk/mmz4281/1112/SP1.csv"
u1213 <- "https://www.football-data.co.uk/mmz4281/1213/SP1.csv"
u1314 <- "https://www.football-data.co.uk/mmz4281/1314/SP1.csv"

download.file(url= u1011, destfile = "SP1-1011.csv", mode = "wb")
download.file(url= u1112, destfile = "SP1-1112.csv", mode = "wb")
download.file(url= u1213, destfile = "SP1-1213.csv", mode = "wb")
download.file(url= u1314, destfile = "SP1-1314.csv", mode = "wb")

library(dplyr)

lista <- lapply(dir(pattern = "SP1"), read.csv )
lista <- lapply(list.files(pattern = "SP" ), read.csv )
lista <- lapply(lista, select, Date: FTR) # seleccionamos solo algunas columnas de cada dataframe
head(lista[[1]]); head(lista[[2]]); head(lista[[3]]); head(lista[[4]])

# cada uno de los dataframes que tenemos en la lista, los podemos combinar en un único
# data frame utilizando las funciones rbind y do.call de la siguiente manera


conf <- read.csv("st19ncov-confirmados.csv")
dec <- read.csv("st19ncov-muertes.csv")

str(conf); str(dec)
head(conf); head(dec)


Sconf <- conf[-1, ]
Sdec <- dec[-1, ]

# Convertir los datos

Sconf <- select(Sconf, Country.Region, Date, Value)
Sconf <- rename(Sconf, Country = Country.Region, Fecha = Date, Infectados = Value)
str(Sconf)

Sconf <- mutate(Sconf, Fecha = as.Date(Fecha, "%Y-%m-%d"), Infectados = as.numeric(Infectados))


Sdec <- select(Sdec, Country.Region, Date, Value)
Sdec <- rename(Sdec, Country = Country.Region, Fecha = Date, Decesos = Value)

Sdec <- mutate(Sdec, Fecha = as.Date(Fecha, "%Y-%m-%d"), Decesos = as.numeric(Decesos))
str(Sdec)


Scm <- merge(Sconf, Sdec)
dim(Scm)

mex <- filter(Scm, Country == "Mexico")
mex <- filter(mex, Infectados != 0)

mex <- mutate(mex, NI = c(1, diff(Infectados))) # Nuevos infectados por día
mex <- mutate(mex, ND = c(0, diff(Decesos))) # Nuevos decesos por día

mex <- mutate(mex, Letalidad = round(Decesos/Infectados*100, 1)) # Taza de letalidad

mex <- mutate(mex, IDA = lag(Infectados), DDA = lag(Decesos)) # valores del día anterior
mex <- mutate(mex, FCI = Infectados/IDA, FCD = Decesos/DDA) # Factores de crecimiento
mex <- mutate(mex, Dia = 1:dim(mex)[1]) # Dias de contingencia

# Reto 1

set.seed(134)
x <- round(rnorm(1000, 175, 6), 1)
# Media
mean(x)
# Mediana
median(x)
# Moda
mode <- function(x) {
  return(as.numeric(names(which.max(table(x)))))
}
mode(x)
install.packages("DescTools")
library(DescTools)
Mode(x)

#deciles
quantile(x, seq(0.1, 0.9, by=0.1))

IQR(x)
sd(x)
var(x)

# Reto 2

#Mediana

mediana <- function(x){
  xSorted <- sort(x)
  n <- as.numeric(length(x))
  if(n%%2 == 0){
    return((xSorted[n/2]+xSorted[(n/2)+1])/2)
  }else{
    return(xSorted[(n+1)/2])
  }
}

mediana(x)

# Reto 3

f.17.18 <- read.csv("2017_2018.csv")
f.18.19 <- read.csv("2018_2019.csv")
f.19.20 <- read.csv("2019_2020.csv")
f.20.21 <- read.csv("2020_2021.csv")

library(dplyr)







