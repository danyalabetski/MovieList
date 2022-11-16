protocol MainListPresenterProtocol {
    func actionNextScreen()
}

final class MainListPresenter: MainListPresenterProtocol {
    
    unowned let view: MainListView
    private let router: MainListRouter
    
    init(view: MainListView, router: MainListRouter) {
        self.view = view
        self.router = router
    }
    
    func actionNextScreen() {
        router.goToTheNextScreen()
    }
    
}
