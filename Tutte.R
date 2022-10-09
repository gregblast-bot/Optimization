
x = 0
Na <- as.integer(readline("Enter the number of rows for the adjacency matrix: "))
Ma <- as.integer(readline("Enter the number of columns for the adjacency matrix:: "))
Nd <- as.integer(readline("Enter the number of rows for the diagonal matrix: "))
Md <- as.integer(readline("Enter the number of columns for the diagonal matrix:: "))

for(i in 0:Na){
  for(j in 0:Ma){
    text <- paste("Enter","row",Na,"and","column",Ma,sep="")
    temp <= as.integer(readline("Enter: "))
    x[i] = x[temp]
  }
}

for(i in 0:Nd){
  for(j in 0:Md){
    text <- paste("Enter","row",Na,"and","column",Ma,sep="")
    temp <= as.integer(readline("Enter: "))
    x[i] = x[temp]
  }
}
    
A <- matrix(data = NA, nrow = Na, ncol = Ma)
plot(graph_from_literal(1--+2))
#g <- graph(c(1,2,3),n=3)
#plot(g)
