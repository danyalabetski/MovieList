protocol AddNameScreenPresenterProtocol {
    func saveName(text: String)
    var completionUpdateName: ((String) -> Void)? { get }
}

final class AddNameScreenPresenter: AddNameScreenPresenterProtocol {
    
    var completionUpdateName: ((String) -> Void)?

    unowned let view: AddNameScreenView
    private let router: AddNameScreenRouter

    init(view: AddNameScreenView, router: AddNameScreenRouter) {
        self.view = view
        self.router = router
    }
    
    func saveName(text: String) {
        completionUpdateName?(text)
        router.addNameFilmScreen(text: text)
    }
}
