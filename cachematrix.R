##***************************************************
## Note(extra comments): Put comments here that give an overall description of what your
## functions do


#Note : Let's say we have a "cache" environment different from our working environment
#and we need 4 things to do 
# if we create a new matrix in the current env , we set the value of the cache matrix to our new matrix
# if we already had a matrix in cache , we need to get it
# if the cache'd matrix is fresh , we need to compute its inverse and keep it in cache i.e. set inverse
# if matrix has already been cache'd and inverse cached too , we just get this inverse

# We first make a function that creates a vector of 4 functions (its like a 4 functions in 1 function i.e "funception") :
# 1.) "set" the value of a matrix into cache environment
# 2.) "get" the value of a matrix from cache environment
# 3.) "setinverse" : sets the value of a inverse of a matrix into cache environment
# 4.) "getinverse" : get the value of inverse of a matrix from cache environment

##***************************************************

## Write a short comment describing this function
#takes input a matrix object now x is in cache env 
makeCacheMatrix <- function(x = matrix())
{
  # initialize the inverse to NULL
  inverse  <- NULL
  
  #1.) set the value of our cache matrix  x to the one in our working env i.e. y
  set <- function(y) 
  {
    x <<- y #this operator does the job ,assigns y to x , hence work env matrix y has been cached to x
    inverse <<- NULL
  } 
  
  #2.) If we had set the cache already we can get the cache'd matrix , just need to write x to return it
  get <- function() 
  {
    x
  }
  
  #3.) say we fetched the matrix x from cache env to working env (by calling get() above)
  # and then computed its inverse, in working env , this function will save that inverse back in cache env
  setinverse <- function(inv)
  { 
    inverse <<- inv
  }
  
  #4.) if we already computed and cache'd the inverse this funtion helps us get it to working env
  getinverse <- function()
  {
    inverse
  } 
  
  #returns a list of these 4 functions
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Write a short comment describing this function
#We are almost done , we just need a function that will compute that inverse for us.
cacheSolve <- function(x, ...) 
{
  ## Return a matrix that is the inverse of 'x'
  inverse <- x$getinverse() #if cached already fetch inverse from cache
  
  if(!is.null(inverse))  #if the inverse actually exists return it (note: we are in cacheSolve right now so have to return it)
  {
    message("getting cached data")
    return(inverse)
  }
  #if the above code doesnt run i.e. inverse was null we have to compute it
  # if cached already fetch the whole matrix into working env 
  data <- x$get()
  # compute inverse
  inverse <- solve(data, ...)
  # cache the inverse 
  x$setinverse(inverse)
  #return inverse
  inverse
}


#test everything

#send a matrix to makeCacheMatrix i.e. cache and get back the list of functions
blue_matrix <- makeCacheMatrix(matrix(1:4, 2, 2))

#look at the contents of blue_matrix
blue_matrix

# get the cached matrix into our env by calling function get()
blue_matrix$get()

#get its inverse : it must be NULL since we havent computed it yet
blue_matrix$getinverse()
#compute the inverse and save it in cache
cacheSolve(blue_matrix)
# get it now , wont be null
blue_matrix$getinverse()


# Modify existing matrix
blue_matrix$set(matrix(c(0,5,99,66), nrow=2, ncol=2))
#get inverse , will be null again , since matrix has changed
blue_matrix$getinverse()

# Compute, cache and return new matrix inverse
cacheSolve(blue_matrix) 
# get matrix from cache
blue_matrix$get()
# get inverse    
blue_matrix$getinverse()  