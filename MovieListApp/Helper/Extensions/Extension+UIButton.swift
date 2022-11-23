import UIKit

extension UIButton {
    func setupCustomButton(name: String) {
        self.setTitle(name, for: .normal)
        self.setTitleColor(UIColor(red: 0.184, green: 0.502, blue: 0.929, alpha: 1), for: .normal)
        self.titleLabel?.font = UIFont(name: "Manrope-Medium", size: 18)
    }
}
