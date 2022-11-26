import Foundation

protocol AddReleaseDatePresenterProtocol {
    func saveDate(date: Date)
    var completion: ((Date) -> Void)? { get }
}

final class AddReleaseDatePresenter: AddReleaseDatePresenterProtocol {
    
    var completion: ((Date) -> Void)?
    
    unowned let view: AddReleaseDateViewProtocol
    private let router: AddReleaseDateRouterOutput
    
    init(view: AddReleaseDateViewProtocol, router: AddReleaseDateRouterOutput) {
        self.view = view
        self.router = router
    }
    
    func saveDate(date: Date) {
        completion?(date)
        router.addReleaseDateScreen(date: date)
    }
}
