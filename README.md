# Workbase
Small business PSA for automating Inventory, Project Management, Resource Management, and Ticketing.

## Environment Setup
This assumes your development environment is OSX Yosemite. NOTE: make sure to follow all post installation instructions for each package below.

### Ensure you have the latest Xcode
```
xcode-select --install
```

### Install homebrew
Run the following commands on your terminal. After running ```brew doctor``` correct any issues.
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update && brew upgrade
```

### Install 3rd party applications
Homebrew install required applications
```
brew install postgresql node redis-server
```

### Install ruby 2.3.1
You will need rbenv and ruby-build if you do not have 2.3.1 already installed.
```
brew install rbenv ruby-build
rbenv install 2.3.1
```

### Initialize Workbase
clone the project and cd into the directory.
```
npm install
gem install foreman bundler
bundle
rake db:reset
```

## Starting the App
To start the app run the following.
```
# Make sure postgres and redis-server is running
foreman start
```
Then visit [localhost:5000](http://localhost:5000)

## Heroku Setup
If deploying to Heroku, you will need to need to add the following add-ons:
* postgres
* bucketeer
* SendGrid

You will also need to install the following buildpack: (order matters)
* https://github.com/akomic/heroku-buildpack-ffmpegthumbnailer.git
* heroku/nodejs
* heroky/ruby
