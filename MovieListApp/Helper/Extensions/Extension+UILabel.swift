import UIKit

extension UILabel {
    func setupCustomLabel(text: String, size: CGFloat) {
        self.text = text
        self.textAlignment = .center
        self.font = UIFont(name: "Manrope-Medium", size: size)
    }
}
