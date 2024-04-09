# Exercise: Day4_session08_axes_text_titles_exercise_1_labs


# SETUP -------------------------------------------------------------------

  # Library
  library(tidyverse)
  library(gagglr)
  library(scales)
  
  # Load data
  df_msd <- return_latest("Data", "PSNU_IM.*South Africa") %>%
    read_psd()
  
  # Set core data frame for exercises and examples
  df_tst_psnu <- df_msd %>%
    filter(indicator == "HTS_TST_POS",
           standardizeddisaggregate == "Total Numerator",
           fiscal_year == 2023) %>%
    group_by(fiscal_year, psnu, indicator) %>% 
    summarize(across(c(targets, cumulative), 
                     \(x) sum(x, na.rm = TRUE)),
              .groups = "drop") %>%
    mutate(fy = as.character(fiscal_year)) %>% 
    arrange(desc(cumulative)) %>%
    slice(1:8) #grab top 8 HTS_POS psnus
  
  glimpse(df_tst_psnu)
  names(df_tst_psnu)
  

# EXERCISE ----------------------------------------------------------------

  # Instructions: Practice manipulating text on ggplot2 graphs
  
  # Base plot
  p <- df_tst_psnu %>% 
    filter(fiscal_year == 2023) %>% 
    mutate(psnu_order = fct_reorder(psnu, cumulative)) %>% 
    ggplot(aes(y = psnu_order, x = cumulative)) +
    geom_col()
   
  # Print the base plot to the screen 
  p
  
  # Base plot -- add a subtitle
  p + "..."
  
  
  
  # Modify the x and y axes
  p + "..."
  
  
  # Add a caption
  p + "..."

  
  # Using the df_tst_psnu data frame, create a new plot
  
  # Create a new plot that:
    #   changes the x and y axis tick labels to top and right
    #   adds an informative title
    #   adds a caption to indicate the data source
    #   relabels the x and y axis labels to be more informative
    #   Formats all numbers with commas using the scales package
  
  
  df_tst_psnu %>% 
    mutate(psnu_order = fct_reorder(psnu, cumulative)) %>%
    ggplot(aes(x = "...", y = ""..."")) +
    geom_"..." + #what geom to use for bar chart?
    scale_"..." + #how to make axis formatted with commas?
    labs("..." = "...", 
         "..." = "...", 
         "..." = "...", 
         "..." = "...")
  