
import UIKit

class RatingView: UIStackView {
	open var rating: Int? = 0 {
		didSet {
			previousRating = oldValue
			update()
		}
	}
	
	private var previousRating: Int?
	
	open var minScale: CGFloat = 0.7 {
		didSet { update() }
	}
	
	private func update() {
		guard let stars = arrangedSubviews.filter({ $0 is UIImageView }) as? [UIImageView] else { return }
		guard let rating = rating else {
			stars.forEach { star in
				UIView.animate(withDuration: 0.3, animations: {
					star.transform = CGAffineTransform(scaleX: self.minScale, y: self.minScale)
					star.alpha = 0
				})
			}
			return
		}
		
		let previousRating = self.previousRating ?? 0
		stars.enumerated().forEach { [previousRating, rating] index, star in
			let shouldShow = rating > index
			let delay = 0.1 * TimeInterval(shouldShow ? index - previousRating + 1 : previousRating - index - 1)
			if star.alpha == 0 {
				star.alpha = 0.4
			}
			UIView.animate(withDuration: 0.2, delay: delay, animations: {
				star.alpha = shouldShow ? 1 : 0.4
				star.transform = shouldShow ? .identity : CGAffineTransform(scaleX: self.minScale, y: self.minScale)
			})
		}
	}
}
