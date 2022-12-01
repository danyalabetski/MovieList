protocol DetailPresenterProtocol {
    func getMovie() -> Film
}

final class DetailPresenter: DetailPresenterProtocol {

    private let view: DetailViewProtocol?
    private let router: DetailRouterProtocol?
    private let film: Film

    init(view: DetailViewProtocol, router: DetailRouterProtocol, film: Film) {
        self.view = view
        self.router = router
        self.film = film
        view.setMovie(movie: film)
    }
    
    func getMovie() -> Film {
        return film
    }
}
