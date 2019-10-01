 library(httr)
 library(jsonlite)
 library(ggmap)
 library(R6)

mapStamen <- R6Class("mapStamen",
                         public = list(
                           left = NA,
                           bottom = NA,
                           right = NA,
                           top = NA,
                           myMap = NA,
                        
                           
                           initialize = function(left, bottom, right, top){
                             
                             if (!missing(left)) self$left <- left
                             if (!missing(bottom)) self$bottom <- bottom
                             if (!missing(right)) self$right <- right
                             if (!missing(top)) self$top <- top
                             
                             if (missing(left)) {self$left <- as.numeric(readline("What is the value of lowerleft longitude?"))}
                             if (missing(bottom)) {self$bottom <- as.numeric(readline("What is the value of lowerleft latitude?"))}
                             if (missing(right)) {self$right <- as.numeric(readline("What is the value of upperright longitude?"))}
                             if (missing(top)) {self$top <- as.numeric(readline("What is the value of upperright latitude?"))}
                             
                             
                            
                             self$myMap <- get_stamenmap(c(self$left , self$bottom , self$right , self$top ),
                                                         zoom = 10,
                                                         maptype = c("terrain-background"),
                                                         crop = TRUE)
                           },
                           
                           
                           
                           showMap = function(){

                             ggmap(self$myMap)
                           }
                         )
)
                         


