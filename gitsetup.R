#load the usethis package

library(usethis)

# Configure git by giving it your name and email - all this will be updated behind the scences
# You only need to configure this once
use_git_config(
  user.name = "King Matayo" , 
  user.email = "kingmatayo.thefirst@gmail.com")

#Initialize git - this will restart Rstudio with a tab for Git
#You only need to do this once e.g. when using R studio on a new computer
use_git()
