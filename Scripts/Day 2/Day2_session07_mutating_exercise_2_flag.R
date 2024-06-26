# Exercise: Day2_session07_mutating_exercise_2_flag.R


# SETUP -------------------------------------------------------------------

  # Library
  library(tidyverse)
  library(gagglr)
  
  # Load data
  df_msd <- return_latest("Data", "PSNU_IM") %>%
    read_psd()
  
  # Filter dataset to just HTS data
  df_index_psnu <- df_msd %>% 
    filter(indicator == "HTS_TST_POS",
           modality %in% c("Index", "IndexMod"),
           fiscal_year == 2023) %>%
    group_by(fiscal_year, psnu) %>% 
    summarize(across(c(targets, cumulative), 
                     \(x) sum(x, na.rm = TRUE)),
              .groups = "drop") %>% 
    arrange(desc(targets)) 

# EXERCISE PART I ---------------------------------------------------------


  # Create a dummy variable based on whether the PSNU has low target achievement 
  # in Q4 for index testing.
  # Calculate achievement (cumulative / targets)
  # Calculate a boolean variable called low_achv to flag if the achievement is low, i.e. below 40% for Q2. 
  
  df_flag <- df_index_psnu %>% 
    mutate(achievement = "...",
           low_achv = "...")
  

# EXERCISE PART II --------------------------------------------------------

  # If a PSNU has a low achievement, apply a color to flag this as important for
  # our data visualization
  # Calculate achievement (cumulative / targets)
  # If the achievement is low, i.e. below 100% in Q4, use an ifelse() statement 
  # to set the value to ‘purple’, otherwise gray (#909090) for the variable 
  # achv_color  
  
  ?ifelse
  
  df_flag %>%  
    mutate(achv_color = ifelse("...", "...", "..."))
  

# EXERCISE PART III -------------------------------------------------------

  # Calculate a multi-step condition statement, first with a nested ifelse() 
  # and then use case_when() 
  # If the achievement is low, i.e. below 100% for Q4, use an ifelse() statement 
  # to set the value to ‘purple’, NA for values that are not finite, otherwise 
  # gray (#909090)
  # Repeat this process with a case_when() statement
  
  
  df_flag %>%  
    mutate(achv_color = ifelse(low_achv == TRUE, "...", 
                               ifelse(is.infinite("..."), NA, "...")))
  
  df_flag %>% 
    mutate(achv_color = case_when(low_achv == TRUE ~ "purple",
                                  is.infinite(achievement) ~ NA_character_,
                                  TRUE ~ "#909090"))
           
           
  