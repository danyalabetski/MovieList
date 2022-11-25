protocol MainListPresenterProtocol {
    func actionNextScreen()
    var movies: [Film] { get set }
}

final class MainListPresenter: MainListPresenterProtocol {
    
    var movies = [Film]() {
        didSet {
            view.updateTableView()
        }
    }
    
    unowned let view: MainListViewProtocol
    private let router: MainListRouterInput
    
    init(view: MainListViewProtocol, router: MainListRouterInput) {
        self.view = view
        self.router = router
    }
    
    func actionNextScreen() {
        router.goToTheNextScreen()
    }
    
}
