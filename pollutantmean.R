pollutantmean <- function(directory, pollutant, id = 1:332) {
  file_names <- formatC(id, width=3, flag="0")
  file_names <- paste(getwd(), paste(directory, paste(file_names,".csv", sep=""), sep="/"), sep="/")
  
  v <- numeric()
  for (name in file_names) {
    data <- read.csv(name)
    data <- data[,pollutant]
    v <- c(v, data)
  }
  
  round(mean(v, na.rm=TRUE), 3)
}