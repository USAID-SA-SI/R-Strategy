# Exercise: Day4_session02_intro_to_ggplot2_exercise_2_exploring_aesthetics


# SETUP -------------------------------------------------------------------

  # Library
  library(tidyverse)
  library(gagglr)
  
  # Load data
  df_msd <- return_latest("Data", "PSNU_IM.*South Africa") %>%
    read_psd()
  
  # Set core data frame for exercises and examples
  df_tst_snu <- df_msd %>%
    filter(indicator == "HTS_TST_POS",
           standardizeddisaggregate == "Total Numerator") %>%
    summarize(
      cumulative = sum(cumulative, na.rm = T),
      .by = c("fiscal_year", "indicator", "snu1")
    ) %>%
    mutate(fy = as.character(fiscal_year)) %>% 
    arrange(snu1)
  
  glimpse(df_tst_snu)
  names(df_tst_snu)

# EXERCISE ----------------------------------------------------------------

  # Instructions: Experiment with different aesthetic mappings
  # Using the starter code below, try different mappings for 
  # size, shape, color, fill, and alpha
  ?aes()
  
  
  # Starter columns
  # provide columns for the aesthetic mapping below
  df_tst_snu %>%
    ggplot(mapping = aes(x = fy, y = cumulative, fill = "...")) +
    geom_col()
  
  
  # Starter points
  # provide columns for the aesthetic mapping below
  df_tst_snu %>%
    ggplot(aes(x = "...", y = "...", size = "..." , color = "...", shape = "...")) +
    geom_point()
  
  
  # Starter lines
  # provide columns for the aesthetic mapping below
  df_tst_snu %>%
    ggplot(aes(x = "...", y = "...", size = "...", color = "...")) +
    geom_line()
  
  
  # Explore -- try your own combinations
  