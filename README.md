# Toasty 
[![Build Status](https://travis-ci.org/sereytraing/toasty.svg?branch=master)](https://travis-ci.org/sereytraing/toasty)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/Toasty_MVS.svg)](http://cocoadocs.org/)

iOS Framework Project

Screenshots
--------------
![Toasty Screenshots](https://image.noelshack.com/fichiers/2018/05/7/1517762931-screen.png)

Installation
--------------
```
pod 'Toasty_MVS'
```

Example
--------------
```swift
//show a message
ToastyView.showToast(viewController: self, withSimpleMessage: "Hello world !")

//show a message and an image
ToastyView.showToast(viewController: self, withMessage: "Hola", andImage: UIImage(named: "image"))

//show an image
ToastyView.showToast(viewController: self, withSimpleImage: UIImage(named: "image"))

```
