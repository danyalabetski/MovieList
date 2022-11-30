import SnapKit
import UIKit

protocol AddYouTubeLinkViewProtocol: AnyObject {}

final class AddYouTubeLinkView: UIViewController {

    // MARK: - Properties

    var presenter: AddYouTubeLinkPresenterProtocol?

    // MARK: Public
    // MARK: Private

    private let filmYouTubeLinkLabel = UILabel()
    private let filmYouTubeLinkTextField = UITextField()
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

        filmYouTubeLinkLabel.font = UIFont(name: "Manrope-Medium", size: 24)
        filmYouTubeLinkLabel.text = "YouTube Link"
        filmYouTubeLinkLabel.textAlignment = .center

        filmYouTubeLinkTextField.placeholder = "Name"

        borderView.layer.borderWidth = 0.5
        borderView.layer.borderColor = UIColor(red: 0.776, green: 0.776, blue: 0.784, alpha: 1).cgColor

        saveButton.setupCustomButton(name: "Save")
    }

    private func configurationSetupBehavior() {
        view.addSubviews(view: filmYouTubeLinkLabel, filmYouTubeLinkTextField, borderView, saveButton)

        saveButton.addTarget(self, action: #selector(saveNameDidTapped), for: .touchUpInside)
    }

    private func configurationSetupContraints() {
        filmYouTubeLinkLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(26)
            make.top.equalToSuperview().inset(124)
            make.left.equalToSuperview().inset(88)
        }

        filmYouTubeLinkTextField.snp.makeConstraints { make in
            make.width.equalTo(326)
            make.height.equalTo(44)
            make.top.equalTo(filmYouTubeLinkLabel.snp.bottom).inset(-42)
            make.left.equalToSuperview().inset(25)
        }

        borderView.snp.makeConstraints { make in
            make.width.equalTo(326)
            make.height.equalTo(1)
            make.top.equalTo(filmYouTubeLinkLabel.snp.bottom).inset(-86)
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
        presenter?.saveYouTubeLink(text: filmYouTubeLinkTextField.text ?? "")
    }
}

extension AddYouTubeLinkView: AddYouTubeLinkViewProtocol {}
