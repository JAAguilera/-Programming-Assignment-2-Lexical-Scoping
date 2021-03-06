makeCacheMatrix <- function(x = matrix()) { 
  
  cache <- NULL 
  
  setMatrix <- function(newvalue) { 
    x <<- newvalue
    cache <<- NULL
  }  
  
  setInverse <- function(newvalue) {
    cache <<- newvalue
  }
  
  getCache <- function() { 
    cache
  }
  
  getMatrix <- function() {
    x
  }
  
  list(setMatrix = setMatrix, setInverse = setInverse, getMatrix = getMatrix, getCache = getCache) 
} 


cacheSolve <- function(x, ...) { 
  inverse <- x$getCache()
  if(!is.null(inverse)) {
    message("Inverse already exists")
    inverse <- x$getCache() 
  } 
  else {
    message("calculating inverse")
    mtx <- x$getMatrix()
    inverse <- solve(mtx)
    x$setInverse(inverse)
  }
  return(inverse)
} 
