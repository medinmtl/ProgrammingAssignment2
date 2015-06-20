# Programming Assignment 2: Lexical Scoping

## For the Coursera course [R Programming](https://www.coursera.org/course/rprog)

### Introduction

This second programming assignment will require you to write an R
function that is able to cache potentially time-consuming computations.
For example, taking the mean of a numeric vector is typically a fast
operation. However, for a very long vector, it may take too long to
compute the mean, especially if it has to be computed repeatedly (e.g.
in a loop). If the contents of a vector are not changing, it may make
sense to cache the value of the mean so that when we need it again, it
can be looked up in the cache rather than recomputed. In this
Programming Assignment you will take advantage of the scoping rules of
the R language and how they can be manipulated to preserve state inside
of an R object.

### Assignment: Caching the Inverse of a Matrix

Matrix inversion is usually a costly computation and there may be some
benefit to caching the inverse of a matrix rather than computing it
repeatedly (there are also alternatives to matrix inversion that we will
not discuss here). Your assignment is to write a pair of functions that
cache the inverse of a matrix.

##Demonstration
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

	# create a square matrix (`solve` support only square matrices 
	# because inverse matrices exist only for square matrices )
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
	
	# Verification : calculate the inverse of the inverse 
	# it should give the original matrix, the same output as m$get()
	#> solve( cacheSolve(m) )
	#>      [,1] [,2] [,3]
	#> [1,]    1    2    3
	#> [2,]    0    4    5
	#> [3,]    1    0    6

