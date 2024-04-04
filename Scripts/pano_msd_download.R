# load libraries
library(tidyverse)
library(glamr)
library(grabr)

#load secrets
load_secrets()

#store username and password
user <- pano_user()
pass <- pano_pwd()

#initiate session
sess <- pano_session(username = user, password = pass)
url <- "https://pepfar-panorama.org/forms/downloads/"
cont <- grabr:::pano_content(page_url = url, session = sess)

cont

#get all OU level
pano_extract_msds(operatingunit = NULL,
                  archive = TRUE,
                  dest_path = si_path())

#moz level
pano_extract_msds(operatingunit = "Mozambique",
                  archive = TRUE,
                  dest_path = si_path())

#SA level
pano_extract_msds(operatingunit = "South Africa",
                  #archive = TRUE,
                  dest_path = si_path())
