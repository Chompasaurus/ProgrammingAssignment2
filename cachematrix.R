## I crashed around with code from scratch for a while, then just replaced a few lines in the examples.
## Defining x and a matrix then entering cacheSolve(makeCacheMatrix(x)) returns the same output as solve(x)

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL 
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) m <<- inverse
    getInverse <- function() m
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
    
}


cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getInverse()
    if(!is.null(m)) {
        message("getting cached MATRIIIIX data")
        return(m)
    }
    data <- x$get()
    m <- solve(data)
    x$setInverse(m)
    m
    
}