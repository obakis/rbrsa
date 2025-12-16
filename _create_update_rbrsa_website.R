#######################################################
############### Creating website
getwd()
install.packages("pkgdown")
## OLD
# usethis::use_pkgdown()
# pkgdown::build_site() + edit `_pkgdown.yml` file => url: https://obakis.github.io/rbrsa/
# usethis::use_github_action("pkgdown")
# + Enable GitHub Pages
## NEW
# use_pkgdown_github_pages()
# pkgdown::build_site()
# + Enable GitHub Pages

### Phase 1: Initial Setup (Run Once)

## 1.  Initialize pkgdown in your package
usethis::use_pkgdown_github_pages()
## 2. Build the site locally to test
pkgdown::build_site() # creates a `docs/` folder in the local repo

## 3. Upload to github. Using bash from ~/bddk_data/rbrsa 
# git add _pkgdown.yml .github/workflows/pkgdown.yaml
# git commit -m "Set up pkgdown with GitHub Actions"
# git push origin main

### Phase 2: Enable GitHub Pages (One-time, on GitHub.com)
# 
# Go to your repository: https://github.com/obakis/rbrsa
# Click Settings → Pages
# Under "Source", select "Deploy from a branch"
# Under "Branch", select gh-pages and /(root)
# Click Save
# 

### Phase 3: Regular Workflow (After Initial Setup)
# Updating the package documentation is fully automatic
#a. Write/update 
# - R files;
# - Roxygen comments in .R files 
# - Vignettes (Rmarkdown or quarto)
usethis::use_vignette("introduction") #Create the vignettes/ dir if it doesn't exist.

#b. Update documentation
devtools::document()  # Updates NAMESPACE and man/ files

#c. Preview locally
## Actually this is not necessary for deployment. Its purpose is purely to test
## and preview the vignette and the entire website locally before pushing.
pkgdown::build_site() 

#d. Commit and push to GitHub:
# git add --all
# git commit -m "Message..."
# git push origin main

#d. GitHub Actions automatically:
# Builds the pkgdown site
# Deploys it to the gh-pages branch
# Updates https://obakis.github.io/rbrsa/

### Here is the working of the automatization mechanism
# You push code (e.g., your new introduction.Rmd file) to your GitHub repository's main branch.
# GitHub detects the push. Your repository contains a hidden configuration file (.github/workflows/pkgdown.yaml) that was created when you first set up pkgdown with usethis::use_pkgdown_github_pages().
# GitHub Actions (a service) runs the workflow defined in that file. This workflow is a script that, in essence, runs pkgdown::build_site() on a fresh, cloud-based server.
# The workflow deploys the result. It takes the built website files (/docs folder) from that cloud server and pushes them to the gh-pages branch of your repository.
# GitHub Pages serves the gh-pages branch. Your live site at https://obakis.github.io/rbrsa/ updates automatically.


