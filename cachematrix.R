## The following two functins work to cache the inverse of a matrix.

## creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get<- function() x
  setinv <- function(mat_inv) inv <<- mat_inv
  getinv <- function() inv
  
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)

}


## computes the inverse of the special "matrix" returned by makeCacheMatrix.
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

inv<-x$getinv()
  if(!is.null(inv))
  {
    message("getting cache value")
    return(inv)
  }
  data<-x$get()
  inv <- solve(data,..)
  x$setinv(inv)
  inv

}
