# Exercise: Day4_session02_intro_to_ggplot2_exercise_4_exploring_themes


# SETUP -------------------------------------------------------------------

  # Library
  library(tidyverse)
  library(gagglr)
  
# Load data
df_msd <- return_latest("Data", "PSNU_IM.*South Africa") %>%
  read_psd()

# Set core data frame for exercises and examples
df_tst_agency <- df_msd %>%
  filter(indicator == "HTS_TST_POS",
         standardizeddisaggregate == "Total Numerator") %>%
  summarize(
    cumulative = sum(cumulative, na.rm = T),
    .by = c("fiscal_year", "indicator", "funding_agency")
  ) %>%
  mutate(fy = as.character(fiscal_year)) %>% 
  arrange(funding_agency) 

glimpse(df_tst_agency)
names(df_tst_agency)
  
  
# EXERCISE ----------------------------------------------------------------

  # Instructions: Experiment with different theme settings
  # Using the starter code below, try adding different themes to plots
  # What do you notice about the different themes?
  # Try changing some of the theme arguments, what happens?
  ?theme_dark()
  
  
  # Theme dark
df_tst_agency %>% 
    ggplot(aes(x = fy, 
               y = cumulative)) +
    geom_col() + 
    facet_wrap(~funding_agency) +
    theme_"..."
  
  
  # Theme bw
df_tst_agency %>% 
    ggplot(aes(x = fy, 
               y = cumulative)) +
    geom_col() + 
    facet_wrap(~funding_agency) +
    theme_"..."
  
  
  # Theme SI style
df_tst_agency %>% 
    ggplot(aes(x = fy, 
               y = cumulative)) +
    geom_col() + 
    facet_wrap(~funding_agency) +
    si_style()
  
  
  # Theme SI ygrid
df_tst_agency %>% 
    ggplot(aes(x = fy, 
               y = cumulative)) +
    geom_col() + 
    facet_wrap(~funding_agency) +
    si_style_"..."
  
  
  # Theme SI xgrid
df_tst_agency %>% 
    ggplot(aes(x = fy, 
               y = cumulative)) +
    geom_col() + 
    facet_wrap(~funding_agency) +
    si_style_"..."
  
  # What does the help for theme() return?
  