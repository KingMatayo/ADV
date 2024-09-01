#Setup connection of Rstudio with Github in 2 steps!

#Step1 : 1st create a PAT (Personal Access Token) Key / Password

#1.1 Running the code below will take you to GitHub website where you'll generate a PAT
library(usethis)
create_github_token()

#Step2 : 2nd use gitcreds function to connect to GitHub

#2.1 When it asks for password, paste in the PAT
#If you get an error, just try restarting Rstudio

library(gitcreds)
gitcreds_set()
