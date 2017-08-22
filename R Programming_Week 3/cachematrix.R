## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache its own inverse. 
## Caching allows for the storing of intermediate data files to speed up calculations in large objects.  

makeCacheMatrix <- function(x = matrix()) {
## returns a list to get/set matrix as well as get/set inverse of matrix

inv = NULL
set = function(y){
	x <<- y
	inv <<- NULL
	}
get = function() x
setinv = function(inverse) inv <<- inverse
getinv = function() inv
list(set=set, get=get, setinv=setinv, getinv=getinv)

}


## This function computes the inverse of the special matrix returned by "makeCacheMatrix" function if it 
   has not already been calculated 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
inv = x$getinv()

## If inverse has been calculated
if(!is.null(inv)){
	message("retrieving cached data")
	return(inv)
}

## If inverse has not been calculated 
mat.data = x$get()
inv = solve(mat.data, ...) 

#sets value of inverse matrix
x$setinv(inv)

return(inv)
}
