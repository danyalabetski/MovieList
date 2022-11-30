import UIKit

protocol DetailRouterProtocol {}

final class DetailRouter {

    private let navigationController: UINavigationController
    private let window: UIWindow

    init(navigationController: UINavigationController, window: UIWindow, movie: Film) {
        self.navigationController = navigationController
        self.window = window

        let view = DetailView()
        let presenter = DetailPresenter(view: view, router: self, film: movie)
        view.presenter = presenter
        navigationController.pushViewController(view, animated: true)
    }
}

extension DetailRouter: DetailRouterProtocol {}