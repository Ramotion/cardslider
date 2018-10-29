![header](./header.png)
<img src="https://github.com/Ramotion/cardslider/blob/master/iOS_Card_Slider.gif" width="600" height="450" />
<br><br/>

# Card Slider
[![Twitter](https://img.shields.io/badge/Twitter-@Ramotion-blue.svg?style=flat)](http://twitter.com/Ramotion)
[![Donate](https://img.shields.io/badge/Donate-PayPal-blue.svg)](https://paypal.me/Ramotion)

## About
This project is maintained by Ramotion, Inc.<br>
We specialize in the designing and coding of custom UI for Mobile Apps and Websites.<br>

Inspired by [Charles Patterson](https://dribbble.com/CharlesPatterson) [shot](https://dribbble.com/shots/3982621-InVision-Studio-Movies-app-concept)

**Looking for developers for your project?**<br>
This project is maintained by Ramotion, Inc. We specialize in the designing and coding of custom UI for Mobile Apps and Websites.

<a href="mailto:alex.a@ramotion.com?subject=Project%20inquiry%20from%20Github">
<img src="https://github.com/ramotion/gliding-collection/raw/master/contact_our_team@2x.png" width="187" height="34"></a> <br>

The [iPhone mockup](https://store.ramotion.com/product/iphone-x-clay-mockups?utm_source=gthb&utm_medium=special&utm_campaign=cardslider) available [here](https://store.ramotion.com?utm_source=gthb&utm_medium=special&utm_campaign=cardslider).

## Requirements

- iOS 11.0+
- Xcode 10.0+

## Installation

Use [CocoaPods](https://cocoapods.org) with Podfile:

```
pod 'CardSlider'
```
or [Carthage](https://github.com/Carthage/Carthage) users can simply add Mantle to their `Cartfile`:

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

## Licence

CardSlider is released under the MIT license.
See [LICENSE](./LICENSE) for details.


# Get the Showroom App for iOS to give it a try
Try more UI components like this in our iOS app. Contact us if interested.

<a href="https://itunes.apple.com/app/apple-store/id1182360240?mt=8" >
<img src="https://github.com/ramotion/gliding-collection/raw/master/app_store@2x.png" width="117" height="34"></a>

<a href="mailto:alex.a@ramotion.com?subject=Project%20inquiry%20from%20Github">
<img src="https://github.com/ramotion/gliding-collection/raw/master/contact_our_team@2x.png" width="187" height="34"></a>
<br>
<br>

Follow us for the latest updates<br>
<a href="https://goo.gl/rPFpid" >
<img src="https://i.imgur.com/ziSqeSo.png/" width="156" height="28"></a>

