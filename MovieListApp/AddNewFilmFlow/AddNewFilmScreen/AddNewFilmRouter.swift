import UIKit

protocol AddNewFilmRouterInput {
    
}

final class AddNewFilmRouter {
    
    private let navigationControoler: UINavigationController
    private let window: UIWindow
    
    init(navigationControoler: UINavigationController, window: UIWindow) {
        self.navigationControoler = navigationControoler
        self.window = window
        let view = AddNewFilmView()
        let presenter = AddNewFilmPresenter(view: view, router: self)
        view.presenter = presenter
        navigationControoler.pushViewController(view, animated: true)
    }
    
}

extension AddNewFilmRouter: AddNewFilmRouterInput {
    
}
