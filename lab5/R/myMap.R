 library(httr)
 library(jsonlite)
 library(ggmap)

mapStamen <- setRefClass("mapStamen",
                         fields = list(
                           myMap = "Raster"
                           
                         ),
                         methods = list(
                           
                           initialize = function(){
                             
                             myBox <- c(left = 86.05,
                                        bottom = 27.21,
                                        right = 87.81,
                                        top = 28.76)
                             
                             Prompt <- readline("The default map illustrates
                             a crop of mountain Everest;Continue with that?[Y/N]: ")
                             
                             if(tolower(Prompt) == "n"){
                               
                               left <- as.numeric(readline("What is the value of lowerleft lon?"))  
                               bottom <- as.numeric(readline("What is the value of lowerleft lat?"))
                               right <- as.numeric(readline("What is the value of upperright lon?"))
                               top <- as.numeric(readline("What is the value of upperright lat?"))
                             }
                             
                             myBox <- c(left , bottom , right , top )
                             
                             
                             myMap <<- get_stamenmap(bbox = myBox,
                                           zoom = 10,
                                           maptype = c("terrain-background"),
                                           crop = TRUE)
                           },
                           
                           showMap = function(){

                             ggmap(myMap)
                           }
                         )
)
                         


