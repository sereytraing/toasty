<p><img width=60% src="https://image.noelshack.com/fichiers/2018/05/7/1517784879-toasty-logo.png"></p>



[![Build Status](https://travis-ci.org/sereytraing/toasty.svg?branch=master)](https://travis-ci.org/sereytraing/toasty)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/Toasty_MVS.svg)](http://cocoadocs.org/)

A Swift framework project to get a quick message like a toast in Android.

## Getting Started

These instructions will get you a copy of the project up and running on your project.
### Prerequisites

You will need CocoaPods if it's not already done.
Here is how to install it :
```
sudo gem install cocoapods
```
Then enter this command in Terminal to complete the setup:
```
pod setup --verbose
```

### Installation

Go to your project directory and enter the following in a terminal tab :
```
pod init
```
This will creates a Podfile for your Project.
The default file will looks like this : 
```
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ProjectName' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ProjectName

end
```
Open it and delete the # and space before platform and add the following to your Podfile to look like this :

```
# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'ProjectName' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ProjectName
  pod 'Toasty_MVS'

end
```
**Don't use TextEdit for editing, it replaces standard quotes with more graphically appealing typeset quotes. This can cause CocoaPods to become confused and throw errors**

Then run the following in Terminal
```
pod install
```
You can now use this Framework in your project by opening the .xcworkspace file created by CocoaPods instead of .xcodeproj

### Examples

![Toasty Screenshots](https://image.noelshack.com/fichiers/2018/05/7/1517762931-screen.png)

```swift
//show a message
ToastyView.showToast(viewController: self, withSimpleMessage: "Hello world !")

//show a message and an image
ToastyView.showToast(viewController: self, withMessage: "Hola", andImage: UIImage(named: "image"))

//show an image
ToastyView.showToast(viewController: self, withSimpleImage: UIImage(named: "image"))

```
### Tools

We use [Travis](https://travis-ci.org/sereytraing/toasty/) for Continuous integration and [fastlane](https://fastlane.tools/) for Automation and release.
