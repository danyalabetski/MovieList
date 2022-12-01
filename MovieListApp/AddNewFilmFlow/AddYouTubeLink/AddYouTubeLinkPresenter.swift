protocol AddYouTubeLinkPresenterProtocol {
    func saveYouTubeLink(text: String)
    var completion: ((String) -> Void)? { get }
}

final class AddYouTubeLinkPresenter: AddYouTubeLinkPresenterProtocol {

    var completion: ((String) -> Void)?

    unowned let view: AddYouTubeLinkViewProtocol
    private let router: AddYouTubeLinkRouterOutput

    init(view: AddYouTubeLinkViewProtocol, router: AddYouTubeLinkRouterOutput) {
        self.view = view
        self.router = router
    }

    func saveYouTubeLink(text: String) {
        if text != "" {
            completion?(text)
            router.addYouTubeLinkScreen(text: text)
        } else {
            view.alertError()
        }
    }
}
