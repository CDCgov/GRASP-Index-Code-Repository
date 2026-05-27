# CDC/ATSDR SVI 2022 Open Source R Code ----

# Authored by: 
# Phong Le, Public Health Data Scientist

# Reviewers/ Contributors: 
# Phong Le, Public Health Data Scientist
# Sarah Rockhill, Geospatial Epidemiologist, srockhill@cdc.gov
# Frank Curriero, Geospatial Consultant
# Ryan Davis, Geospatial Consultant
# Elizabeth Pembleton, epembleton@cdc.gov


## CDC/ATSDR Social Vulnerability Index ----
# Please refer to the link below to learn more about SVI. 
# https://www.atsdr.cdc.gov/place-health/php/svi/index.html

## Changes in SVI over time ----
# The CDC/ATSDR SVI has changed four times over the years as can be seen in the timeline linked below:
# https://www.atsdr.cdc.gov/place-health/php/svi/index.html#cdc_generic_section_4-changes-over-time

## SVI Methodology ----
# Please refer to the SVI documentation linked below which is stratified by year. 
# https://www.atsdr.cdc.gov/place-health/php/svi/svi-data-documentation-download.html

## Census API Key ----
# A Census API key is required to pull in data. 
# A link to generate your own key is below. 
# https://api.census.gov/data/key_signup.html
# You will need to paste this API key where indicated below.
# Optional (recommended):
# Securely store your API key in your .Renviron file to use across R sessions:
# tidycensus::census_api_key(census_api_key, install = TRUE)
# Note, you only have to save your key in your .Renviron file once. You must
# restart R after saving your key for the first time. 

## SVI R Code Output Differences ----
# County level results are exactly the same as official CDC outputs. 
# Tract level results are minimally different (within 0.0002) due to the different tracts recognized 
# in the SVI calculation and the Census API. 

## SVI Calculation Steps ----
# 1. E Variables: Obtain estimates of the CDC/ATSDR SVI variables from the Census Bureau. 
# 2. EP Variables: Obtain or derive percentages for the 16 CDC SVI variables. 
# 3. EPL Variables: Rank the EP variables to get percentile rankings (or the CDC/ATSDR SVI rankings) for each of the 16 variables.
# 4. SPL Variables: Sum the EPL variables by theme. 
# 5. RPL Variables: Rank the theme-specific SPL variable. 
# 6. Overall SPL Variable (SPL_THEMES): Sum the SPL variables from all four themes. 
# 7. Overall RPL Variable (RPL_THEMES): Rank SPL_THEMES. This is the overall summary ranking variable. 

## How to run the code ----
# 1) Install required packages:
#    install.packages(c("tidyverse", "tidycensus", "purrr"))
# 2) Obtain a Census API key:
#    https://api.census.gov/data/key_signup.html
# 3) Add your Census API key in the "User settings" section below.
#    (Optional: save it in your R environment instead of hard coding it.)
# 4) Choose other settings in the "User settings" section and run the script.

# Missing value convention ----
# The official SVI outputs use -999 to indicate a value is unavailable or not possible to compute.
# In this script, -999 values are treated as missing for ranking.

# Packages ----
suppressPackageStartupMessages({
  library(tidyverse)
  library(tidycensus)
  library(purrr)
})


# User settings ----
# Must be exact

# Census API key (required moving forward)
census_api_key <- "YOUR_CENSUS_API_KEY"

# If you have already saved in your R environment (~/.Renviron), use:
# census_api_key <- Sys.getenv("CENSUS_API_KEY")

geography  <- "county"           # "tract" or "county", this code does not yet support zcta
rank_scope <- "us"               # "us" or "state"
state      <- NULL               # If rank_scope == "state", set ONE state abbreviation (e.g., "IL")
# Refer to this list if needed: https://www.faa.gov/air_traffic/publications/atpubs/cnt_html/appendix_a.html
write_csv_path <- NULL           # Name and path of output file. Set to NULL to skip writing.

# Main function ----
svi_2022 <- function(
    geography  = c("tract", "county"),
    rank_scope = c("us", "state"),
    state      = NULL,
    write_csv_path = NULL
) {
  
  # Helper Functions ----
  round_half_up <- function(x, digits = 0) {
    m <- 10^digits
    sign_x <- sign(x)
    sign_x[sign_x == 0] <- 1
    floor(abs(x) * m + 0.5) / m * sign_x
  }
  
  # EP_* rounding: 1 decimal, half-up 
  ep_round <- function(x) round_half_up(round(x, 6), 1)
  
  # Rank-like rounding: 4 decimals, half-up
  rank_round <- function(x) round_half_up(x, 4)
  
  # Safe ratio: NA when denominator is missing or 0
  safe_ratio <- function(num, den) {
    if_else(is.na(den) | den == 0, NA_real_, num / den)
  }
  
  # Replace NA with -999 for official-style missing encoding
  na_to_neg999 <- function(x) if_else(is.na(x), -999.0, x)
  
  # Percentile rank: (min_rank(x)-1)/(n-1), excluding -999
  pct_rank <- function(x) {
    x2 <- if_else(x == -999, NA_real_, x)
    n  <- sum(!is.na(x2))
    if (n <= 1) return(rep(-999.0, length(x)))
    pr <- (dplyr::min_rank(x2) - 1) / (n - 1)
    pr <- rank_round(pr)
    if_else(is.na(x2), -999.0, pr)
  }
  
  # ACS variable list ----
  variables <- c(
    # Totals / denominators
    "S0601_C01_001",   # Total population (E_TOTPOP)
    "DP04_0001",       # Total housing units (E_HU)
    "DP04_0002",       # Occupied housing units (used in crowding notes)
    "DP02_0001",       # Total households (E_HH)
    
    # Theme 1
    "S1701_C01_001",   # Poverty universe
    "S1701_C01_040",   # Persons below 150% poverty (count)
    "DP03_0009P",      # Unemployment rate (percent)
    "S2503_C01_001",   # Total occupied housing units
    "S0601_C01_033",   # No HS diploma (percent)
    "S2701_C05_001",   # Uninsured (percent)
    
    # Housing burden (various income limits)
    "S2503_C01_028",
    "S2503_C01_032",
    "S2503_C01_036",
    "S2503_C01_040",
    
    # Theme 2
    "S0101_C02_030",   # Age 65+ (percent)
    "DP05_0019P",      # Age 17 and younger (percent)
    "DP02_0072P",      # Disability (percent)
    "DP02_0007P",      # Single-parent male households (percent)
    "DP02_0011P",      # Single-parent female households (percent)
    
    # Limited English (counts)
    "B16005_001",
    "B16005_007", "B16005_008",
    "B16005_012", "B16005_013",
    "B16005_017", "B16005_018",
    "B16005_022", "B16005_023",
    "B16005_029", "B16005_030",
    "B16005_034", "B16005_035",
    "B16005_039", "B16005_040",
    "B16005_044", "B16005_045",
    
    # Theme 3
    "DP05_0079P",      # % White, non-Hispanic
    
    # Theme 4
    "DP04_0012P", "DP04_0013P",  # % 10–19 + % 20+ units
    "DP04_0014P",                # % mobile homes
    "DP04_0078P", "DP04_0079P",  # % crowding 1.01–1.50 + % 1.51+
    "DP04_0058P",                # % no vehicle
    "B26001_001"                 # Group quarters population (count)
  )
  
  # Pull ACS data (long -> wide) ----
  pull_acs_data <- function() {
    
    # States + DC list from tidycensus fips_codes
    all_state_abbr_us <- fips_codes %>%
      distinct(state, state_code) %>%
      mutate(state_code = as.integer(state_code)) %>%
      filter(!is.na(state_code)) %>%
      filter(state_code %in% c(1:56, 11)) %>%
      arrange(state_code) %>%
      pull(state) %>%
      unique()
    
    # Explicit ranking scope behavior:
    # - US ranking: pull all states + DC
    # - State ranking: pull only the specified state
    requested_states <- if (rank_scope == "state") state else all_state_abbr_us
    
    get_acs_state <- function(st) {
      suppressMessages(
        tidycensus::get_acs(
          geography = geography,
          survey    = "acs5",
          year      = 2022,
          state     = st,
          variables = variables,
          geometry  = FALSE
        )
      )
    }
    
    map_dfr(requested_states, get_acs_state) %>%
      select(GEOID, NAME, variable, estimate) %>%
      pivot_wider(names_from = variable, values_from = estimate) %>%
      rename(LOCATION = NAME)
  }
  
  # Build E_* and EP_* ----
  build_ep <- function(df) {
    
    df_num <- df %>%
      mutate(across(-c(GEOID, LOCATION), as.numeric))
    
    df_num <- df_num %>%
      mutate(
        # Totals / denominators
        E_TOTPOP = S0601_C01_001,
        E_HU     = DP04_0001,
        E_HH     = DP02_0001,
        
        # Theme 1 counts
        E_POV150 = S1701_C01_040,
        E_HBURD = S2503_C01_028 + S2503_C01_032 + S2503_C01_036 + S2503_C01_040,
        
        # Limited English count
        E_LIMENG = rowSums(across(c(
          B16005_007, B16005_008,
          B16005_012, B16005_013,
          B16005_017, B16005_018,
          B16005_022, B16005_023,
          B16005_029, B16005_030,
          B16005_034, B16005_035,
          B16005_039, B16005_040,
          B16005_044, B16005_045
        )), na.rm = TRUE),
        
        # Group quarters count
        E_GROUPQ = B26001_001
      ) %>%
      mutate(
        # Theme 1 EP_*
        EP_POV150  = if_else(is.na(S1701_C01_001) | S1701_C01_001 == 0, -999.0,
                             ep_round(100 * safe_ratio(E_POV150, S1701_C01_001))),
        EP_UNEMP   = na_to_neg999(ep_round(DP03_0009P)),
        EP_HBURD   = if_else(is.na(S2503_C01_001) | S2503_C01_001 == 0, -999.0,
                             ep_round(100 * safe_ratio(E_HBURD, S2503_C01_001))),
        EP_NOHSDP  = na_to_neg999(ep_round(S0601_C01_033)),
        EP_UNINSUR = na_to_neg999(ep_round(S2701_C05_001)),
        
        # Theme 2 EP_*
        EP_AGE65   = na_to_neg999(ep_round(S0101_C02_030)),
        EP_AGE17   = na_to_neg999(ep_round(DP05_0019P)),
        EP_DISABL  = na_to_neg999(ep_round(DP02_0072P)),
        EP_SNGPNT  = na_to_neg999(ep_round(DP02_0007P + DP02_0011P)),
        EP_LIMENG  = if_else(is.na(B16005_001) | B16005_001 == 0, -999.0,
                             ep_round(100 * safe_ratio(E_LIMENG, B16005_001))),
        
        # Theme 3 EP_*
        EP_MINRTY  = na_to_neg999(ep_round(100.0 - DP05_0079P)),
        
        # Theme 4 EP_*
        EP_MUNIT   = na_to_neg999(ep_round(DP04_0012P + DP04_0013P)),
        EP_MOBILE  = na_to_neg999(ep_round(DP04_0014P)),
        EP_CROWD   = na_to_neg999(ep_round(DP04_0078P + DP04_0079P)),
        EP_NOVEH   = na_to_neg999(ep_round(DP04_0058P)),
        EP_GROUPQ  = if_else(is.na(E_TOTPOP) | E_TOTPOP == 0, -999.0,
                             ep_round(100 * safe_ratio(E_GROUPQ, E_TOTPOP)))
      )
    
    rank_df     <- df_num %>% filter(!is.na(E_TOTPOP) & E_TOTPOP > 0)
    zero_pop_df <- df_num %>% filter(is.na(E_TOTPOP) | E_TOTPOP == 0)
    
    list(rank_df = rank_df, zero_pop_df = zero_pop_df)
  }
  
  # Ranking ----
  rank_svi <- function(rank_df) {
    
    rank_df <- rank_df %>%
      mutate(
        # Compute percentile ranks for each EP_* into EPL_*
        across(
          .cols = c(
            EP_POV150, 
            EP_UNEMP, 
            EP_HBURD, 
            EP_NOHSDP, 
            EP_UNINSUR,
            EP_AGE65, 
            EP_AGE17, 
            EP_DISABL, 
            EP_SNGPNT, 
            EP_LIMENG,
            EP_MINRTY,
            EP_MUNIT, 
            EP_MOBILE, 
            EP_CROWD, 
            EP_NOVEH, 
            EP_GROUPQ
          ),
          .fns   = ~ pct_rank(as.numeric(.x)),
          .names = "EPL_{sub('^EP_', '', .col)}"
        )
      ) %>%
      mutate(
        # Theme sums (SPL_*)
        SPL_THEME1 = if_else(if_any(c(EPL_POV150, EPL_UNEMP, EPL_HBURD, EPL_NOHSDP, EPL_UNINSUR), ~ .x == -999),
                             -999.0,
                             rank_round(EPL_POV150 + EPL_UNEMP + EPL_HBURD + EPL_NOHSDP + EPL_UNINSUR)),
        SPL_THEME2 = if_else(if_any(c(EPL_AGE65, EPL_AGE17, EPL_DISABL, EPL_SNGPNT, EPL_LIMENG), ~ .x == -999),
                             -999.0,
                             rank_round(EPL_AGE65 + EPL_AGE17 + EPL_DISABL + EPL_SNGPNT + EPL_LIMENG)),
        SPL_THEME3 = if_else(EPL_MINRTY == -999, -999.0, rank_round(EPL_MINRTY)),
        SPL_THEME4 = if_else(if_any(c(EPL_MUNIT, EPL_MOBILE, EPL_CROWD, EPL_NOVEH, EPL_GROUPQ), ~ .x == -999),
                             -999.0,
                             rank_round(EPL_MUNIT + EPL_MOBILE + EPL_CROWD + EPL_NOVEH + EPL_GROUPQ)),
        SPL_THEMES = if_else(if_any(c(SPL_THEME1, SPL_THEME2, SPL_THEME3, SPL_THEME4), ~ .x == -999),
                             -999.0,
                             rank_round(SPL_THEME1 + SPL_THEME2 + SPL_THEME3 + SPL_THEME4))
      ) %>%
      mutate(
        # Theme ranks (RPL_*) and overall rank
        RPL_THEME1 = pct_rank(as.numeric(SPL_THEME1)),
        RPL_THEME2 = pct_rank(as.numeric(SPL_THEME2)),
        RPL_THEME3 = pct_rank(as.numeric(SPL_THEME3)),
        RPL_THEME4 = pct_rank(as.numeric(SPL_THEME4)),
        RPL_THEMES = pct_rank(as.numeric(SPL_THEMES))
      ) %>%
      mutate(
        # Final rounding for ranks
        across(starts_with("EPL_"), ~ if_else(.x == -999, -999.0, rank_round(.x))),
        across(starts_with("SPL_"), ~ if_else(.x == -999, -999.0, rank_round(.x))),
        across(starts_with("RPL_"), ~ if_else(.x == -999, -999.0, rank_round(.x)))
      )
    
    rank_df
  }
  
  # Restore units with 0 population ----
  restore_zero_pop <- function(rank_df, zero_pop_df) {
    rank_cols <- names(rank_df)[grepl("^(EPL_|SPL_|RPL_)", names(rank_df))]
    for (c in rank_cols) {
      if (!c %in% names(zero_pop_df)) zero_pop_df[[c]] <- -999.0
    }
    bind_rows(rank_df, zero_pop_df) %>% arrange(GEOID)
  }
  
  # Run pipeline ----
  census_wide <- pull_acs_data()
  
  built <- build_ep(census_wide)
  
  ranked <- rank_svi(built$rank_df)
  
  svi_out <- restore_zero_pop(ranked, built$zero_pop_df)
  
  svi_out <- svi_out %>%
    select(
      GEOID, LOCATION,
      E_TOTPOP, E_HU, E_HH,
      starts_with("E_"),
      starts_with("EP_"),
      starts_with("EPL_"),
      starts_with("SPL_"),
      starts_with("RPL_")
    )
  
  if (!is.null(write_csv_path) && nzchar(write_csv_path)) {
    write.csv(svi_out, write_csv_path, row.names = FALSE)
  }
  
  svi_out
}

# Run ----
svi_out <- svi_2022(
  geography  = geography,
  rank_scope = rank_scope,
  state      = state,
  write_csv_path = write_csv_path
)
