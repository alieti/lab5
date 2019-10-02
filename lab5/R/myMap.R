library(ggmap)
library(R6)

MapStamen <- R6Class("MapStamen",
                     public = list(
                       
                       initialize = function(left = -125, bottom = 25.75, right = -67, top = 49,
                                             mapType = "toner-lite", Zoom = 5){
                         
                         # if (missing(left)) {
                         #left <- as.numeric(readline("What is the value of lowerleft longitude?"))}
                         # if (missing(bottom)) {
                         #bottom <- as.numeric(readline("What is the value of lowerleft latitude?"))}
                         # if (missing(right)) {
                         #right <- as.numeric(readline("What is the value of upperright longitude?"))}
                         # if (missing(top)) {
                         #top <- as.numeric(readline("What is the value of upperright latitude?"))}
                         
                         
                         stopifnot(is.numeric(left), length(left) == 1)
                         stopifnot(is.numeric(bottom), length(bottom) == 1)
                         stopifnot(is.numeric(right), length(right) == 1)
                         stopifnot(is.numeric(top), length(top) == 1)
                         stopifnot(is.numeric(Zoom), length(Zoom) == 1)
                         stopifnot(is.character(mapType))
                         
                         private$.left <- left
                         private$.bottom <- bottom
                         private$.right <- right
                         private$.top <- top
                         private$.mapType <- mapType
                         private$.zoom <- Zoom
                         
                         private$getMap()
                         
                       },
                       
                       showMap = function(){
                         
                         longitude = c(private$.left, private$.right)
                         latitude = c(private$.bottom, private$.top)
                         sites = data.frame(Longitude = longitude, Latitude = latitude)
                         
                         ggmap(private$.myMap, legend = "right") +
                           geom_point(data = sites, aes(x = Longitude, y = Latitude),
                                      size = 2, shape=19)
                         
                       },
                       
                       saveMap = function(){
                         self$showMap()
                         ggsave(filename="myMap.png",
                                width=6, height=6, units = "in")
                         
                       }
                     ),
                     
                     private = list(
                       .left = NA,
                       .bottom = NA,
                       .right = NA,
                       .top = NA,
                       .zoom = NA,
                       .mapType = NA,
                       .myMap = NA,
                       
                       getMap = function(){
                         private$.myMap <- get_stamenmap(c(private$.left, private$.bottom,
                                                           private$.right , private$.top ),
                                                         maptype = private$.mapType,
                                                         crop = TRUE, zoom = private$.zoom)
                         
                         self
                       }
                       
                     )
)



