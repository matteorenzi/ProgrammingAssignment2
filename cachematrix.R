

makeCacheMatrix <- function(x = matrix()) {
       z <- NULL
       set <- function(y) {
             x <<- y
             z <<- NULL
         }
       get <- function() x
       setsolve <- function(solve) z <<- solve
       getsolve <- function() z
       list(set = set, get = get,
                       setsolve = setsolve,
                      getsolve = getsolve)
   }
   
   

cacheSolve <- function(x, ...) {
  z <- x$getsolve()
  if(!is.null(z)) {
    message("getting cached data")
    return(z)
  }
  data <- x$get()
  z <- solve(data, ...)
  x$setsolve(z)
  z
}
