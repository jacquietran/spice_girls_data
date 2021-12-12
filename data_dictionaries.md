
<!-- data_dictionaries.md is generated from data_dictionaries.Rmd. Edit this file then knit to .md -->

# Data dictionaries

## `studio_album_tracks`

| variable           | class     | description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
|--------------------|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| artist_name        | character | Artist name                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| artist_id          | character | Spotify artist ID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| album_id           | character | Spotify album ID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| album_release_date | character | Album release date                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| album_release_year | numeric   | Album release year                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| danceability       | numeric   | Per [Spotify for Developers](https://developer.spotify.com/documentation/web-api/reference/#/operations/get-several-audio-features): “Danceability describes how suitable a track is for dancing based on a combination of musical elements including tempo, rhythm stability, beat strength, and overall regularity. A value of 0.0 is least danceable and 1.0 is most danceable.”                                                                                                                                                                                                                                                                       |
| energy             | numeric   | Per [Spotify for Developers](https://developer.spotify.com/documentation/web-api/reference/#/operations/get-several-audio-features): “Energy is a measure from 0.0 to 1.0 and represents a perceptual measure of intensity and activity. Typically, energetic tracks feel fast, loud, and noisy. For example, death metal has high energy, while a Bach prelude scores low on the scale. Perceptual features contributing to this attribute include dynamic range, perceived loudness, timbre, onset rate, and general entropy.”                                                                                                                          |
| key                | integer   | Per [Spotify for Developers](https://developer.spotify.com/documentation/web-api/reference/#/operations/get-several-audio-features): “The key the track is in. Integers map to pitches using standard Pitch Class notation. E.g. 0 = C, 1 = C♯/D♭, 2 = D, and so on. If no key was detected, the value is -1.”                                                                                                                                                                                                                                                                                                                                            |
| loudness           | numeric   | Per [Spotify for Developers](https://developer.spotify.com/documentation/web-api/reference/#/operations/get-several-audio-features): “The overall loudness of a track in decibels (dB). Loudness values are averaged across the entire track and are useful for comparing relative loudness of tracks. Loudness is the quality of a sound that is the primary psychological correlate of physical strength (amplitude). Values typically range between -60 and 0 db.”                                                                                                                                                                                     |
| mode               | integer   | Per [Spotify for Developers](https://developer.spotify.com/documentation/web-api/reference/#/operations/get-several-audio-features): “Mode indicates the modality (major or minor) of a track, the type of scale from which its melodic content is derived. Major is represented by 1 and minor is 0.”                                                                                                                                                                                                                                                                                                                                                    |
| speechiness        | numeric   | Per [Spotify for Developers](https://developer.spotify.com/documentation/web-api/reference/#/operations/get-several-audio-features): “Speechiness detects the presence of spoken words in a track. The more exclusively speech-like the recording (e.g. talk show, audio book, poetry), the closer to 1.0 the attribute value. Values above 0.66 describe tracks that are probably made entirely of spoken words. Values between 0.33 and 0.66 describe tracks that may contain both music and speech, either in sections or layered, including such cases as rap music. Values below 0.33 most likely represent music and other non-speech-like tracks.” |
| acousticness       | numeric   | Per [Spotify for Developers](https://developer.spotify.com/documentation/web-api/reference/#/operations/get-several-audio-features): “A confidence measure from 0.0 to 1.0 of whether the track is acoustic. 1.0 represents high confidence the track is acoustic.”                                                                                                                                                                                                                                                                                                                                                                                       |
| instrumentalness   | numeric   | Per [Spotify for Developers](https://developer.spotify.com/documentation/web-api/reference/#/operations/get-several-audio-features): “Predicts whether a track contains no vocals.”Ooh” and “aah” sounds are treated as instrumental in this context. Rap or spoken word tracks are clearly “vocal”. The closer the instrumentalness value is to 1.0, the greater likelihood the track contains no vocal content. Values above 0.5 are intended to represent instrumental tracks, but confidence is higher as the value approaches 1.0.”                                                                                                                  |
| liveness           | numeric   | Per [Spotify for Developers](https://developer.spotify.com/documentation/web-api/reference/#/operations/get-several-audio-features): “Detects the presence of an audience in the recording. Higher liveness values represent an increased probability that the track was performed live. A value above 0.8 provides strong likelihood that the track is live.”                                                                                                                                                                                                                                                                                            |
| valence            | numeric   | Per [Spotify for Developers](https://developer.spotify.com/documentation/web-api/reference/#/operations/get-several-audio-features): “A measure from 0.0 to 1.0 describing the musical positiveness conveyed by a track. Tracks with high valence sound more positive (e.g. happy, cheerful, euphoric), while tracks with low valence sound more negative (e.g. sad, depressed, angry).”                                                                                                                                                                                                                                                                  |
| tempo              | numeric   | Per [Spotify for Developers](https://developer.spotify.com/documentation/web-api/reference/#/operations/get-several-audio-features): “The overall estimated tempo of a track in beats per minute (BPM). In musical terminology, tempo is the speed or pace of a given piece and derives directly from the average beat duration.”                                                                                                                                                                                                                                                                                                                         |
| track_id           | character | Spotify track ID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| time_signature     | integer   | Per [Spotify for Developers](https://developer.spotify.com/documentation/web-api/reference/#/operations/get-several-audio-features): “An estimated time signature. The time signature (meter) is a notational convention to specify how many beats are in each bar (or measure). The time signature ranges from 3 to 7 indicating time signatures of”3/4”, to “7/4”.”                                                                                                                                                                                                                                                                                     |
| duration_ms        | integer   | Track duration in milliseconds                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| track_name         | character | Track name                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| track_number       | integer   | Track number in album                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| album_name         | character | Album name                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| key_name           | character | The key the track is in, as a character string, e.g., “C”, “C#”, “D”.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| mode_name          | character | The modality of the track, as a character string: “major” or “minor”.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| key_mode           | character | The key and mode combined, as a character string, e.g., “C major”, “A minor”.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |

## `related_artists`

| variable        | class     | description                                                                                                                                                                                                                                                                                                                |
|-----------------|-----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| artist_id       | character | Spotify artist ID                                                                                                                                                                                                                                                                                                          |
| artist_name     | character | Artist name                                                                                                                                                                                                                                                                                                                |
| genres          | character | Musical genres associated with the artist                                                                                                                                                                                                                                                                                  |
| popularity      | integer   | Per [Spotify for Developers](https://developer.spotify.com/documentation/web-api/reference/#/operations/get-multiple-artists): “The popularity of the artist. The value will be between 0 and 100, with 100 being the most popular. The artist’s popularity is calculated from the popularity of all the artist’s tracks.” |
| followers_total | integer   | Total number of followers on Spotify, as on date of scraping (2021-12-12)                                                                                                                                                                                                                                                  |

## `lyrics`

| variable       | class     | description                                                                                                                              |
|----------------|-----------|------------------------------------------------------------------------------------------------------------------------------------------|
| artist_name    | character | Artist name                                                                                                                              |
| album_name     | character | Album name                                                                                                                               |
| track_number   | numeric   | Track number in album                                                                                                                    |
| song_id        | numeric   | Genius song ID                                                                                                                           |
| song_name      | character | Track name                                                                                                                               |
| line_number    | numeric   | Line number, labelling lyrics in their sequential order                                                                                  |
| section_name   | character | Part of a track (e.g., pre-chorus, chorus, bridge). See [Wikipedia page on Song structure](https://en.wikipedia.org/wiki/Song_structure) |
| line           | character | A line of lyrics                                                                                                                         |
| section_artist | character | The artists singing each line                                                                                                            |