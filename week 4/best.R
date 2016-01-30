best <- function(state, outcome) {
  ## Read outcome data
  setwd(file.path("C:/Users/user/Documents/Datascience_specialization/Rprogramming/week4"))
  outcome_care <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## To check whether state is valid i need to get the unique list of states
  unique_state_list<-as.list(unique(outcome_care[,"State"]))
  
  ## To check whether the outcome is valid i need the list of outcomes
  unique_outcomes<-as.list(c("heart attack","heart failure","pneumonia"))
  
  ## Check that state and outcome are valid
    if(!state %in% unique_state_list){
      stop("invalid State")
    }else if(!outcome %in% unique_outcomes){
      stop("invalid outcome")
    }
  
  ## Return hospital name in that state with lowest 30-day death
  ## First return the appropriate column
  
  if(outcome=="heart attack"){
    colNo=11
  }else if(outcome=="heart failure"){
    colNo=17
  }else{
    colNo=23
  }
  data<-outcome_care[outcome_care$State==state,]
  min_mort<-which.min(outcome_care[outcome_care$State==state,colNo])
  
  data[min_mort,2]
  
  ## rate
  
  ## SAMPLE CALLS 
  ##best("TX", "heart attack")-->"CYPRESS FAIRBANKS MEDICAL CENTER"
  #best("TX", "heart failure")
  #best("MD", "heart attack")
  #best("MD", "pneumonia")
  #best("BB", "heart attack")
  
}

