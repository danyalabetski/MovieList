import UIKit

protocol AddReleaseDateRouterOutput {
    func addReleaseDateScreen(date: Date)
}

final class AddReleaseDateRouter {
    
    private let navigationController: UINavigationController
    private let window: UIWindow
    
    let completion: ((Date) -> Void)
    
    init(navigationController: UINavigationController, window: UIWindow, completion: @escaping ((Date) -> Void)) {
        self.navigationController = navigationController
        self.window = window
        self.completion = completion
        
        let view = AddReleaseDateView()
        let presenter = AddReleaseDatePresenter(view: view, router: self)
        view.presenter = presenter
        navigationController.pushViewController(view, animated: true)
        
        presenter.completion = { [weak self] in
            self?.completion($0)
        }
    }
    
}

extension AddReleaseDateRouter: AddReleaseDateRouterOutput {
    func addReleaseDateScreen(date: Date) {
        navigationController.popViewController(animated: true)
    }
}
