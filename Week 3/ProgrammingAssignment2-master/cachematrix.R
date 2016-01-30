## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## The function is used to cache the valuue of the matrix
## and there are four functions created which is used to set,
## get ,set the inverse and get the inverse.

makeCacheMatrix <- function(x = matrix()) {

m<-null
set <- function(y) {
                x <<- y
       
         m <<- NULL
        }
get <- function() x
setinv <- function(inv) m <<- inv
getinv<-function() m
list(set=set,get=get,setinv=setinv,getinv=getinv)

}


## Write a short comment describing this function 

## This function takes in a matrix and attempts to solve the simultaneous equations
## by getting hold of the inverse of  the matrix.Now ,this inverse can be a cached value.
## If not,use the solve method to compute the inverse.To do this,we get the matrix(which again can be cached)
## and use solve and set the inverse


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
m<-x$getinv()
if(!is.null(m)){

	message("getting cached inverse matrix")
	return(m)


}


mat<-x$get
m<-solve(mat)

x$setinv(m)
}