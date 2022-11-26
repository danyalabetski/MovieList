import UIKit

protocol AddYouTubeLinkRouterOutput {
    func addYouTubeLinkScreen(text: String)
}

final class AddYouTubeLinkRouter {
    private let navigationController: UINavigationController
    private let window: UIWindow
    
    let completion: ((String) -> Void)
    
    init(navigationController: UINavigationController, window: UIWindow, completion: @escaping ((String) -> Void)) {
        self.navigationController = navigationController
        self.window = window
        self.completion = completion
        
        let view = AddYouTubeLinkView()
        let presenter = AddYouTubeLinkPresenter(view: view, router: self)
        view.presenter = presenter
        navigationController.pushViewController(view, animated: true)
        
        presenter.completion = { [weak self] in
            self?.completion($0)
        }
    }
}

extension AddYouTubeLinkRouter: AddYouTubeLinkRouterOutput {
    func addYouTubeLinkScreen(text: String) {
        navigationController.popViewController(animated: true)
    }
}
