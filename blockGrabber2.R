# Dependencies
library(plyr); library(here); library(sf); library(summarytools); library(survey); library(srvyr); library(sjmisc)
library(tidycensus); library(tidyverse); library(tigris); library(dplyr); library(descr); library(sp); library(rgdal); library(raster)
getwd()
census_api_key("enter your api key here", overwrite = TRUE)


#enter variables here
vari <- c("P042001", "P042002", "P042003", "P042004", "P042005", "P042006", "P042007", "P042008", "P042009", "P042010")


#grabbing block level data
c34005<- get_decennial(geography = "block", year = 2010, state = "NJ",
                       county = "005", variables = vari, output = "wide", geometry = TRUE)
c34007<- get_decennial(geography = "block", year = 2010, state = "NJ",
                       county = "007", variables = vari, output = "wide", geometry = TRUE)
c34015<- get_decennial(geography = "block", year = 2010, state = "NJ",
                       county = "015", variables = vari, output = "wide", geometry = TRUE)
c34021<- get_decennial(geography = "block", year = 2010, state = "NJ",
                       county = "021", variables = vari, output = "wide", geometry = TRUE)
c42017<- get_decennial(geography = "block", year = 2010, state = "PA",
                       county = "017", variables = vari, output = "wide", geometry = TRUE)
c42029<- get_decennial(geography = "block", year = 2010, state = "PA",
                       county = "029", variables = vari, output = "wide", geometry = TRUE)
c42045<- get_decennial(geography = "block", year = 2010, state = "PA",
                       county = "045", variables = vari, output = "wide", geometry = TRUE)
c42091 <-get_decennial(geography = "block", year = 2010, state = "PA",
                       county = "091", variables = vari, output = "wide", geometry = TRUE)
c42101 <-get_decennial(geography = "block", year = 2010, state = "PA",
                       county = "101", variables = vari, output = "wide", geometry = TRUE)
#binding data
finalDF <- rbind(c34005, c34007, c34015, c34021,c42017,c42029, c42045, c42091, c42101)
finalDF$GEOID <- as.numeric(finalDF$GEOID)

#exporting your files
st_write(finalDF, "blockGrabberOut.shp", delete_layer = TRUE)
write.csv(finalDF, here("blockGrabberOut.csv"))
