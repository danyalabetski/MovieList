protocol DetailPresenterProtocol {
    
}

final class DetailPresenter: DetailPresenterProtocol {
    
    private let view: DetailViewProtocol?
    private let router: DetailRouterProtocol?
    
    init(view: DetailViewProtocol, router: DetailRouterProtocol) {
        self.view = view
        self.router = router
    }
}
