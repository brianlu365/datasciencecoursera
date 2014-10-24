complete <- function(directory, id = 1:332) {
  file_names <- formatC(id, width=3, flag="0")
  file_names <- paste(getwd(), paste(directory, paste(file_names,".csv", sep=""), sep="/"), sep="/")
  
  v <- numeric()
  for (i in id) {
    file_name <- formatC(i, width=3, flag="0")
    file_name <- paste(getwd(), paste(directory, paste(file_name,".csv", sep=""), sep="/"), sep="/")
    
    data <- read.csv(file_name)
    
    count <- nrow(data[!is.na(data[,2])&!is.na(data[,3])&!is.na(data[,4]),])
    v <- c(v, i, count)
  }
  
  dframe = matrix(v, nrow=length(v)/2, ncol=2, byrow=TRUE)
  dframe = as.data.frame(dframe)
  names(dframe) <- c("id", "nobs")
  dframe
}