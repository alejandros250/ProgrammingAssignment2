source("cachematrix.R")

# Create a square matrix for test

Ncolumns <- 100
matrix_test <- matrix(rnorm(Ncolumns^2),nrow = Ncolumns, ncol = Ncolumns)

M <- makeCacheMatrix(matrix_test)
Inverse_M <- cacheSolve(M)

# compute inverse of matrix and compare

Real_Inverse <- solve(matrix_test)

if(all(Real_Inverse==Inverse_M)) {
      print("The 2 matrices are equal")
}
