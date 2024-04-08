# Exercise: Day4_session05a_practice_1_exploration


# SETUP -------------------------------------------------------------------

  # Library
  library(tidyverse)
  library(gagglr)
  
  #msd path
  path_msd <- return_latest("Data", "PSNU_IM.*South Africa")
  
  #grab metadata about MSD
  metadata <- get_metadata(path_msd) #list of MSD metadata elements
  
  # Load data
  df_msd <- read_psd(path_msd)
  
  # Filter and aggregate index data by agency
  df_index_agency_trend <- df_msd %>% 
    clean_agency() %>% 
    filter(indicator == "HTS_TST",
           indicatortype != "CS",
           standardizeddisaggregate == "Modality/Age/Sex/Result",
           target_modality_2024 %in% c("Active Index")) %>%
    group_by(fiscal_year, funding_agency) %>% 
    summarize(across(c(targets, cumulative), 
                     \(x) sum(x, na.rm = TRUE)),
              .groups = "drop") %>% 
    arrange(desc(targets))
  
  # Calculate achievement and flag colors for 2024 (since this isnt a full year)
  df_index_agency_trend <- df_index_agency_trend %>% 
    mutate(achievement = cumulative / targets,
           bar_color = ifelse(fiscal_year == 2024, "violet", "purple"))
  
  # Create a separate dataset for just the current fiscal year
  df_index_agency_2024 <- df_index_agency_trend %>% 
    filter(fiscal_year == metadata$curr_fy)

# EXERCISE ----------------------------------------------------------------
    
  # Instructions: Think about the questions that lend themselves to these 
  # different types of plots. Before generating, try sketching out what you 
  # want to do. Try generating basic plots using appropriate geoms:
  #   geom_col()
  #   geom_line()
  #   geom_area()
  #   geom_point()
  #   facet_wrap() or facet_grid()
  # Experiment with aesthetics (shape, size, fill/color, alpha (transparency))   
    
    #review data structure
    glimpse(df_index_agency_trend)
    glimpse(df_index_agency_2024)
  
    #review helpfiles for ggplot and geoms
    ?ggplot
    ?geom_col
    
    #generate basic plots for 2024 Q1 results
    df_index_agency_2024 %>% 
      ggplot(aes("...", "...")) + #what should be x? y?
      geom_"..."() #should we use geom_col? geom_point? test around
    

    #let's try showing cumulative index results over time
    df_index_agency_trend %>% 
      ggplot(aes("...", "...")) +
      geom_"..."()
    
    #what about the same trend over time facetted by agency?
    #should we filter to just USAID and CDC?
    df_index_agency_trend %>% 
      ggplot(aes("...", "...")) +
      geom_"..."()
    
    "..." %>% 
      ggplot(aes("...", "...")) +
      geom_"..."()
    