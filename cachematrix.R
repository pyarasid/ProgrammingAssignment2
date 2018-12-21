## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- function(y){
      x<<-y
      s<<- NULL
}
get <- function(){
  x
}

setinverse <- function(solve){
  s<<-solve
}
getinverse <- function(){
  s
}
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        s <- x$getinverse()
        if(!is.null(s)){
          message("getting chached data")
          return(s)
        }
  data <- x$get()
  s <- solve(data)
  x$setinverse(s)
  s
}


a <- matrix(c(2,3,4,5,1,8,4,9,5), nrow=3, ncol=3)
p <- makeCacheMatrix(a)
cacheSolve(p)