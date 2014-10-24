corr <- function(directory, threshold = 0) {
  file_names <- dir(directory)
  file_names <- paste(getwd(), paste(directory, file_names, sep="/"), sep="/")
  
  v <- numeric()
  for (name in file_names) {
    data <- read.csv(name)
    
    count <- nrow(data[!is.na(data[,2])&!is.na(data[,3])&!is.na(data[,4]),])
    if (count >= threshold) {
      c <- cor(data[!is.na(data[,2])&!is.na(data[,3])&!is.na(data[,4]),2], data[!is.na(data[,2])&!is.na(data[,3])&!is.na(data[,4]),3])
      
      v <- c(v, round(c,4))  
    } 
  }
  v
}