# Load bridge-building packages 
library(tidyverse)
library(tlinkage)

# Create a dataset of river bends
bends <- data.frame(x=c(1,2,3,4,5),
                    y=c(0,2,4,1,3))

# Plot the bends
ggplot(bends, aes(x=x, y=y)) +
  geom_point()

# Calculate the distance matrix 
distances <- get_distances(bends$x,
                           bends$y)

# Generate the linkage
bridge <- hclust(distances, 
                 method="single")

# Plot bridge structure
plot(bridge, 
     labels=bends$x,
     xlab="Distance")

# Add the bridge structure to bends dataset
bends$linkage <- as.numeric(cutree(bridge, 
                                   k=2))

# Create bridge walks 
bridge_lines <- tl_lines(bends, 
                         x=x, 
                         y=y, 
                         link=linkage)

# Plot the bridge
ggplot() +
  geom_segment(data=bridge_lines, 
               aes(x=start_x, y=start_y, 
                   xend=end_x, yend=end_y))

# Calculate the total length of the bridge
bridge_length <- bridge_lines %>%
  summarize(total_length=sum(length)) %>%
  pull(total_length)

# Print the bridge length
print(paste("The length of the bridge is ", bridge_length, " units."))