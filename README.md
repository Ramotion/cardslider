<a href="https://www.ramotion.com/agency/app-development?utm_source=gthb&utm_medium=repo&utm_campaign=card-slider"><img src="https://github.com/Ramotion/folding-cell/blob/master/header.png"></a>

<a href="https://github.com/Ramotion/folding-cell">
<img align="left" src="https://github.com/Ramotion/cardslider/blob/master/iOS_Card_Slider.gif" width="480" height="360" /></a>

<p><h1 align="left">CARD SLIDER</h1></p>

<h4>UI controller that allows you to swipe through cards with pictures.</h4>


___



<p><h6>We specialize in the designing and coding of custom UI for Mobile Apps and Websites.</h6>
<a href="https://www.ramotion.com/agency/app-development?utm_source=gthb&utm_medium=repo&utm_campaign=card-slider">
<img src="https://github.com/ramotion/gliding-collection/raw/master/contact_our_team@2x.png" width="187" height="34"></a>
</p>
<p><h6>Stay tuned for the latest updates:</h6>
<a href="https://goo.gl/rPFpid" >
<img src="https://i.imgur.com/ziSqeSo.png/" width="156" height="28"></a></p>

</br>

#### Inspired by [Charles Patterson](https://dribbble.com/CharlesPatterson) [shot](https://dribbble.com/shots/3982621-InVision-Studio-Movies-app-concept)

[![Twitter](https://img.shields.io/badge/Twitter-@Ramotion-blue.svg?style=flat)](http://twitter.com/Ramotion)
[![Donate](https://img.shields.io/badge/Donate-PayPal-blue.svg)](https://paypal.me/Ramotion)

## Requirements

- iOS 11.0+
- Xcode 10.0+

## Installation

Use [CocoaPods](https://cocoapods.org) with Podfile:

```
pod 'CardSlider'
```
or [Carthage](https://github.com/Carthage/Carthage) users can simply add CardSlider to their `Cartfile`:

```
github "Ramotion/CardSlider"
```

Then import the module in your code:

``` swift 
import CardSlider
```

## Usage

1) Declare a card model, implementing `CardSliderItem` protocol:

``` swift
public protocol CardSliderItem {
	var image: UIImage { get }
	var rating: Int? { get }
	var title: String { get }
	var subtitle: String? { get }
	var description: String? { get }
}
```

2) Implement `CardSliderDataSource` methods in your class: 

``` swift
public protocol CardSliderDataSource: class {
	func item(for index: Int) -> CardSliderItem
	func numberOfItems() -> Int
}
```

3) Create an instance of `CardSliderViewController` with the data source:

``` swift
guard let dataSource = someObject as? CardSliderDataSource else { return }
let cardSlider = CardSliderViewController.with(dataSource: dataSource)
```

4) Set the title and present: 

``` swift
cardSlider.title = "Movies"
present(cardSlider, animated: true, completion: nil)
```

## 📄 License

Card Slider is released under the MIT license.
See [LICENSE](./LICENSE) for details.

This library is a part of a <a href="https://github.com/Ramotion/swift-ui-animation-components-and-libraries"><b>selection of our best UI open-source projects.</b></a>

If you use the open-source library in your project, please make sure to credit and backlink to www.ramotion.com

## 📱 Get the Showroom App for iOS to give it a try
Try this UI component and more like this in our iOS app. Contact us if interested.

<a href="https://itunes.apple.com/app/apple-store/id1182360240?pt=550053&ct=card-slider&mt=8" >
<img src="https://github.com/ramotion/gliding-collection/raw/master/app_store@2x.png" width="117" height="34"></a>

<a href="https://www.ramotion.com/agency/app-development?utm_source=gthb&utm_medium=repo&utm_campaign=card-slider">
<img src="https://github.com/ramotion/gliding-collection/raw/master/contact_our_team@2x.png" width="187" height="34"></a>
<br>
<br>

