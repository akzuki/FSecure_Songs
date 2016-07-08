## iOS Music App - Get music of your mood

This is a iOS Music App written in Swift 2.0. It returns a list of songs depending on user's mood.
This app is built with MVVM architectural pattern.

## Screenshots

![alt tag](https://github.com/akzuki/FSecure_Songs/blob/master/Screenshots/screenshot.gif)

## Descriptions

- Every row shows a background image, a song name and artist name
- Clicking on a song will show that song's detail including song image, song name, artist name and song lyrics
- Supports both portrait and landscape mode

## How to build

1) Clone the repository

```bash
$ git clone https://github.com/akzuki/FSecure_Songs.git
```

2) Open the workspace in Xcode

```bash
$ open "FSecure_Songs.xcworkspace"
```
3) Compile and run the app in your devices

## Code style

This project is following the [GitHub Swift Styleguide](https://github.com/github/swift-style-guide)

## Project Structure
```
FSecure_Songs
├──Core
├──Protocols
├──Network
├──Screens
│   ├──Intro
│   │   ├──Helper
│   │   ├──ViewModel
│   │   ├──ViewController
│   ├──Main
│   │   ├──View
│   │   ├──Model
│   │   ├──ViewModel
│   │   ├──ViewController
│   ├──Detail
│   │   ├──ViewModel
│   │   ├──ViewController
├──Storyboard
│   ├──Main.storyboard

```
## Libraries used

- [TTGEmojiRate](https://github.com/zekunyan/TTGEmojiRate)
- [AlamofireObjectMapper](https://github.com/tristanhimmelman/AlamofireObjectMapper)
- [SDWebImage](https://github.com/rs/SDWebImage)
- [EZLoadingActivity](https://github.com/goktugyil/EZLoadingActivity)

## Backend

The backend is using NodeJS and PostgresqlDB. 
