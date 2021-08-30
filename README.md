![banner](https://github.com/OverPoweredDev/Junior/blob/master/assets/banner.png)

# Junior

A novel bookmarking app specialised for online webnovels

## Table of Contents

- [Installation](#installation)
- [Development](#development)
    - [Navigation](#navigation)
    - [Getting Started](#getting-started)
    - [Contributing](#contributing)
- [Other Stuff](#other-stuff)

## Installation

## Development

I intend to make this a proper open-source project so the following sections are about developing and modifying the existing app. There's stuff from Navigation
to Contribution Guidelines so do check it out if you're helping out!

### Navigation

```
Junior
├── assets
│   └── banner.png
├── README.md
└── src
    ├── android/..
    ├── build/..
    ├── assets
    │   └── icon.jpg
    ├── test
    │   └── widget_test.dart
    ├── lib
    │   ├── details_page
    │   │   ├── body.dart
    │   │   └── components
    │   │       ├── buttons.dart
    │   │       ├── chapter_progress.dart
    │   │       ├── complete_checkbox.dart
    │   │       ├── novel_data.dart
    │   │       ├── novel_link.dart
    │   │       ├── novel_notes.dart
    │   │       ├── novel_title.dart
    │   │       └── star_rating.dart
    │   ├── homepage
    │   │   ├── body.dart
    │   │   └── components
    │   │       ├── add_novel_button.dart
    │   │       ├── novel_tile.dart
    │   │       ├── searchbar.dart
    │   │       └── title.dart
    │   ├── model
    │   │   └── novel.dart
    │   ├── main.dart
    │   └── theme.dart
    ├── pubspec.lock
    ├── pubspec.yaml
    └── src.iml
```

In case it's not obvious, `src/` contains all source files for the application, top level `assets/` contains assets for the repo and README, `assets/` in `src/`
contains application data like the icon and all.

I've divided the application into subdirectories the way it makes sense to me. `main.dart` runs the entire thing, `theme.dart` contains constants for commonly
used colors and more. The only model is `novel.dart`, which contains code for the Novel class, its attributes and all methods involving reading and writing to
memory.

```
flutter_screen
├── body.dart
└── components
    ├── button.dart
    ├── list_tile.dart
    ├── searchbar.dart
    └── title.dart
```

A page looks something like above, with a body and a subdirectory of widget components. `body.dart` contains only top level information on how to place the
widgets while the actual widgets will be in `components/`. Even if it's something as simple as a `Text()`, please make a separate class for it, it makes it
super easy to re-arrange stuff later on.

And that's about it for navigation! This is the layout that I feel is most intuitive and easy to work with tbh.

### Getting Started

### Contributing

## Other Stuff

Stuff I need to add or attribute but didn't get a place in the section before

- [Icon Source](https://www.rawpixel.com/image/2869824/free-illustration-image-reading-book-books-images-earth-tone)
- [StarRating Widget Source](https://gist.github.com/sma/1f22ef926ef878f10915aa9e00bc9eaa)
- [About Me](https://github.com/OverPoweredDev)
