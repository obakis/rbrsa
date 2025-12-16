### Useful links
### https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/
### https://kbroman.org/pkg_primer/pages/docs.html
###Creating rbrsa package
### 1. write main R functions fetch_*
### 2. write utils.R and data.R. Here I decided to nake data internal.
###.   it could be external as well. No big deal
### 3.DECSRIPTION, LICENSE, LICENSE.md, README.md, NEWS.md
### 4. Create rbrsa folder with following subfolder: R
library(usethis)
usethis::create_package("rbrsa")
library(fs)
dir_tree("rbrsa", all = TRUE)
### 5. Move all functions go into R subfolder, others in rbrsa
### 6. Processing the Roxygen2 comments to create docs (Rd files)
### and to add relevant info in NAMESPACE file 
# install.packages("pak")
# library(pak)
# pak::pkg_install("devtools")
library(devtools)
setwd("~/bddk_data/rbrsa")
devtools::document()      # Looks for "./DESCRIPTION"
# rm(list = ls(pattern = "^fetch_"))
# rm(list = ls(pattern = "^list_"))
# rm(save_data, plaka_to_city)
devtools::load_all()      # Loads from "./" directory
devtools::check()         # Checks "./" for rbrsa package
### 7. Using Turkish characters in .R files creates warnings.
### One solution is converting those objects into CSV files in data-raw
### Added new file (create_internal_data.R) in data-raw which we will 
### source before calling document(), load_all() and check()
### This file saves internal data in data-raw to R/sysdata.rda

source("data-raw/create_internal_data.R")

### 8. installing locally first 
##devtools::install() ## problematic
## In bash terminal
#cd ~/bddk_data/rbrsa
#R CMD INSTALL .
# Or install from inside R
install.packages(".", repos = NULL, type = "source")

### 9. Testing before CRAN submission
#pak::pkg_install("obakis/rbrsa")
library(rbrsa)
list_groups("bddk","en")
list_groups("bddk","tr")
d=fetch_finturk(2024, 3, 2024, 9, table_no = 1,
                grup_kod = c(10005,10006),il = c(6,34,44))
head(d)

d=fetch_bddk(2024, 1, 2024, 3, table_no = 1,
             grup_kod = c(10005,10006),lang="tr")
head(d)

### 10. Build NAMESPACE and Rd files
devtools::document()

### 11. Check before CRAN submission
devtools::check() 

### 10. BUild tar.gz for CRAN submission
devtools::build() # tar.gz for CRAN submission !
### or using R CMD Install (from bash)
# R CMD build .  # Creates rbrsa_0.1.0.tar.gz


### when the tar.gz file is opened there i sno data-raw and all files inside it.
### but we have sysdata.rda in R folder !


#########################################################
##################### INITIAL COMMIT TO GITHUB
### See "_create_rbrsa.sh"
# REPO_URL="https://github.com/obakis/rbrsa.git"
# git init
# git remote add origin "$REPO_URL"
# git remote -v
# git add .
# git commit -m "Initial commit of rbrsa package"
# git push -u origin main

#########################################################
##################### further debugging
library(devtools)
setwd("~/bddk_data/rbrsa")
# rm(list = ls(pattern = "^fetch_"))
# rm(list = ls(pattern = "^list_"))
# rm(save_data, plaka_to_city)
devtools::document()
devtools::install() 
library(rbrsa)
#fetch_bddk1(2005, 1,table_no = 3, grup_kod = 1001)
list_groups("bddk")
# Remove the installed version
remove.packages("rbrsa")
setwd("~/bddk_data/rbrsa")
devtools::document()
devtools::install()

######### yeni install.
"rbrsa" %in% installed.packages()
remove.packages("rbrsa")
setwd("~/bddk_data/rbrsa")
# Try minimal rebuild
unlink("NAMESPACE")
unlink("man", recursive = TRUE)
### when there is need for deep clean
## From your package root directory in Terminal
# rm -rf man NAMESPACE
# Rscript -e "devtools::document()"
# Rscript -e "devtools::check()"
# Rscript -e "devtools::build()"

devtools::document()
#roxygen2::roxygenise() # to use roxygen2 without devtools

source("data-raw/create_internal_data.R")
# Install using base R
install.packages(".", repos = NULL, type = "source")
library(rbrsa)
