# Block Grabber

This simple script grabs decennial census block level data for the DVRPC region and exports it as both a .csv and .shp.

## Getting the Code and Software

1. Clone the repository. 
2. Download and install R from https://www.r-project.org/
3. Download and install R Studio from https://www.rstudio.com/products/rstudio/#Desktop

## Installing Package Dependencies 

The R script has the following dependencies: 

library(plyr); library(here); library(sf); library(summarytools); library(survey); library(srvyr); library(sjmisc)
library(tidycensus); library(tidyverse); library(tigris); library(dplyr); library(descr); library(sp); library(rgdal);

If you have not previously installed the dependencies, you will need to do so. If you try to run the script without installing the packages, you will get an error message like 
`Error in library (name_of_package) : there is no package called 'name_of_package'`.

Install each package from R Studio's console (typically at the bottom of the screen in R Studio) with the command  `install.packages('name_of_package')` (include the quotation marks). 

## Selecting Varibles
A list of variables can be loaded using the following command.
`variCatalog <- load_variables(2010, "sf1", cache = TRUE)`
`View(variCatalog)`

## Running the Code

1. Open RStudio. 
2. Open the R file (File -> Open File)
3. Run the code by clicking the Source button or Ctrl+A followed by Ctrl+Enter. 
 
If you see an error about packages not being installed, see [Installing Package Dependencies](#installing-package-dependencies) above. 

Please provide your own API Key (this is required for the `tidycensus` package, not the Census API), you may get another one [here](https://api.census.gov/data/key_signup.html).

### Outputs 

After the code has finished, outputs are saved in the /outputs subdirectory of where you cloned the repository on your local machine, including:
- blockGrabberOut.csv: block-level statistics for the requested variables
- blockGrabberOut.shp: spatial version of ipd.csv
