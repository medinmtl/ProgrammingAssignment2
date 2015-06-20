# See README.md and Demo.md for instructions on running the code and output from it
# The assignment states that running the code is not part of the grading 
# but I have the instructions anyway.

# makeCacheMatrix: this function creates a special "matrix" object that can cache its inverse.
# The final goal is to store a martix and the cached value of its inverse.
# makeCacheMatrix contains the following functions: 
# * set            set the value of a matrix 
# * get            get the value of a matrix 
# * cacheInverse   get the cahced value (inverse of the matrix) 
# * getInverse     get the cahced value (inverse of the matrix) 

makeCacheMatrix <- function(x = matrix()) {
    
    # this variable stores the cached value for the matrix inverse
    # initially nothing is cached so set it to NULL
    cache <- NULL
    
    # store a matrix
    set <- function(newValue) {
        x <<- newValue
        # since the matrix is assigned a new value, flush the cache
        cache <<- NULL
    }
    
    # returns the stored matrix
    get <- function() {
        x
    }
    
    # cache the matrix inverse 
    cacheInverse <- function( inverse ) {
        cache <<- inverse
    }
    
    # get the cached value
    getInverse <- function() {
        cache
    }
    
    # return a list. Each named element of the list is a function
    list(set = set, get = get, cacheInverse = cacheInverse, getInverse = getInverse)
}


# cacheSolve : this function computes the inverse of the special "matrix" 
# returned by makeCacheMatrix above. 
# If the inverse has already been calculated (and the matrix has not changed), 
# then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    # get the cached value of the matrix inverse
    inverse <- x$getInverse()
    
    # if a cached value for the matrix inverse exists the return it
    if(!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    else {
        
        # get the matrix
        data <- x$get()
        
        # caclulate the inverse
        inverse <- solve(data)
        
        # cache the inverse by calling x$cacheInverse
        x$cacheInverse( inverse )
        
        # return the inverse
        inverse
        
        # We could do it all in one action
        #( x$cacheInverse( solve( x$get() ) ) )
    }
}
