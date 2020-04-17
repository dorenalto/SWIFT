[![Bitrise](https://app.bitrise.io/app/9cd8dc49f3ac6090/status.svg?token=Hg9VtpTZrfdYAEzPiQ_FQQ&branch=master)](https://app.bitrise.io/app/9cd8dc49f3ac6090#/builds)

# Marvel iOS demo app

## Description
A demo app to interface with Marvel's API at developer.marvel.com. This app
will pull a list of super heroes and display a list of the some detail of each 
super hero and its title. Clicking on a hero within the list will display to 
the user the details of that particular super hero.

## Requirements
* xCode 10
* Swift 5
* iOS 12 (iPhone & iPad)

## Setup
Run the following command in the root project path:
```
$ ./bin/setup.sh
```

## Additional Informations
- The project also using [Fastlane](https://fastlane.tools/) to run Build and Tests. To run it, just run the following command in the root project path:
```
$ bundle exec fastlane test
```

## Continuous integration
Project's using Bitrise integrated with Github to run all commit builds.

[Bitrise App](https://app.bitrise.io/app/9cd8dc49f3ac6090#).
# SWIFT
