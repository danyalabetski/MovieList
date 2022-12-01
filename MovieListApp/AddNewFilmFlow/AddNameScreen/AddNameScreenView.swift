import SnapKit
import UIKit

protocol AddNameScreenViewProtocol: AnyObject {
    func alertError()
}

final class AddNameScreenView: UIViewController {

    // MARK: - Properties

    var presenter: AddNameScreenPresenterProtocol?

    // MARK: Public
    // MARK: Private

    private let filmNameLabel = UILabel()
    private let filmNameTextField = UITextField()
    private let saveButton = UIButton()
    private let borderView = UIView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configurationSetupAppearance()
        configurationSetupBehavior()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        configurationSetupContraints()
    }

    // MARK: - Setups

    private func configurationSetupAppearance() {
        view.backgroundColor = UIColor(named: "CustomColor")

        filmNameLabel.font = UIFont(name: "Manrope-Medium", size: 24)
        filmNameLabel.text = "Film Name"
        filmNameLabel.textAlignment = .center

        filmNameTextField.placeholder = "Name"

        borderView.layer.borderWidth = 0.5
        borderView.layer.borderColor = UIColor(red: 0.776, green: 0.776, blue: 0.784, alpha: 1).cgColor

        saveButton.setupCustomButton(name: "Save")
    }

    private func configurationSetupBehavior() {
        view.addSubviews(view: filmNameLabel, filmNameTextField, borderView, saveButton)

        saveButton.addTarget(self, action: #selector(saveNameDidTapped), for: .touchUpInside)
    }

    private func configurationSetupContraints() {
        filmNameLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(26)
            make.top.equalToSuperview().inset(124)
            make.left.equalToSuperview().inset(88)
        }

        filmNameTextField.snp.makeConstraints { make in
            make.width.equalTo(326)
            make.height.equalTo(44)
            make.top.equalTo(filmNameLabel.snp.bottom).inset(-42)
            make.left.equalToSuperview().inset(25)
        }

        borderView.snp.makeConstraints { make in
            make.width.equalTo(326)
            make.height.equalTo(1)
            make.top.equalTo(filmNameLabel.snp.bottom).inset(-86)
            make.left.equalToSuperview().inset(25)
            make.right.equalToSuperview().inset(24)
        }

        saveButton.snp.makeConstraints { make in
            make.width.equalTo(79)
            make.height.equalTo(27)
            make.top.equalTo(borderView.snp.bottom).inset(-42)
            make.left.equalToSuperview().inset(148)
        }
    }

    // MARK: - Helpers

    @objc private func saveNameDidTapped() {
        presenter?.saveName(text: filmNameTextField.text ?? "")
    }
}

extension AddNameScreenView: AddNameScreenViewProtocol {
    func alertError() {
        let alertController = UIAlertController(title: "Error", message: "Add text please", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}
