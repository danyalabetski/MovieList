import UIKit

extension UIView {
    func addSubviews(view: UIView...) {
        view.forEach { addSubview($0) }
    }
    
    func noneIntoMask(view: UIView...) {
        view.forEach({ $0.translatesAutoresizingMaskIntoConstraints = false })
    }
}

