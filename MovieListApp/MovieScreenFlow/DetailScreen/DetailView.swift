import UIKit
import SnapKit

protocol DetailViewProtocol: AnyObject {
    
}

final class DetailView: UIViewController {
    
    // MARK: - Properties
    
    var presenter: DetailPresenterProtocol?
    
    // MARK: Public
    // MARK: Private
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurationSetupBehavior()
        configurationSetupAppearance()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        configurationSetupConstraints()
    }
    
    // MARK: - Setups
    
    private func configurationSetupBehavior() {
    
    }
    
    private func configurationSetupAppearance() {
        
    }
    
    private func  configurationSetupConstraints() {
        
    }
    
    // MARK: - Helpers
    
}

extension DetailView: DetailViewProtocol {
    
}
