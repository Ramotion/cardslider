
import UIKit

extension UIView {
	func renderSnapshot() -> UIView {
		let shadowOpacity = layer.shadowOpacity
		layer.shadowOpacity = 0 // avoid capturing shadow bits in bounds
		
		let snapshot = UIImageView(image: UIGraphicsImageRenderer(bounds: bounds).image { context in
			layer.render(in: context.cgContext)
		})
		layer.shadowOpacity = shadowOpacity
		
		if let shadowPath = layer.shadowPath {
			snapshot.layer.shadowPath = shadowPath
			snapshot.layer.shadowColor = layer.shadowColor
			snapshot.layer.shadowOffset = layer.shadowOffset
			snapshot.layer.shadowRadius = layer.shadowRadius
			snapshot.layer.shadowOpacity = layer.shadowOpacity
		}
		return snapshot
	}
}
