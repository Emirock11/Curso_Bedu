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
