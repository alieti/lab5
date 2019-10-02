library(httr)
library(jsonlite)
library(ggmap)
library(R6)

MapStamen <- R6Class("MapStamen",
                     public = list(
                       
                       initialize = function(left, bottom, right, top){
                         
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
                         
                         private$.left <- left
                         private$.bottom <- bottom
                         private$.right <- right
                         private$.top <- top
                         
                         
                         private$getMap()
                         
                       },
                       
                       showMap = function(){
                         
                         ggmap(private$.myMap)
                       }
                     ),
                     
                     private = list(
                       .left = NA,
                       .bottom = NA,
                       .right = NA,
                       .top = NA,
                       .myMap = NA,
                       
                       getMap = function(){
                         private$.myMap <- get_stamenmap(c(private$.left, private$.bottom,
                                                           private$.right , private$.top ),
                                                         zoom = 10,
                                                         maptype = c("terrain-background"),
                                                         crop = TRUE)
                         
                         self
                       }
                       
                     )
)