import UIKit

extension UILabel {
    func setupCustomLabel(text: String) {
        self.text = text
        self.textAlignment = .center
        self.font = UIFont(name: "Manrope-Medium", size: 18)
    }
}
