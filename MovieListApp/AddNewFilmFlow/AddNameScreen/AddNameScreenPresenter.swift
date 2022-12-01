protocol AddNameScreenPresenterProtocol {
    func saveName(text: String)
    var completionUpdateName: ((String) -> Void)? { get }
}

final class AddNameScreenPresenter: AddNameScreenPresenterProtocol {
    
    var completionUpdateName: ((String) -> Void)?

    unowned let view: AddNameScreenViewProtocol
    private let router: AddNameScreenRouterOutput

    init(view: AddNameScreenViewProtocol, router: AddNameScreenRouterOutput) {
        self.view = view
        self.router = router
    }
    
    func saveName(text: String) {
        if text != "" {
            completionUpdateName?(text)
            router.addNameFilmScreen(text: text)
        } else {
            view.alertError()
        }
    }
}
