import UIKit

protocol AddNewFilmViewProtocol {
    
}

final class AddNewFilmView: UIViewController {
    
    // MARK: - Properties
    
    var presenter: AddNewFilmPresenter?
    
    // MARK: Public
    // MARK: Private
    
    private let viewCircle = UIView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurationSetupMainListView()
    }
    
    // MARK: - API
    // MARK: - Setups
    
    private func configurationSetupMainListView() {
        title = "Add new"
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                            target: self,
                                                            action: #selector(saveDidTappedButton))
    }
    
    private func configurationSetupContraints() {
        
    }
    
    // MARK: - Helpers
    
    @objc private func saveDidTappedButton() {
        
    }
    
}

extension AddNewFilmView: AddNewFilmViewProtocol {
    
}
