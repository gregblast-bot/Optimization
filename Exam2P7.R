# We need the igraph library
library(igraph)

# A data frame describing the flow and its capacity in each edge
G <- rbind(c("S", "1", 3),
           c("1", "S", 3),
           c("S", "2", 5),
           c("2", "S", 5),
           c("S", "3", 1),
           c("3", "S", 1),
           c("S", "4", 4),
           c("4", "S", 4),
           c("1", "2", 3),
           c("2", "1", 3),
           c("2", "3", 3),
           c("3", "2", 3),
           c("3", "5", 4),
           c("5", "3", 4),
           c("4", "5", 3),
           c("5", "4", 3),
           c("1", "6", 2),
           c("6", "1", 2),
           c("2", "6", 2),
           c("6", "2", 2),
           c("2", "F", 1),
           c("F", "2", 1),
           c("3", "F", 3),
           c("F", "3", 3),
           c("6", "7", 2),
           c("7", "6", 2),
           c("5", "8", 6),
           c("8", "5", 6),
           c("7", "F", 4),
           c("F", "7", 4),
           c("8", "F", 5),
           c("F", "8", 5))
           

colnames(G) <- c("From", "To", "Capacity")
DF <- as.data.frame(G)

# The input graph
g1 <- graph_from_data_frame(DF)

# Call max_flow function
max <- max_flow(g1, source = V(g1)["S"], target = V(g1)["F"])

# Show output in the console
print(max)

# Plot the optimal solution
plot(g1, edge.label = max$flow)