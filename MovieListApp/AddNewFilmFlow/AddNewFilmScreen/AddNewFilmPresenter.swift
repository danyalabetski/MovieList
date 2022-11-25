protocol AddNewFilmPresenterProtocol {
    func changeNameAction()
    func changeRatingAction()
}

final class AddNewFilmPresenter: AddNewFilmPresenterProtocol {

    unowned let view: AddNewFilmViewProtocol
    private let router: AddNewFilmRouterInput

    init(view: AddNewFilmViewProtocol, router: AddNewFilmRouterInput) {
        self.view = view
        self.router = router
    }

    func changeNameAction() {
        router.goToTheAddNameScreen { [weak self] text in
            self?.view.updateNameMovieLabel(text: text)
        }
    }
    
    func changeRatingAction() {
        router.goToTheAddRatingScreen { [weak self] text in
            self?.view.updateRatingMovieLabel(text: text)
        }
    }
}
