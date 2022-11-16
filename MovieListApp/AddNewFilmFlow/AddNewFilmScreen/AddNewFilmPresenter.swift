protocol AddNewFilmPresenterProtocol {
    
}

final class AddNewFilmPresenter: AddNewFilmPresenterProtocol {
    
    unowned let view: AddNewFilmView
    private let router: AddNewFilmRouter
    
    init(view: AddNewFilmView, router: AddNewFilmRouter) {
        self.view = view
        self.router = router
    }
    
}
