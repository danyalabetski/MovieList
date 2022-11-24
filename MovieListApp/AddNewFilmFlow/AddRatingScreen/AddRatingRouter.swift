import UIKit

protocol AddRatingRouterOutput {
    func addRatingFilmScreen(text: String)
}

final class AddRatingRouter {
    
    private let navigationController: UINavigationController
    private let window: UIWindow
    
    let completion: (String) -> Void
    
    init(navigationController: UINavigationController, window: UIWindow, completion: @escaping ((String) -> Void)) {
        self.navigationController = navigationController
        self.window = window
        self.completion = completion
        
        let view = AddRatingScreenView()
        let presenter = AddRatingPresenter(view: view, router: self)
        view.presenter = presenter
        navigationController.pushViewController(view, animated: true)
        
        presenter.completion = { [weak self] in
            self?.completion($0)
        }
    }
}

extension AddRatingRouter: AddRatingRouterOutput {
    func addRatingFilmScreen(text: String) {
        navigationController.popViewController(animated: true)
    }
}
