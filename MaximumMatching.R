library("igraph")
# Set up a 6x6 matrix corresponding to the bipartite graph in problem 1
I = matrix(c(1,0,1,0,0,0, 1,1,0,0,0,0, 0,1,0,1,1,1, 1,0,1,0,0,0, 1,1,1,0,1,0, 0,0,0,1,1,1), nrow=6, ncol=6, byrow=TRUE)
# Declare dimensions of I and row/column names
dim(I) = c(6,6)
rownames(I) = c("g1","g2","g3","g4","g5","g6")
colnames(I) = c("b1","b2","b3","b4","b5","b6")
# Check matrix
print(I)
# Graph the incidence matrix
h = graph.incidence(I, weighted=T)
# Find the maximum matching of the bipartite graph
out = maximum.bipartite.matching(h)
# Check the output
print(out)