## The first function "makeCacheMatrix" stores a matrix based on an input vector of x
## and stores a cached value of the matrix and its inverse. It gets it, it caches the inverses,
## it gets the inverse from the cache on call.
## it returns a list of functions

makeCacheMatrix <- function(x = numeric()) {
  cache <- NULL
  setMatrix <- function(newValue) {
    x <<- newValue
    cache <<- NULL
  }
  getMatrix <- function() {
    x
  }
  cacheInverse <- function(solve) {
    cache <<- solve
  }
  getInverse <- function() {
    cache
  }
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


## cacheSolve returns the inverse of the matrix created by above function or returns the values that are already in 
## the cache

cacheSolve <- function(y, ...) {
  inverse <- y$getInverse()
  if(!is.null(inverse)) {
  message("getting cached data")
  return(inverse)
}
  data <- y$getMatrix()
  inverse <- solve(data)
  y$cacheInverse(inverse)
  inverse
}
