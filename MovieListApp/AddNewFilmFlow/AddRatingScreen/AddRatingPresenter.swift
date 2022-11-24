protocol AddRatingPresenterProtocol {
    func fillArray() -> [Double]
    func saveRating(text: String)
    var completion: ((String) -> Void)? { get }
}

final class AddRatingPresenter: AddRatingPresenterProtocol {
    
    var completion: ((String) -> Void)?
    
    unowned let view: AddRatingScreenViewProtocol
    private let router: AddRatingRouterOutput
    
    init(view: AddRatingScreenView, router: AddRatingRouterOutput) {
        self.view = view
        self.router = router
    }
    
    func fillArray() -> [Double] {
        return Array(stride(from: 0.0, to: 10.1, by: 0.1)).reversed()
    }
    
    func saveRating(text: String) {
        completion?(text)
        router.addRatingFilmScreen(text: text)
    }
    
}
