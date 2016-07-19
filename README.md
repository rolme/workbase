# Workbase
Small business PSA for automating Inventory, Project Management, Resource Management, and Bidding.

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
Homebrew install postgres and follow directions to start application.
```
brew install postgresql
```

### Install ruby 2.3.0
You will need rbenv and ruby-build if you do not have 2.3.0 already installed.
```
brew install rbenv ruby-build
rbenv install 2.3.0
```

### Initialize Workbase
clone the project and cd into the directory.
```
gem install foreman
bundle
rake db:reset
```

## Starting the App
To start the app run the following.
```
# Make sure postgres is running
foreman start
```
Then visit [localhost:5000](http://localhost:5000)
