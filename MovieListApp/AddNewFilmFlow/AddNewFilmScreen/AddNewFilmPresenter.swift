import Foundation

protocol AddNewFilmPresenterProtocol {
    func changeNameAction()
    func changeRatingAction()
    func changeReleaseDateAction()
    func changeYouTubeLinkAction()
    func saveDataAndBackViewController()
    func saveData(name: String, rating: String, imageFilm: Data, releaseDateMovie: String, youTubeLink: String, descriptin: String)
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

    func changeReleaseDateAction() {
        router.goToTheAddReleaseDate { [weak self] date in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMMM yyyy"
            self?.view.updateReleaseDateMovieLabel(date: dateFormatter.string(from: date))
        }
    }

    func changeYouTubeLinkAction() {
        router.goToTheAddYouTubeLink { [weak self] text in
            self?.view.updateYouTubeLinkMovieLabel(text: text)
        }
    }

    func saveDataAndBackViewController() {
        router.backMainViewController()
    }

    func saveData(name: String, rating: String, imageFilm: Data, releaseDateMovie: String, youTubeLink: String, descriptin: String) {
        if name != "-", rating != "-", releaseDateMovie != "-" {
            let film = Film(name: name,
                            rating: rating,
                            imageFilm: imageFilm,
                            releaseDateMovie: releaseDateMovie,
                            youTubeLink: youTubeLink,
                            descriptin: descriptin)

            CoreDataManager.shared.saveFilm(film)
        } else {
            return
        }
    }
}
