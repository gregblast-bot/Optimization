# We need the igraph library
library("igraph")

# Setup an undirected graph
graph <- list(a = c("b","l","m"),
              b = c("a","c","l"),
              c = c("b","d","k"),
              d = c("c","e"),
              e = c("d","f","i","j","k"),
              f = c("e","g"),
              g = c("f","h","i"),
              h = c("g","j"),
              i = c("e","g"),
              j = c("e","h","m"),
              k = c("c","e","l"),
              l = c("a","b","k"),
              m = c("a","j"))

# Setup the distances of the graph
weights <- list(a = c(1,2,3),
                 b = c(1,2,1),
                 c = c(2,2,1),
                 d = c(2,1),
                 e = c(1,1,2,3,1),
                 f = c(1,1),
                 g = c(1,1,3),
                 h = c(1,4),
                 i = c(2,3),
                 j = c(3,4,1),
                 k = c(1,1,2),
                 l = c(2,1,2),
                 m = c(3,1))

# Create a graph with distances
G1 <- data.frame(stack(graph), weights = stack(weights)[[1]])
el <- as.matrix(stack(graph))
G2 <- graph_from_edgelist(el)
plot(G2, edge.label = stack(weights)[[1]])

# Path length
path_length <- function (path){
  if(is.null(path)){
    return(Inf)
  }
  
  pairs <- cbind(values = path[-length(path)], ind = path[-1])
  sum(merge(pairs,G1)[ , "weights"])
}

# Dijkstra's Algorithm
shortest_path <- function(graph, start, end, path = c()){
  if(is.null(graph[[start]])){
    return(NULL)
  }
  
  path <- c(path,start)
  
  if(start == end){
    return(path)
  }
  
  shortest <- NULL
  
  for(node in graph[[start]]){
    if(!(node %in% path)){
      update <- shortest_path(graph,end,node,path)
  
      if(path_length(update) < path_length(shortest)){
        shortest <- update
      }
    }
  }
  shortest
}

output <- shortest_path(graph, "a", "m")
print(output)