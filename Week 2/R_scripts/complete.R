complete<-function(directory,id=1:332){
  
  files_list<-list.files(directory,full.names=TRUE)
  j<-1
  id_len<-length(id)
  complete_data <- rep(0, id_len)
  for(i in id){
    current_file<-read.csv(files_list[i])
    complete_data[j]<-sum(complete.cases(current_file))
    j<-j+1
    
  }
  dat<-data.frame(id=id,nobs=complete_data)

}