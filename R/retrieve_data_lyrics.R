# Load libraries ---------------------------------------------------------------

library(geniusr)
library(dplyr)
library(here)
library(rvest) # For workaround function
library(xml2) # For workaround function
library(rlang) # For workaround function

# Retrieve data ----------------------------------------------------------------

# Prepare data frame with all studio album tracks
all_tracks <- tibble(
  album_name = c(
    rep("Spice", times = 10),
    rep("Spiceworld", times = 10),
    rep("Forever", times = 11)),
  track_number = c(
    seq(1, 10, by = 1),
    seq(1, 10, by = 1),
    seq(1, 11, by = 1)),
  song_id = c(
    # Spice
    89740,   # Wannabe
    590894,  # Say You'll Be There
    313728,  # 2 Become 1
    1328789, # Love Thing
    1234194, # Last Time Lover
    709850,  # Mama
    709833,  # Who Do You Think You Are
    2102551, # Something Kinda Funny
    2102530, # Naked
    1396949, # If U Can't Dance
    # Spiceworld
    245798,  # Spice Up Your Life
    707397,  # Stop
    354288,  # Too Much
    709859,  # Saturday Night Divas
    708538,  # Never Give Up On The Good Times
    725349,  # Move Over
    824056,  # Do It
    1686410, # Denying
    354283,  # Viva Forever
    1372152, # The Lady Is A Vamp
    # Forever
    1315469, # Holler
    1489612, # Tell Me Why
    1453865, # Let Love Lead The Way
    1556253, # Right Back At Ya
    1545207, # Get Down With Me
    1436668, # Wasting My Time
    1413681, # Weekend Love
    1056183, # Time Goes By
    1354883, # If You Wanna Have Some Fun
    1495089, # Oxygen
    708784)  # Goodbye
  )

song_id_vec <- all_tracks$song_id

# Note: See workaround function for getting lyrics,
# from here: https://github.com/ewenme/geniusr/issues/17

# Recursively obtain song lyrics for each track
purrr::map_df(song_id_vec, function(i) {
  
  # simple but effective progress indicator
  cat(".")
  
  # get song lyrics
  lyrics_raw <- get_lyrics_id(song_id = i)
  
  # Tidying
  lyrics_tidy <- lyrics_raw %>%
    # Add line number
    mutate(line_number = row_number()) %>%
    # Merge with all_tracks details
    left_join(., all_tracks, by = "song_id") %>%
    # Reorder columns
    select(
      artist_name, album_name, track_number, song_id, song_name, line_number,
      section_name, line, section_artist)
  
}) -> lyrics

# Export to file ---------------------------------------------------------------

# .rds
saveRDS(
  lyrics,
  here("data/lyrics.rds"))

# .csv
write.csv(
  lyrics,
  here("data/lyrics.csv"),
  row.names = FALSE)