# this script details the mapping of fields from various tables from the Insektmobilen project (2017-2020, Denmark) to DwC-A v2. Much of the data is already shared in the current DwC-A format (occurrence core with multimedia, DNA-derived, eMoF extensions) here: https://www.gbif.org/dataset/cb8a261a-66cb-4068-809e-9e773359bb30.  

# the data will be mapped as survey class and contains morphological IDs, DNA metabarcoding derived IDs, material gathering, citizen science sampling and land cover and land use information. Mapping of the data is based on the following model of the data: https://docs.google.com/presentation/d/11SbnYMo-2DGKUHSOhDJe0ZSuvmHWy3Y8uWFVYM1SV5c/edit?usp=sharing. 

### load libraries ######################
library(tidyverse)
library(dplyr)
library(readr)
library(stringr)
library(seqinr)
library(zoo)
library(sp)
library(lubridate)
library(sf)


