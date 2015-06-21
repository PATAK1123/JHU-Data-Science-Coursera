## This code allows for the caching of the inverse of a matrix.
## THe matrix must be created using the makeCacheMatrix function.
## The inverse matrix is returned by cacheSolve, either from the cache
## or by using the inbuilt solve function.
## NB, as specified in the instructions:  
## assume that the matrix supplied is always invertible.

## Function creates a vector of functions that will then be used by
## cache solve. It is a data structure that stores the matrix and the cache.

makeCacheMatrix <- function(x = matrix()) {
  
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Function returns the inverse of matrix x using cached value if available.
## x must be made using makeCacheMatrix function.
## It is assumed that x is an invertible matrix.

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
        ## Return a matrix that is the inverse of 'x'
}
