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
