import SnapKit
import UIKit

protocol AddNewFilmViewProtocol: AnyObject {
    func updateNameMovieLabel(text: String)
}

final class AddNewFilmView: UIViewController {

    // MARK: - Properties

    var presenter: AddNewFilmPresenter?

    // MARK: Public
    // MARK: Private

    private let viewCircle = UIImageView()
    private let photoSelectionButton = UIButton()

    private let nameMovieLabel = UILabel()
    private let ratingLabel = UILabel()
    private let yourNameMovieLabel = UILabel()
    private let yourRatingMovieLabel = UILabel()
    private let changeNameButton = UIButton()
    private let changeRatingButton = UIButton()

    private let releaseDateMovieLabel = UILabel()
    private let youTubeLinkLabel = UILabel()
    private let yourReleaseDateMovieLabel = UILabel()
    private let yourYouTubeLinkMovieLabel = UILabel()
    private let changeReleaseDateButton = UIButton()
    private let changeYouTubeLinkButton = UIButton()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configurationSetupMainListView()
        configurationSetupBehavior()
        configurationSetupAppearance()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        configurationSetupContraints()
    }

    // MARK: - API

    // MARK: - Setups

    private func configurationSetupMainListView() {
        title = "Add new"
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                            target: self,
                                                            action: #selector(saveButtonDidTapped))
    }

    private func configurationSetupBehavior() {
        view.addSubviews(view: viewCircle, photoSelectionButton, nameMovieLabel, ratingLabel, yourNameMovieLabel, yourRatingMovieLabel, changeNameButton, changeRatingButton, releaseDateMovieLabel, youTubeLinkLabel, yourReleaseDateMovieLabel, yourYouTubeLinkMovieLabel, changeReleaseDateButton, changeYouTubeLinkButton)

        changeNameButton.addTarget(self, action: #selector(changeNameButtonDidTapped), for: .touchUpInside)
        changeRatingButton.addTarget(self, action: #selector(changeRatingButtonDidTapped), for: .touchUpInside)
        photoSelectionButton.addTarget(self, action: #selector(photoSelectionButtonDidTapped), for: .touchUpInside)
        
    }

    private func configurationSetupAppearance() {
        viewCircle.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        viewCircle.layer.cornerRadius = 75
        viewCircle.clipsToBounds = true
        viewCircle.contentMode = .scaleAspectFill

        photoSelectionButton.setImage(UIImage(named: "gallary"), for: .normal)

        nameMovieLabel.setupCustomLabel(text: "Name")
        ratingLabel.setupCustomLabel(text: "Your Rating")
        yourNameMovieLabel.setupCustomLabel(text: "-")
        yourNameMovieLabel.textAlignment = .center
        yourRatingMovieLabel.setupCustomLabel(text: "-")
        changeNameButton.setupCustomButton(name: "Change")
        changeRatingButton.setupCustomButton(name: "Change")

        releaseDateMovieLabel.setupCustomLabel(text: "Release Date")
        youTubeLinkLabel.setupCustomLabel(text: "YouTube Link")
        yourReleaseDateMovieLabel.setupCustomLabel(text: "-")
        yourYouTubeLinkMovieLabel.setupCustomLabel(text: "-")
        changeReleaseDateButton.setupCustomButton(name: "Change")
        changeYouTubeLinkButton.setupCustomButton(name: "Change")
    }

    private func configurationSetupContraints() {
        viewCircle.snp.makeConstraints { make in
            make.width.height.equalTo(150)
            make.top.equalToSuperview().inset(167)
            make.left.equalToSuperview().inset(113)
        }

        photoSelectionButton.snp.makeConstraints { make in
            make.width.height.equalTo(70)
            make.top.equalToSuperview().inset(207)
            make.left.equalToSuperview().inset(153)
        }

        nameMovieLabel.snp.makeConstraints { make in
            make.width.equalTo(125)
            make.height.equalTo(27)
            make.top.equalTo(viewCircle.snp.bottom).inset(-32)
            make.left.equalTo(40)
        }

        ratingLabel.snp.makeConstraints { make in
            make.width.equalTo(125)
            make.height.equalTo(27)
            make.top.equalTo(viewCircle.snp.bottom).inset(-32)
            make.right.equalTo(-40)
        }

        yourNameMovieLabel.snp.makeConstraints { make in
            make.top.equalTo(nameMovieLabel.snp.bottom).inset(-6)
            make.left.equalTo(10)
            make.right.equalTo(viewCircle.snp.centerX)
        }

        yourRatingMovieLabel.snp.makeConstraints { make in
            make.top.equalTo(ratingLabel.snp.bottom).inset(-6)
            make.right.equalTo(-10)
            make.left.equalTo(viewCircle.snp.centerX)
        }

        changeRatingButton.snp.makeConstraints { make in
            make.width.equalTo(91.44)
            make.height.equalTo(27)
            make.top.equalTo(yourNameMovieLabel.snp.bottom).inset(-6)
            make.right.equalTo(-57.36)
        }

        changeNameButton.snp.makeConstraints { make in
            make.width.equalTo(91.44)
            make.height.equalTo(27)
            make.top.equalTo(yourRatingMovieLabel.snp.bottom).inset(-6)
            make.left.equalTo(56.2)
        }
        
        releaseDateMovieLabel.snp.makeConstraints { make in
            make.width.equalTo(125)
            make.height.equalTo(26)
            make.top.equalTo(changeNameButton.snp.bottom).inset(-32)
            make.left.equalToSuperview().inset(40)
        }
    }

    // MARK: - Helpers

    @objc private func saveButtonDidTapped() {}

    @objc private func photoSelectionButtonDidTapped() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let actionAlertCamera = UIAlertAction(title: "Камера", style: .default) { _ in
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            self.present(picker, animated: true)
        }

        let actionAlertGallery = UIAlertAction(title: "Галерея", style: .default) { _ in
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            self.present(picker, animated: true)
        }

        let actionAlertCancel = UIAlertAction(title: "Отмена", style: .cancel)
        alertController.addAction(actionAlertCamera)
        alertController.addAction(actionAlertGallery)
        alertController.addAction(actionAlertCancel)
        present(alertController, animated: true)
    }

    @objc private func changeNameButtonDidTapped() {
        presenter?.changeNameAction()
    }

    @objc private func changeRatingButtonDidTapped() {}
}

extension AddNewFilmView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {

        picker.dismiss(animated: true)

        guard let image = info[.originalImage] as? UIImage else { return }

        viewCircle.image = image
        photoSelectionButton.setImage(nil, for: .normal)
    }
}

extension AddNewFilmView: AddNewFilmViewProtocol {
    func updateNameMovieLabel(text: String) {
        yourNameMovieLabel.text = text
    }
}
