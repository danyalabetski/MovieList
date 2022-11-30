import Foundation

protocol MainListPresenterProtocol {
    func actionNextScreen()
    func selectMovie(movie: Film)
    func loadMovies()
    var movies: [Film] { get }
}

final class MainListPresenter: MainListPresenterProtocol {
    
    var movies = [Film]() {
        didSet {
            self.view.setFilms(movies)
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
    
    func selectMovie(movie: Film) {
        router.goToTheDetailScreen(movie: movie)
    }
    
    func loadMovies() {
        movies = CoreDataManager.shared.getMovie()
    }
}
