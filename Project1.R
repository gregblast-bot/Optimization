# Gregory Wagonblast
# 29OCT2021
# Dr. Constantine MATH 1101
# CLICK SOURCE TO RUN PROGRAM AND INPUT M, N, AND R TO YOUR LIKING.

# We need the igraph library
library("igraph")

# Step 1
generate <- function (m,n,p) 
{
  # Generates m by n 01 mat with prob p for 1 in each entry
  mat = rbinom(m*n,1,p)
  dim(mat) = c(m,n)
  return(mat)
}

# Step 2
match <- function (m,n,p) 
{
  # Inputs m,n and prob p outputs number of matchings
  I = generate(m,n,p)   
  g = graph.incidence(I)
  out = maximum.bipartite.matching(g)    
  return(out[[1]]/m)
}

# Step 3
myrep <- function(r)
{
  # My function for calling match r times and finding an average
  sum = 0
  for(i in 0:r){
    temp = match(m,n,p)
    sum = temp + sum
  }
  mp = sum/r
  return(mp)
}

# From here down is the main function
# main(){

# Step 4
# This gives the user the ability to input m, n, and r
m = as.integer(readline("Enter the number of rows for the matrix (1-100): "))
n = as.integer(readline("Enter the number of columns for the matrix (1-100): "))
# p = as.double(readline("Enter the probability of success for each couple (0-1): "))
r = as.integer(readline("Enter the number repetitions that you would like to perform matchings: "))

# Initialize some variable of use as zero and empty vectors
p = 0
i = 0
mp = c()
pr = c()

# This loop iterates by (1/(m*n)) and calls myrep while filling variables
for(p in seq(0,1,by=(1/(m*n)))){
  temp1 = myrep(r)
  mp[i] = temp1
  pr[i] = p
  i = i + 1
}

# Print vectors as a check
print(mp)
print(pr)

# Step 5
# Plot mp vs. p
plot(mp , pr, type="l", col="red", lwd=5, xlab="Marriages on Average", ylab="Probability", main="Exponential Increase")

# By running this program for uniquely sized matrices and for r outcomes, we can clearly see that there is a corresponding
# exponential increase each time the program is run. This behavior has held true for every test I have tried so far. Enjoy!

# End of main function }
