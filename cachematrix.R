## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#The function, `makeCacheMatrix` creates a special "matrix", which is really a list containing a function to:

#1.  set: set the value of the matrix
#2.  get: get the value of the matrix
#3.  setInverse: set the value of the inverse of the matrix 
#4.  getInverse: get the value of the mean



makeCacheMatrix <- function(x = matrix()) {
      InverseMatrix <- NULL

      set <- function(y) {
            x <<- y
            InverseMatrix <<- NULL
      }
      
      get <- function() x
      setInverse <- function(matrix_data =  matrix()) {
          if (nrow(matrix_data)==nrow(x) && ncol(matrix_data)==ncol(x) ){
               InverseMatrix <<-matrix_data
          }
          else{
            print("ERROR: Dimensions of inverse matrix do not match with the original matrix")  
          }        
      }
      
      getInverse <- function() InverseMatrix
      list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)  

}


## Write a short comment describing this function

#This function calculates the mean of a matrix defined with the function makeCacheMatrix. Before computing the inverse checks first it the
#inverse is already in memory.

cacheSolve <- function(x, ...) {
            InverseMatrix <- x$getInverse()
            if(!is.null(InverseMatrix)) {
                message("The inverse matrix is obtained from the cached data")
                return(InverseMatrix)
            }
            data <- x$get()
            InverseMatrix <- solve(data)
            x$setInverse(InverseMatrix)
            InverseMatrix
}

