
import UIKit

struct CardTitle: Equatable {
	let title: String?
	let subtitle: String?
}

class CardTitleView: UIView {
	@IBOutlet private var titleLabel: UILabel!
	@IBOutlet private var subtitleLabel: UILabel!
	private var firstTitle: CardTitle?
	private var secondTitle: CardTitle?
	private weak var firstSnapshot: UIView?
	private weak var secondSnapshot: UIView?
	private var animator: UIViewPropertyAnimator?
	
	private func reset() {
		self.firstSnapshot?.removeFromSuperview()
		self.secondSnapshot?.removeFromSuperview()
		firstTitle = nil
		secondTitle = nil
		titleLabel.alpha = 1
		subtitleLabel.alpha = 1
	}
	
	func set(title: CardTitle) {
		reset()
		titleLabel.text = title.title
		subtitleLabel.text = title.subtitle
	}
	
	func transition(between firstTitle: CardTitle, secondTitle: CardTitle, progress: CGFloat) {
		guard firstTitle != self.firstTitle, secondTitle != self.secondTitle else {
			animator?.fractionComplete = progress
			return
		}
		
		reset()
		
		self.firstTitle = firstTitle
		self.secondTitle = secondTitle
		
		titleLabel.text = firstTitle.title ?? " " // retaining vertical space when there's no text
		subtitleLabel.text = firstTitle.subtitle ?? " "
		layoutIfNeeded()
		let firstSnapshot = renderSnapshot()
		self.firstSnapshot = firstSnapshot
		
		titleLabel.text = secondTitle.title ?? " "
		subtitleLabel.text = secondTitle.subtitle ?? " "
		layoutIfNeeded()
		let secondSnapshot = renderSnapshot()
		self.secondSnapshot = secondSnapshot
		
		addSubview(firstSnapshot)
		addSubview(secondSnapshot)
		
		firstSnapshot.center = CGPoint(x: bounds.midX, y: bounds.midY)
		secondSnapshot.center = CGPoint(x: bounds.midX, y: bounds.maxY)
		secondSnapshot.alpha = 0
		titleLabel.alpha = 0
		subtitleLabel.alpha = 0
		
		animator?.stopAnimation(true)
		animator = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: { [bounds] in
			firstSnapshot.center = CGPoint(x: bounds.midX, y: bounds.minY)
			firstSnapshot.alpha = 0
			secondSnapshot.center = CGPoint(x: bounds.midX, y: bounds.midY)
			secondSnapshot.alpha = 1
		})
		animator?.fractionComplete = progress
	}
}
