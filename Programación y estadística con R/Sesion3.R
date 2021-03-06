# Ejemplo 1

library(ggplot2)

names(mtcars)

# Graficamos las variables cyl en el ejex y hp en y, observa el comando geom_point()
# geom_point() es el tipo de geometr�a
ggplot(mtcars, aes(x=cyl, y=hp, colour = mpg)) + geom_point()

# Agregando caracter�sticas de tema y facewrap

ggplot(mtcars, aes(x=cyl, y=hp, colour = mpg)) + geom_point() +
  theme_gray() + # Temas (intentar cambiarlo)
  facet_wrap("cyl") # Lo divide por el n�mero de cilindros

# Agregando nombres a los ejes x, y

p <- ggplot(mtcars, aes(x=cyl, y=hp, colour = mpg)) + geom_point() +
  theme_gray() +
  facet_wrap("am") +
  xlab("N�m cilindros") +
  ylab("Caballos de fuerza") +
  ggtitle("Gr�ficas de mtcars")

install.packages("plotly")
library(plotly)

ggplotly(p)


# Ejemplo 2 Sesion 3
library(dplyr)

data <- read.csv("boxp.csv")

hist(data$Mediciones)

hist(data$Mediciones, breaks = seq(0,300,20),
     main = "Histograma de Mediciones",
     xlab = "Mediciones",
     ylab = "Frecuencia")

#Ahora utilizando ggplot para apreciar los resultados de las dos

# Evitar el Warning de filas con NA's

data <- na.omit(data)

p <- data %>% # pipe
  ggplot() +
  aes(Mediciones) +
  geom_histogram(binwidth = 20)

p <- ggplot(data, aes(Mediciones)) +
  geom_histogram(binwidth = 20)

# Agregando algunas etiquetas y tema, intenta modificar

data %>% # pipe
  ggplot() +
  aes(Mediciones) +
  geom_histogram(binwidth = 10, col = "black", fill = "blue") +
  ggtitle("Histograma de Mediciones") +
  xlab("Mediciones") +
  ylab("Frecuencia") +
  theme_gray()


# Ejemplo 3 Sesi�n 3
# Desarrollo

# Realizamos un scatter plot de las variables wt y mpg, debemos utilizar necesariamente geom_point()

(my_scatplot <- ggplot(mtcars, 
                       aes(x = wt, y = mpg)) + 
    geom_point())

# Adicionalmente se puede agregar una linea de tendencia

(my_scatplot <- ggplot(mtcars, 
                       aes(x=wt,y=mpg)) + 
    geom_point() + 
    geom_smooth(method = "lm", se = T))  # modelo lineal, cambia el parametro `se`, este hace referencia al intervalo de confianza

# Agregando los nombres de los ejes, observa que se almaceno el grafico en el objeto 
# my_scatplot (nota que pueden agregarse mas caracteristicas seguido del signo +)

my_scatplot + xlab('Weight (x 1000lbs)') + ylab('Miles per Gallon')

# Otras caracteristicas interesantes

(my_scatplot <- ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + geom_point())
my_scatplot + labs(x='Weight (x1000lbs)',y='Miles per Gallon',colour='Number of\n Cylinders')

# Haciendo un facewrap con la variable cyl

my_scatplot + facet_wrap("cyl")
my_scatplot + facet_wrap("am")

# Separandolas por tipo de transmision (am = Transmission (0 = automatic, 1 = manual))

my_scatplot + facet_grid(am~cyl)
my_scatplot + facet_grid(am~vs)

# Como puedes observar, hay muchas formas de representar el grafico de dispersion, 
# estas son algunas de ellas, obviamente existen muchas mas.


# Ejemplo 4 Sesion 3

# Comenzamos leyendo un fichero, el cual contiene información sobre dos grupos 
# de control G1 y G2, a los cuales se les realizó a cada uno una medición 
# en 3 momentos diferentes C1, C2 y C3
# library(dplyr) # para usar mutate
data <- read.csv("boxp.csv")

# Revisamos el encabezado del fichero y el nombre de sus variables o columnas

head(data)
names(data)

# Observamos algunos datos estadísticos sobre las variables

summary(data)

# Como estamos ante la presencia de NA´s los eliminamos con complete.cases() y solamente seleccionamos aquellos sin NAsy convertimos en factores la variableCategoriayGrupo`

bien <- complete.cases(data)
data <- data[bien,]
data <- mutate(data, Categoria = factor(Categoria), Grupo = factor(Grupo))

# Finalmente realizamos el boxplot

ggplot(data, aes(x = Categoria, y = Mediciones, fill = Grupo)) + geom_boxplot() +
  ggtitle("Boxplots") +
  xlab("Categorias") +
  ylab("Mediciones")

# Agregamos el nombre de las etiquetas para los grupos G1 y G2

ggplot(data, aes(x = Categoria, y = Mediciones, fill = Grupo)) + geom_boxplot() +
  scale_fill_discrete(name = "Dos Gps", labels = c("G1", "G2")) + 
  ggtitle("Boxplots") +
  xlab("Categorias") +
  ylab("Mediciones")










