## Functions create a matrix and its inverse that are 'cached', i.e., stored 

## This function stores the relevant data of the input matrix

makeCacheMatrix <- function(x = matrix()) {
	im <- NULL
	set <- function(y) {
		x <<- y
		im <<- NULL
		}
	get <- function() x
	setsolve <- function(solve) im <<- solve
	getsolve <- function() im
	list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}


## This function computes or retrieves the inverse of the particular stored matrix

cacheSolve <- function(x, ...) {
	im <- x$getsolve()
	if(!is.null(im)) {
		message("getting cached data")
		return(im)
		}
	data <- x$get()
	im <- solve(data, ...)
	x$setsolve(im)
	im
}
