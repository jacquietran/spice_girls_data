# Load libraries ---------------------------------------------------------------

library(spotifyr)
library(dplyr)
library(here)

# Retrieve data ----------------------------------------------------------------

# Set Spotify artist ID for Spice Girls
spice_girls_id <- "0uq5PttqEjj3IH1bzwcrXF"

related_artists <- get_related_artists(
  id = spice_girls_id,
  authorization = get_spotify_access_token())

spice_girls_artist_info <- get_artists(
  ids = spice_girls_id,
  authorization = get_spotify_access_token())

# Tidy data --------------------------------------------------------------------

related_artists %>%
  # Clean up variable names
  janitor::clean_names() %>%
  # Subset to selected variables
  select(genres, id, name, popularity, followers_total) %>%
  rename(
    artist_id = id,
    artist_name = name) -> related_artists_tidy

spice_girls_artist_info %>%
  # Clean up variable names
  janitor::clean_names() %>%
  # Subset to selected variables
  select(genres, id, name, popularity, followers_total) %>%
  rename(
    artist_id = id,
    artist_name = name) -> spice_girls_artist_info_tidy

bind_rows(
  spice_girls_artist_info_tidy,
  related_artists_tidy) %>%
  tidyr::unnest(genres) %>%
  select(
    artist_id, artist_name, genres, popularity, followers_total
    ) -> related_artists_merged
  
# Export to file ---------------------------------------------------------------

# .rds
saveRDS(
  related_artists_merged,
  here("data/related_artists.rds"))

# .csv
write.csv(
  related_artists_merged,
  here("data/related_artists.csv"),
  row.names = FALSE)