### Introduction

# Programming Assignment 2: Lexical Scoping

## For the Coursera course [R Programming](https://www.coursera.org/course/rprog)

The following code demonstrates how to use the `cachematrix.R` R script.

Lines starting with `#` are simple comments, lines starting with `#>` are things
printed in the output.

	# read the R script
	# replace the "path/to/file" with the directory you save the file into
	# or you can read the file directly from the web
	source("path/to/file/cachematrix.R")

	# create a *square* matrix (because `solve` only handles square matrices)
	# create the matrix during the call of makeCacheMatrix()
	m <- makeCacheMatrix( matrix(c(1, 0, 1, 2, 4 , 0, 3, 5, 6), nrow = 3, ncol = 3) );

	summary(m);
	#>				Length Class  Mode    
	#> set          1      -none- function
	#> get          1      -none- function
	#> cacheInverse 1      -none- function
	#> getInverse   1      -none- function

	m$get();
	#>      [,1] [,2] [,3]
	#> [1,]    1    2    3
	#> [2,]    0    4    5
	#> [3,]    1    0    6

	cacheSolve(m);
				  [,1]        [,2]        [,3]
	#> [1,]	 1.0909091 -0.54545455 -0.09090909
	#> [2,]  0.2272727  0.13636364 -0.22727273
	#> [3,] -0.1818182  0.09090909  0.18181818
	
	# the 2nd time we run the function,we get the cached value
	cacheSolve(m)
	#> getting cached data
    #>        	   [,1]        [,2]        [,3]
	#> [1,]  1.0909091 -0.54545455 -0.09090909
	#> [2,]  0.2272727  0.13636364 -0.22727273
	#> [3,] -0.1818182  0.09090909  0.18181818

An other option, the matrix can be created after calling a `makeCacheMatrix` without arguments.

	# read the R script
	# replace the "path/to/file" with the directory you save the file into
	# or you can read the file directly from the web
	source("./filepath/cachematrix.R")
	
	# call makeCacheMatrix without arguments
	m <- makeCacheMatrix();
	summary(a);
	#>              Length Class  Mode    
	#> set          1      -none- function
	#> get          1      -none- function
	#> cacheInverse 1      -none- function
	#> getInverse   1      -none- function

	# create a square matrix (`solve` support only square matrices because inverse matrices exist only for square matrices )
	m$set( matrix(c(1, 0, 1, 2, 4 , 0, 3, 5, 6), nrow = 3, ncol = 3) );
	m$get();
	#>      [,1] [,2] [,3]
	#> [1,]    1    2    3
	#> [2,]    0    4    5
	#> [3,]    1    0    6

	cacheSolve(m)	
	#>            [,1]        [,2]        [,3]
	#> [1,]  1.0909091 -0.54545455 -0.09090909
	#> [2,]  0.2272727  0.13636364 -0.22727273
	#> [3,] -0.1818182  0.09090909  0.18181818

	# the 2nd time we run the function, we get the cached value
	cacheSolve(m)	
	getting cached data
    #>        [,1]        [,2]        [,3]
	#> [1,]  1.0909091 -0.54545455 -0.09090909
	#> [2,]  0.2272727  0.13636364 -0.22727273
	#> [3,] -0.1818182  0.09090909  0.18181818
	
	# Verification : calculate the inverse on the inverse should give the original matrix, the same output as m$get()
	#> solve( cacheSolve(m) )
	#>      [,1] [,2] [,3]
	#> [1,]    1    2    3
	#> [2,]    0    4    5
	#> [3,]    1    0    6

