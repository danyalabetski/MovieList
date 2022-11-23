protocol AddNewFilmPresenterProtocol {
    func changeNameAction()
    
}

final class AddNewFilmPresenter: AddNewFilmPresenterProtocol {

    unowned let view: AddNewFilmView
    private let router: AddNewFilmRouter

    init(view: AddNewFilmView, router: AddNewFilmRouter) {
        self.view = view
        self.router = router
    }

    func changeNameAction() {
        router.goToTheNextScreen { [weak self] text in
            self?.view.updateNameMovieLabel(text: text)
        }
    }
}
