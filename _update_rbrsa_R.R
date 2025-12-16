
#########################################################
#########################################################
##################### updating
###### workflow
# 0.Prepare data and modify R files
# 1.Test the new features or fixes.
# 2.Update docs (roxygen, vignettes, etc.) 
# 3.Update NAMESPACE and Rd files using devtools::document()
# 4.Run checks with devtools::check() 
# 5.Commit all changes to git and Push to GitHub
# 6.Build documentation website with pkgdown::build_site()
# 8.Build for CRAN
# 9.Submit CRAN

# 0. Set working directory to your package (you already do this)
# and source the data creation script. This updates R/sysdata.rda.
setwd("~/bddk_data/rbrsa")
source("data-raw/create_internal_data.R")
myfiles = c(
  "_create_rbrsa.sh",
  "_update_rbrsa.sh",
  "_call_update_rbrsa.sh",
  "_create_update_rbrsa_R.R",
  "_create_update_rbrsa_website.R"
)
usethis::use_build_ignore(myfiles)

# 1. To test modifications. Load local R files : simulates `library(rbrsa)` 
devtools::load_all()
#### TESTING
list_groups("finturk")
list_cities()
fetch_finturk1(year = 2020, month = 3, table_no = 1,grup_kod = 10001,il = 0)
fetch_finturk1(year = 2020, month = 3, table_no = 1,grup_kod = 10001,
               il = c(6,34,44))
fetch_finturk1(year = 2020, month = 3, table_no = 1,
               grup_kod = c(10006,10007),il = c(6,34,44))
d=fetch_finturk(2024, 3, 2024, 9, table_no = 1,
                grup_kod = c(10005,10006),il = c(6,34,44))
head(d)

fetch_bddk1(year = 2020, month = 3, table_no = 1,
            grup_kod = c(10005,10006),lang="tr")
d=fetch_bddk(2024, 1, 2024, 3, table_no = 1,
             grup_kod = c(10005,10006),lang="tr")
head(d)
View(d)

# 2. Update docs (roxygen, vignettes, etc.) 
# 3. After changes reload totest the new code. Assuming 
# everything works, update  DESCRIPTION & NEWS.md. But since
# version number will be reflected to them FIRST bump version number
devtools::load_all() 
## To update the DESCRIPTION and NEWS.md 
usethis::use_version("minor") # Or "major", "patch"
## since document() updates NAMESPACE and Rd files it must be run after use_version
devtools::document() # 
# 4. Run checks
devtools::check()    
### Modify R files, vignette or Roxygen comments and 
#### again (iterate if necessary)
devtools::load_all() 
devtools::document()  
devtools::check()    

# 5.Manually edit DESCRIPTION (for new Imports or Suggests packages)
# and NEWS.md to reflect new changes in the new release

# 6.To preview locally the documentation website use
pkgdown::build_site()
## NOTEActually this is not necessary for deployment. Its purpose is 
## purely to test and preview the vignette and the entire website 
## locally before pushing. In reality when a vignette, Rd and and 
## Roxygen comments are committed to GitHub our repository contains 
## a hidden configuration file (.github/workflows/pkgdown.yaml) that 
## was created when you first set up pkgdown with 
## usethis::use_pkgdown_github_pages().
## GitHub Actions runs pkgdown::build_site() on a cloud-based server.
## The workflow deploys the result. It takes the built website files 
## (/docs folder) from that cloud server and pushes them to the gh-pages 
## branch of your repository.



# 7. Commit to GitHUB
# First version number if necessary and from terminal 
#./_call_update_brsra.sh

# 8. Build for CRAN
devtools::build() # tar.gz for CRAN submission !
### or using R CMD Install (from bash)
# R CMD build .  # Creates rbrsa_0.1.0.tar.gz
# 8.Submit CRAN

#################################################################
##### NOTE: If load_all() is not available fro any reason
# detach("package:rbrsa", unload=TRUE)
# "rbrsa" %in% installed.packages()
# remove.packages("rbrsa")
# # a. Clean environment (optional but good practice)
# rm(list = ls(pattern = "^fetch_|^list_|save_data|plaka_to_city|cities"))
# # b. REGENERATE INTERNAL DATA (IF data-raw/ changed)
# source("data-raw/create_internal_data.R")  # UNCOMMENT WHEN NEEDED
# # c. installing locally first as above
# install.packages(".", repos = NULL, type = "source")
# # d. test functionality	
# library(rbrsa)
################################################


#########################################################
##################### GITHUB updating
### See "_call_update_rbrsa.sh" for improved version
# git add --all # "git add ." does not work !!! 
# git commit -m "Your update message"
# git push  # No need for `-u origin main` anymore!

