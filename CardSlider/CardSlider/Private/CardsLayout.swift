
import UIKit

protocol ParallaxCardCell {
	func setShadeOpacity(progress: CGFloat)
	func setZoom(progress: CGFloat)
}

@objc protocol CardsLayoutDelegate: class {
	func transition(between currentIndex: Int, and nextIndex: Int, progress: CGFloat)
}

class CardsLayout: UICollectionViewLayout {
	@IBOutlet private weak var delegate: CardsLayoutDelegate!
	
	public var itemSize: CGSize = .zero {
		didSet { invalidateLayout() }
	}
	
	///
	public var minScale: CGFloat = 0.8 {
		didSet { invalidateLayout() }
	}
	public var spacing: CGFloat = 35 {
		didSet { invalidateLayout() }
	}
	public var visibleItemsCount: Int = 3 {
		didSet { invalidateLayout() }
	}
	
	override open var collectionView: UICollectionView {
		return super.collectionView!
	}
	
	override open func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
		return true
	}
	
	var itemsCount: CGFloat {
		return CGFloat(collectionView.numberOfItems(inSection: 0))
	}
	
	var collectionBounds: CGRect {
		return collectionView.bounds
	}
	
	var contentOffset: CGPoint {
		return collectionView.contentOffset
	}
	
	var currentPage: Int {
		return max(Int(contentOffset.x) / Int(collectionBounds.width), 0)
	}
	
	override open var collectionViewContentSize: CGSize {
		return CGSize(width: collectionBounds.width * itemsCount, height: collectionBounds.height)
	}
	
	private var didInitialSetup = false
	
	open override func prepare() {
		guard !didInitialSetup else { return }
		didInitialSetup = true
		
		let width = collectionBounds.width * 0.7
		let height = width / 0.6
		itemSize = CGSize(width: width, height: height)
		
		collectionView.setContentOffset(CGPoint(x: collectionViewContentSize.width - collectionBounds.width, y: 0), animated: false)
	}
	
	override open func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
		let itemsCount = collectionView.numberOfItems(inSection: 0)
		guard itemsCount > 0 else { return nil }
		
		let minVisibleIndex = max(currentPage - visibleItemsCount + 1, 0)
		let offset = CGFloat(Int(contentOffset.x) % Int(collectionBounds.width))
		let offsetProgress = CGFloat(offset) / collectionBounds.width
		let maxVisibleIndex = max(min(itemsCount - 1, currentPage + 1), minVisibleIndex)
		
		let attributes: [UICollectionViewLayoutAttributes] = (minVisibleIndex...maxVisibleIndex).map {
			let indexPath = IndexPath(item: $0, section: 0)
			return layoutAttributes(for: indexPath, currentPage, offset, offsetProgress)
		}
		return attributes
	}
	
	private func layoutAttributes(for indexPath: IndexPath, _ pageIndex: Int, _ offset: CGFloat, _ offsetProgress: CGFloat) -> UICollectionViewLayoutAttributes {
		let attributes = UICollectionViewLayoutAttributes(forCellWith:indexPath)
		let visibleIndex = max(indexPath.item - pageIndex + visibleItemsCount, 0)
		
		if visibleIndex == visibleItemsCount + 1 {
			delegate?.transition(between: indexPath.item, and: max(indexPath.item - 1, 0), progress: 1 - offsetProgress)
		}
		
		attributes.size = itemSize
		let topCardMidX = contentOffset.x + collectionBounds.width - itemSize.width / 2 - spacing / 2
		attributes.center = CGPoint(x: topCardMidX - spacing * CGFloat(visibleItemsCount - visibleIndex), y: collectionBounds.midY)
		attributes.zIndex = visibleIndex
		let scale = parallaxProgress(for: visibleIndex, offsetProgress, minScale)
		attributes.transform = CGAffineTransform(scaleX: scale, y: scale)
		
		let cell = collectionView.cellForItem(at: indexPath) as? ParallaxCardCell
		cell?.setZoom(progress: scale)
		let progress = parallaxProgress(for: visibleIndex, offsetProgress)
		cell?.setShadeOpacity(progress: progress)
		
		switch visibleIndex {
		case visibleItemsCount + 1:
			attributes.center.x += collectionBounds.width - offset - spacing
			cell?.setShadeOpacity(progress: 1)
		default:
			attributes.center.x -= spacing * offsetProgress
		}
		
		return attributes
	}
	
	private func parallaxProgress(for visibleIndex: Int, _ offsetProgress: CGFloat, _ minimum: CGFloat = 0) -> CGFloat {
		let step = (1.0 - minimum) / CGFloat(visibleItemsCount)
		return 1.0 - CGFloat(visibleItemsCount - visibleIndex) * step - step * offsetProgress
	}
}
