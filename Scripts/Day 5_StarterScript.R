# PROJECT: R-Strategy
# AUTHOR:   *insert your name here* | USAID
# PURPOSE:  *insert your topic here*
# REF ID:   f548d4ea 
# LICENSE:  MIT
# DATE:     2024-04-10
# UPDATED: USAID South africa - data review exercise

# DEPENDENCIES ------------------------------------------------------------
  
# Library
library(tidyverse)
library(gagglr)
library(scales)

# add anything else you want
  # library(sf)
  # library(gt)
  # library(gisr)
  

# GLOBAL VARIABLES --------------------------------------------------------
  
  # SI specific paths/functions  
    load_secrets()

#store filepath
filepath <- return_latest("Data", "PSNU_IM.*South Africa")

# Grab metadata
metadata <- get_metadata(filepath) 
  
  ref_id <- "f548d4ea"

# IMPORT ------------------------------------------------------------------

  # Load data
  df_msd <- return_latest("Data", "PSNU_IM.*South Africa") %>%
    read_psd()    
  
# MUNGE -------------------------------------------------------------------
  
# what are the steps you need to take to get your data in the right format?
  
  df_msd %>% 
    "..." %>% 
    
  
#assign your final df from this section to df_viz  
  
# VIZ  -------------------------------------------------------------------
  
  df_viz %>% 
    "..." %>% 
    "..."
  
  
  
