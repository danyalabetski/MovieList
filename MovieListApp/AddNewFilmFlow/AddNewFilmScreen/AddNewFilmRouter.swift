import UIKit

protocol AddNewFilmRouterInput {
    func goToTheAddNameScreen(completion: @escaping ((String) -> Void))
    func goToTheAddRatingScreen(completion: @escaping ((String) -> Void))
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
    func goToTheAddNameScreen(completion: @escaping ((String) -> Void)) {
        _ = AddNameScreenRouter(navigationController: navigationControoler, window: window, completion: completion)
    }

    func goToTheAddRatingScreen(completion: @escaping ((String) -> Void)) {
        _ = AddRatingRouter(navigationController: navigationControoler, window: window, completion: completion)
    }
}
