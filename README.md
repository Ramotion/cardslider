
# CardSlider

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
