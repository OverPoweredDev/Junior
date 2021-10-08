![banner](https://github.com/OverPoweredDev/Junior/blob/master/misc/banner.png)

![Dart](https://img.shields.io/badge/Dart-blue?style=for-the-badge&logo=dart&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-lightblue?style=for-the-badge&logo=flutter&logoColor=darkblue)
![Android](https://img.shields.io/badge/Android-lightgreen?style=for-the-badge&logo=android&logoColor=darkgreen)
![PR](https://img.shields.io/badge/PRs-welcome-red?style=for-the-badge)
![License](https://img.shields.io/badge/License-GPL3-purple?style=for-the-badge)
![OpenSource](https://img.shields.io/badge/Open%20Source-greun?style=for-the-badge)

<br>

<img align="right" width="250" src="https://github.com/OverPoweredDev/Junior/blob/master/misc/Junior_demo.gif" alt="Junior demo">

Junior dares! to make a novel bookmarking app specialised for online webnovels. Initially inspired
by [this thread](https://www.reddit.com/r/noveltranslations/comments/p8hx5a/i_want_to_know_if_anyone_does_this_too_and_if_not/h9qt309) on r/noveltranslations, I
wanted to create a novel managing app that can handle more data than any notes taker, while also looking way better and still being as easy to use.

Junior is an open-source Android app that helps you catalogue the novel you're reading and your progress on it. Apart from these details, you can also log your
personal rating and any chapter notes for the current novel. There's a demonstration of the working to the right ⟶


<br>

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Development](#development)
    - [Navigation](#navigation)
    - [Getting Started](#getting-started)
    - [Contributing](#contributing)
- [Other Stuff](#other-stuff)

<br>

## Installation

To install Junior you can find the [current release on the Play Store](https://play.google.com/store/apps/details?id=com.overpowereddev.junior.src). If you want
to make it harder for yourself, you can also download the apk
from [this drive folder](https://drive.google.com/drive/folders/1rwawC45TR2Fu8pQFKax5P_FVzVsjeiHa?usp=sharing) and install it on your phone.

The app as it is right now is only available on Android and in dark mode. To request additional features or report a bug in the app,
just [create an issue on the repository](https://github.com/OverPoweredDev/Junior/issues/new/choose).

<br>

## Usage

As it is right now the app lets you View your reading list in a far better way than any notepad would. The initial homescreen shows your novel list and sort
order (Alphabetical, Most Recent or Rating). You can also search for a particular entry with the search bar.

The Details you can log for any novel are:

- Title
- Current and Total Chapters
- Personal Rating
- Link to the Current Chapter
- Chapter Notes or Novel Review

<br>

## Development

I intend to make this a proper open-source project so the following sections are about developing and modifying the existing app. There's stuff from Navigation
to Contribution Guidelines so do check it out if you're helping out!

### Navigation

```shell
Junior/
├── assets/
│   └── banner.png
├── README.md
└── src/
    ├── android/..
    ├── build/..
    ├── assets/..
    ├── test/..
    ├── lib/
    │   ├── details_page/
    │   │   ├── body.dart
    │   │   └── components/..
    │   ├── homepage/
    │   │   ├── body.dart
    │   │   └── components/..
    │   ├── model
    │   │   └── novel.dart
    │   ├── main.dart
    │   └── theme.dart
    ├── pubspec.lock
    ├── pubspec.yaml
    └── src.iml
```

In case it's not obvious, `src/` contains all source files for the application, top level `assets/` contains assets for the repo and README, `assets/` in `src/`
contains application data like the icon and all.

I've divided the application into subdirectories the way it makes sense to me. `main.dart` runs the entire thing, `theme.dart` contains constants for commonly
used colors and more. The only model is `novel.dart`, which contains code for the Novel class, its attributes and all methods involving reading and writing to
memory.

<br>

```shell
flutter_screen
├── body.dart/
└── components/
    ├── button.dart
    ├── list_tile.dart
    ├── searchbar.dart
    └── title.dart
```

A page looks something like above, with a body and a subdirectory of widget components. `body.dart` contains only top level information on how to place the
widgets while the actual widgets will be in `components/`. Even if it's something as simple as a `Text()`, please make a separate class for it, it makes it
super easy to re-arrange stuff later on.

And that's about it for navigation! This is the layout that I feel is most intuitive and easy to work with tbh.

<br>

### Getting Started

1. Fork this repository to your account by clicking the “Fork” button on top-right of the repository page.
	![Fork Button](https://i.postimg.cc/3wn7mr1j/fork.png)

2. Now, you will see copy of this repository in your account.

	![Forked Repository](https://i.postimg.cc/k5XPJ3C2/repo.png)

3. Next, clone this repository to your machine with help of IDE or you can do it with command line as well. Use below command to clone it

	`git clone https://github.com/<your-user-name>/Junior`.
	
	For Android Studio, you can clone it using "Get from Version Control" in VCS.
	![Android Studio Clone](https://i.postimg.cc/Kj4YR3yg/clone.png)
	
4. Create new branch and edit all the changes into it.

5. After changes completed, commit the changes and push it to github.

6. Now go to github repository and you will see the option "Compare and Create Pull Request". Click on it, review changes and create new Pull Request.

    ![Pull Request](https://i.postimg.cc/JnpNqqMw/pull.png)

<br>

### Contributing

Any and all contributions are welcome! As Junior is a project in release, changes to the source code won't be immediately accepted (they will be marked complete
for HacktoberFest, don't worry). In case it's a new feature or something not mentioned below, just create an issue beforehand please. Also do add your name and
account to the Maintainer's Section of CONTRIBUTING.md with your Pull Request!

Contributions regarding the below are especially appreciated!

- Contributing to the README (The TODO parts, mainly 😅)
- Adding Pages to the Wiki
- Minor changes/refactors to the Flutter Code
- Adding features to the Application requested by users
- Adding tests for the app

One thing I ask of you guys is to follow the directory structure as shown in [this section](#navigation). Also run the following commands before any pull
request so that it doesn't cause issues with the linter. And fix any minor issues it brings up!

```shell
flutter format --set-exit-if-changed .
flutter analyze .
```

<br>

## Other Stuff

Stuff I need to add or attribute but didn't get a place in the section before

- [Icon Source](https://www.rawpixel.com/image/2869824/free-illustration-image-reading-book-books-images-earth-tone)
- [StarRating Widget Source](https://gist.github.com/sma/1f22ef926ef878f10915aa9e00bc9eaa)
- [About Me](https://github.com/OverPoweredDev)
