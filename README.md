
<!-- README.md is generated from README.Rmd. Edit this file then knit to .md -->

# Spice Up Your Life! <img src="https://raw.githubusercontent.com/jacquietran/spice_girls_data/main/mcdspwo_ec013-2000_cropped.jpg" align="right" height="200" />

The data this week comes from [Spotify](https://www.spotify.com) and
[Genius](https://www.genius.com). Thank you to the authors of the
`spotifyr` and `geniusr` packages for making it easy to access data from
these platforms!

There are 3 data sets about or related to the Spice Girls:

-   `studio_album_tracks`: Audio features of each song from the three
    studio albums by the Spice Girls. From Spotify.
-   `related artists`: Artists deemed to be similar to the Spice Girls,
    with info about each artist including their musical genres and
    follower numbers. Includes a row with details for the Spice Girls,
    for comparison purposes. From Spotify.
-   `lyrics`: Lyrics of each song from the three studio albums by the
    Spice Girls. From Genius.

Credit: [Jacquie Tran](https://www.twitter.com/jacquietran)

## Data dictionaries

A data dictionary for each data set is provided
[here](https://github.com/jacquietran/spice_girls_data/blob/main/data_dictionaries.md).

## Cleaning script example

``` r
# Load libraries
library(dplyr)

# Read data into R
studio_album_tracks <- readr::read_csv("https://github.com/jacquietran/spice_girls_data/raw/main/data/studio_album_tracks.csv")

# For each album, calculate mean values for danceability, energy, and valence
studio_album_tracks %>%
  group_by(album_name) %>%
  summarise(
    danceability_mean = mean(danceability),
    energy_mean = mean(energy),
    valence_mean = mean(valence)) %>%
  ungroup() %>%
  # Set factor levels of album_name
  mutate(
    album_name = factor(
      album_name, levels = c("Spice", "Spiceworld", "Forever"))) %>%
  arrange(album_name)
#> # A tibble: 3 x 4
#>   album_name danceability_mean energy_mean valence_mean
#>   <fct>                  <dbl>       <dbl>        <dbl>
#> 1 Spice                  0.694       0.731        0.756
#> 2 Spiceworld             0.570       0.776        0.642
#> 3 Forever                0.695       0.722        0.583
```

## Useful packages

-   `spotifyr`: <https://www.rcharlie.com/spotifyr/index.html>
-   `geniusr`: <https://ewenme.github.io/geniusr/>
