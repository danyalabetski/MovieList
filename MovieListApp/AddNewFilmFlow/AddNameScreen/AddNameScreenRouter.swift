import UIKit

protocol AddNameScreenRouterOutput {
    func addNameFilmScreen(text: String)
}

final class AddNameScreenRouter {

    private let navigationController: UINavigationController
    private let window: UIWindow
    
    let completion: (String) -> Void

    init(navigationController: UINavigationController, window: UIWindow, completion: @escaping ((String) -> Void)) {
        self.navigationController = navigationController
        self.window = window
        self.completion = completion
        
        let view = AddNameScreenView()
        let presenter = AddNameScreenPresenter(view: view, router: self)
        view.presenter = presenter
        navigationController.pushViewController(view, animated: true)
        
        presenter.completionUpdateName = { [weak self] in
            self?.completion($0)
        }
    }
}

extension AddNameScreenRouter: AddNameScreenRouterOutput {
    func addNameFilmScreen(text: String) {
        navigationController.popViewController(animated: true)
    }
}
