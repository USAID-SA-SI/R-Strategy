# Exercise: Day4_session02_intro_to_ggplot2_exercise_3_exploring_geoms


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
  # Using the starter code below, try applying different geoms
  ?geom_line()
  
  
  # columns
  df_tst_snu %>%
    ggplot(aes(x = fy, y = cumulative, fill = "...")) +
    geom_col()
  
  
  
  # points (scatterplot)
  #
  df_tst_snu %>%
    ggplot(aes(x = fy, y = cumulative, color = "...")) +
    geom_point()
  
  
  
  # points (scatterplot)
  df_tst_snu %>%
    ggplot(aes(x = fy, y = cumulative, group = snu1, size = "...")) +
    geom_line()
  
  
  
  # Area (scatterplot)
  df_tst_snu %>%
    ggplot(aes(x = fy, y = cumulative, 
               group = snu1, fill = "...")) +
    geom_area() +
  facet_wrap(~snu1)
  
  
  # Try combining some of the aesthetics
  