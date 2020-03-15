# DarkSky Mini Project

This is a weather forecast app that shows the user the current and future daily forecast (using API calls to the DarkSky API) of the user's current location (using CLLocation) or the location the user inputs into the searchbar (converting string to CLLocation object using Geodecoder)
This app also attempts to cache the daily forecast data into a realtime database using Firebase because DarkSky only allows 1000 API calls a day.

![Alt text](/rowGrid.jpg?raw=true "Switching between a row view and a grid view with the segmented control")
