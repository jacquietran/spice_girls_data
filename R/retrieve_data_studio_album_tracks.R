# Load libraries ---------------------------------------------------------------

library(spotifyr)
library(dplyr)
library(here)

# Retrieve data ----------------------------------------------------------------

# Audio features of studio album tracks
studio_album_tracks <- get_artist_audio_features(
  artist = "Spice Girls", include_groups = "album",
  dedupe_albums = TRUE, authorization = get_spotify_access_token())

# Tidy data --------------------------------------------------------------------

studio_album_tracks %>%
  # Subset to selected variables
  select(
    artist_name, artist_id, album_id, album_release_date, album_release_year,
    danceability, energy, key, loudness, mode, speechiness, acousticness,
    instrumentalness, liveness, valence, tempo, track_id, time_signature,
    duration_ms, track_name, track_number, album_name, key_name, mode_name,
    key_mode) %>%
  # Exclude 2021 re-release of "Spice"
  filter(
    album_name %in% c("Spice", "Spiceworld", "Forever")
    ) -> studio_album_tracks_tidy
  
# Export to file ---------------------------------------------------------------

# .rds
saveRDS(
  studio_album_tracks_tidy,
  here("data/studio_album_tracks.rds"))

# .csv
write.csv(
  studio_album_tracks_tidy,
  here("data/studio_album_tracks.csv"),
  row.names = FALSE)