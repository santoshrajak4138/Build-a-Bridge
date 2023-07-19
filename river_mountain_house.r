#This is a sample code for building a bridge.

# Create package
pacman::p_load("rgl")
 
# Create bridge
bridge <- list(
    X = c(-30, 30, 30, -30, -30), 
    Y = c(-10, -10, 10, 10, -10),
    Z = c(0, 0, 0, 0, 0)
)
 
# Assemble bridge
for (i in 0:15) {
    angle <- i * pi / 8
    rotXmatrix <- c(
        1, 0, 0,
        0, cos(angle), -sin(angle),
        0, sin(angle), cos(angle)
    )
    rotYmatrix <- c(
        cos(angle), 0, sin(angle),
        0, 1, 0,
        -sin(angle), 0, cos(angle)
    )
    rotZmatrix <- c(
        cos(angle), -sin(angle), 0,
        sin(angle), cos(angle), 0,
        0, 0, 1
    )
    bridge$X <- bridge$X + 0.5 * (t(rotXmatrix) %*% bridge$X)
    bridge$Y <- bridge$Y + 0.5 * (t(rotYmatrix) %*% bridge$Y)
    bridge$Z <- bridge$Z + 0.5 * (t(rotZmatrix) %*% bridge$Z)
}
 
# Plot bridge
bridgeCurve <- rbind(bridge$X, bridge$Y, bridge$Z)
par3d(windowRect = c(0, 100, 0, 100))
plot3d(bridgeCurve, type = "l", lwd = 4, col = 3, xlab = "x",
       ylab = "y", zlab = "z");
 
# Animate bridge
bridgeAnimation <- function(i){
    par3d(windowRect = c(0, 100, 0, 100))
    plot3d(bridgeCurve, type = "l", lwd = 4, col = 3, xlab = "x",
        ylab = "y", zlab = "z");
    view3d(userMatrix = rgl.view(theta=i*pi/16, phi = pi/2))
}
 
# Create movie and save
movie3d(
    bridgeAnimation,
    makingMovie = TRUE,
    movieName = "bridge.mp4"
)

#-----END CODE-----#