# Exercise: Day3_session01_gophr_msd_functions


# SETUP -------------------------------------------------------------------

library(tidyverse)
library(gagglr)
library(clipr)


metadata <- get_metadata("Data", "PSNU_IM.*South Africa") #list of MSD metadata elements

# IMPORT ------------------------------------------------------------------

df_msd <- return_latest("Data", "PSNU_IM") %>% 
  read_psd()  #imports the MER structured datasets from pano/datim genie etc 


# EXERCISE ----------------------------------------------------------------

#let's look first at how indicators are encoded in the MSD
df_msd %>% 
  filter(indicator == "TX_PVLS") %>% 
  count(indicator, numeratordenom)

#clean_indicator() is a function from gophr that adjusts the indicator names
  # adds _D to denominator indicator
  # also play around with other functions in gophr to clean the MSD

df_msd %>%
  filter(indicator == "TX_PVLS") %>% 
  clean_indicator() %>% 
  count(indicator, numeratordenom)


?gophr::clean_ #fill in underscore


# filter to Index testing for Alfred Nzo across qtrs
  # what do we add to pivot this?
df_semi <- df_msd %>% 
  filter(indicator %in% c("HTS_TST", "HTS_TST_POS"),
         standardizeddisaggregate == "Modality/Age/Sex/Result",
         modality == "Index",
         psnu %in% c("ec Alfred Nzo District Municipality")) %>% 
  group_by(fiscal_year, psnu, indicator) %>% 
  summarize(across(c(starts_with("qtr")), \(x) sum(x, na.rm = TRUE)),
            .groups = "drop") %>% 
  arrange(indicator)

#what differences do you notice with the different reshape_msd() options?

df_semi %>% 
  reshape_msd()

df_semi %>% 
  reshape_msd("wide") 

df_semi %>% 
  reshape_msd("long", include_type = FALSE) 