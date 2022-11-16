import UIKit

protocol MainListRouterInput {
    func goToTheNextScreen()
}

final class MainListRouter {
    
    private let navigationController: UINavigationController
    private let window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        let view = MainListView()
        let presenter = MainListPresenter(view: view, router: self)
        view.presenter = presenter
        navigationController.pushViewController(view, animated: true)
    }
    
}

extension MainListRouter: MainListRouterInput {
    func goToTheNextScreen() {
        let _ = AddNewFilmRouter(navigationControoler: navigationController, window: window)
    }
}
