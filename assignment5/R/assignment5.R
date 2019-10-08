
#' A stamen map API, Assignment5 - tornado mapping  package in R.
#' @description This package contains the code for Mapping Torenado's in United States of America. A tornedo map function is created which takes two arguments and returns the location in map view.
#' @param lati,longi Takes in two parameters, lati takes a geo coordination - latitude, numeric type and longi takes a geo coordination - longitude of numeric type.
#' @return Returns the map of tornedo.map function.
#' @export 



tornado.map<-function(lati,longi)

{
  if(is.numeric(lati)&is.numeric(longi))
  {
    
    #load packages
    library(ggmap)
    library(ggplot2)
    
    # get data from source
    tornado<-read.csv("https://www.spc.noaa.gov/wcm/data/2018_torn.csv" )
    
    #making bounding box for a given latitude/longitude
    
   
 bbox<- c(left = longi-5, bottom =lati-5, right = longi+5, top = lati+5)
(slon <- sample(tornado$slon ))
(slat <- sample(tornado$slat ))
get_stamenmap(bbox, zoom = 5, maptype = "terrain") %>% ggmap() +
  geom_point(aes(x = slon, y = slat), data = tornado , colour = "red", size = 2)
  }
  else(stop())
}

