# We need the igraph library
library(igraph)

# A data frame describing the flow and its capacity in each edge
G <- rbind(c("S", "1", 4), c("2", "S", 1), c("S", "3", 5), c("S", "4", 2), c("1", "5", 2), c("6", "1", 5), c("5", "7", 3), c("7", "6", 6), c("6", "8", 3), c("9", "2", 2), c("3", "10", 2), c("4", "10", 3), c("9", "10", 1), c("7", "11", 1), c("8", "11", 2), c("8", "12", 1), c("12", "9", 4), c("11", "12", 2), c("10", "F", 4), c("11", "F", 3), c("12", "F", 6))
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