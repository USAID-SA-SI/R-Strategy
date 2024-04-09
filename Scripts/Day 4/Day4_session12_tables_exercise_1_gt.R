# Exercise: Day4_session12_tables_exercise_gt


# SETUP -------------------------------------------------------------------
  
  # Install gt and gtExtras if needed
  install.packages("gt")
  install.packages("gtExtras")
  
  # Library
  library(tidyverse)
  library(gagglr)
  library(scales)
  library(gt)
  library(gtExtras)


  # Load PSNU x IM data
  df_msd <- return_latest("Data", "PSNU_IM.*South Africa") %>%
    read_psd()

  # Set core data frame for exercises and examples
  # Sequence of operations
  # 1) Filter HTS POS indicator and 2060 fiscal year
  # 2) summarize targets and cumulative results by fiscal year, psnu, snu1 and indicator
  # 3) Create a new variable (fy) that transform fiscal year variable as character type
    df_tst_psnu <- df_msd %>%
      filter(indicator == "HTS_TST_POS",
             standardizeddisaggregate == "Total Numerator") %>%
      group_by(fiscal_year, snu1, psnu) %>% 
      summarize(across(c(cumulative, targets), 
                       \(x) sum(x, na.rm = TRUE)),
                .groups = "drop") %>% 
      mutate(achievement = cumulative / targets)
  
  # Take a look at the structure of the spatial data
    glimpse(df_tst_psnu)
    names(df_tst_psnu)   

# EXERCISE ----------------------------------------------------------------

  #Instruction: Use the df_tst_psnu data frame to explore gt()
  # Create a summary table of testing results by psnu
  # Consult the fmt_number() and fmt_percent() functions to learn about formatting
  
  df_tst_psnu %>% 
    gt() %>% #run just until this line to see what the base output is
    fmt_number(columns = c("...", "..."), 
               decimals = "...") %>% 
    fmt_percent(columns = "...", 
                decimals = "...")
  
  # Experiment between groupname_col and rowname_col arguments within gt() function
  df_tst_psnu %>% 
    gt(groupname_col  = "...") %>% 
    fmt_number(columns = c("...", "..."), 
               decimals = "...") %>% 
    fmt_percent(columns = "...", 
                decimals = "...")
  
  df_tst_psnu %>% 
    gt(rowname_col  = "...") %>% 
    fmt_number(columns = c("...", "..."), 
               decimals = "...") %>% 
    fmt_percent(columns = "...", 
                decimals = "...")
  
  # Experiment with the tab_options() function and arguments
  df_tst_psnu %>% 
    gt(groupname_col  = "...") %>% 
    fmt_number(columns = c("...", "..."), 
               decimals = "...") %>% 
    fmt_percent(columns = "...", 
                decimals = "...") %>% 
    tab_options(data_row.padding = "...",
                table.font.size = "...",
                row_group.padding = "...",
                row_group.font.weight = "...")
  
  

  