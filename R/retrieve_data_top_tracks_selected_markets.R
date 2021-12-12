# Load libraries ---------------------------------------------------------------

library(spotifyr)
library(dplyr)
library(here)

# Retrieve data ----------------------------------------------------------------

# In the markets with certified units listed on the Wikipedia page for each 
# studio album - retrieved on 2021-12-12
# Wikipedia URL for Spice: https://en.wikipedia.org/wiki/Spice_(album)
#   for Spiceworld: https://en.wikipedia.org/wiki/Spiceworld_(album)
#   for Forever: https://en.wikipedia.org/wiki/Forever_(Spice_Girls_album)

# Set Spotify artist ID for Spice Girls
spice_girls_id <- "0uq5PttqEjj3IH1bzwcrXF"

# Create vector with country codes of selected markets
# ISO 3166-1 alpha-2 country code [Country name]
selected_markets <- 
  c("AR", # Argentina
    "AT", # Austria
    "AU", # Australia
    "BE", # Belgium
    "BR", # Brazil
    "CA", # Canada
    "CH", # Switzerland
    "DE", # Germany
    "DK", # Denmark
    "ES", # Spain
    "FI", # Finland
    "FR", # France
    "GB", # United Kingdom
    "HK", # Hong Kong
    "IE", # Ireland
    "IT", # Italy
    "JP", # Japan
    "MX", # Mexico
    "NL", # The Netherlands
    "NO", # Norway
    "NZ", # New Zealand
    "PL", # Poland
    "SE", # Sweden
    "US") # United States

# Recursively retrieve data
purrr::map_df(selected_markets, function(i) {
  
  # simple but effective progress indicator
  cat(".")
  
  # Obtain top tracks
  top_tracks <- get_artist_top_tracks(
    id = spice_girls_id, market = i,
    authorization = get_spotify_access_token())
  
  # Add country code
  top_tracks_tidy <- top_tracks %>%
    mutate(
      country_code = i,
      country_name = case_when(
        country_code == "AR" ~ "Argentina",
        country_code == "AT" ~ "Austria",
        country_code == "AU" ~ "Australia",
        country_code == "BE" ~ "Belgium",
        country_code == "BR" ~ "Brazil",
        country_code == "CA" ~ "Canada",
        country_code == "CH" ~ "Switzerland",
        country_code == "DE" ~ "Germany",
        country_code == "DK" ~ "Denmark",
        country_code == "ES" ~ "Spain",
        country_code == "FI" ~ "Finland",
        country_code == "FR" ~ "France",
        country_code == "GB" ~ "United Kingdom",
        country_code == "HK" ~ "Hong Kong",
        country_code == "IE" ~ "Ireland",
        country_code == "IT" ~ "Italy",
        country_code == "JP" ~ "Japan",
        country_code == "MX" ~ "Mexico",
        country_code == "NL" ~ "The Netherlands",
        country_code == "NO" ~ "Norway",
        country_code == "NZ" ~ "New Zealand",
        country_code == "PL" ~ "Poland",
        country_code == "SE" ~ "Sweden",
        country_code == "US" ~ "United States"))
  
}) -> top_tracks_selected_markets

# Tidy data --------------------------------------------------------------------

top_tracks_selected_markets %>%
  # Clean up variable names
  janitor::clean_names() %>%
  # Subset to selected variables
  select(
    country_code, country_name, id, name, popularity, album_id, album_name) %>%
  rename(
    track_id = id,
    track_name = name) -> top_tracks_selected_markets_tidy

# Export to file ---------------------------------------------------------------

# .rds
saveRDS(
  top_tracks_selected_markets_tidy,
  here("data/top_tracks_selected_markets.rds"))

# .csv
write.csv(
  top_tracks_selected_markets_tidy,
  here("data/top_tracks_selected_markets.csv"),
  row.names = FALSE)