import Foundation

protocol MainListPresenterProtocol {
    func actionNextScreen()
    func moveDetailView()
//    var movies: [Film] { get }
}

final class MainListPresenter: MainListPresenterProtocol {

//    var movies = [Film]() {
//        didSet {
//            self.view.updateTableView()
//        }
//    }

    unowned let view: MainListViewProtocol
    private let router: MainListRouterInput

    init(view: MainListViewProtocol, router: MainListRouterInput) {
        self.view = view
        self.router = router
    }

    func actionNextScreen() {
        router.goToTheNextScreen()
    }

    func moveDetailView() {
        router.goToTheDetailScreen()
    }
}
