import UIKit

protocol MainListViewProtocol {}

final class MainListView: UIViewController {

    // MARK: - Properties
    var presenter: MainListPresenter!

    // MARK: Public
    // MARK: Private
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configurationSetupMainListView()
    }

    // MARK: - API
    // MARK: - Setups

    private func configurationSetupMainListView() {
        title = "My Movie List"
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addNewFilmScreenDidTappedButton))
    }

    // MARK: - Helpers

    @objc private func addNewFilmScreenDidTappedButton() {
        presenter.actionNextScreen()
    }
}

extension MainListView: MainListViewProtocol {}
