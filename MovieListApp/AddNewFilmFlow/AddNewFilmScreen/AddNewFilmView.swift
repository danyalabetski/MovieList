import SnapKit
import UIKit

protocol AddNewFilmViewProtocol: AnyObject {
    func updateNameMovieLabel(text: String)
    func updateRatingMovieLabel(text: String)
    func updateReleaseDateMovieLabel(date: Date)
    func updateYouTubeLinkMovieLabel(text: String)
}

final class AddNewFilmView: UIViewController {

    // MARK: - Properties

    var presenter: AddNewFilmPresenterProtocol?

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
    
    private let descriptionLabel = UILabel()
    private let descriptionTextView = UITextView()

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
        view.addSubviews(view: viewCircle, photoSelectionButton, nameMovieLabel, ratingLabel, yourNameMovieLabel, yourRatingMovieLabel, changeNameButton, changeRatingButton, releaseDateMovieLabel, youTubeLinkLabel, yourReleaseDateMovieLabel, yourYouTubeLinkMovieLabel, changeReleaseDateButton, changeYouTubeLinkButton, descriptionLabel, descriptionTextView)

        changeNameButton.addTarget(self, action: #selector(changeNameButtonDidTapped), for: .touchUpInside)
        changeRatingButton.addTarget(self, action: #selector(changeRatingButtonDidTapped), for: .touchUpInside)
        changeReleaseDateButton.addTarget(self, action: #selector(changeReleaseDateDidTapped), for: .touchUpInside)
        changeYouTubeLinkButton.addTarget(self, action: #selector(changeYouTubeLinkDidTapped), for: .touchUpInside)
        
        photoSelectionButton.addTarget(self, action: #selector(photoSelectionButtonDidTapped), for: .touchUpInside)
    }

    private func configurationSetupAppearance() {
        viewCircle.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        viewCircle.layer.cornerRadius = 75
        viewCircle.clipsToBounds = true
        viewCircle.contentMode = .scaleAspectFill

        photoSelectionButton.setImage(UIImage(named: "gallary"), for: .normal)

        nameMovieLabel.setupCustomLabel(text: "Name", size: 18)
        ratingLabel.setupCustomLabel(text: "Your Rating", size: 18)
        yourNameMovieLabel.setupCustomLabel(text: "-", size: 18)
        yourNameMovieLabel.textAlignment = .center
        yourRatingMovieLabel.setupCustomLabel(text: "-", size: 18)
        changeNameButton.setupCustomButton(name: "Change")
        changeRatingButton.setupCustomButton(name: "Change")

        releaseDateMovieLabel.setupCustomLabel(text: "Release Date", size: 18)
        youTubeLinkLabel.setupCustomLabel(text: "YouTube Link", size: 18)
        yourReleaseDateMovieLabel.setupCustomLabel(text: "-", size: 18)
        yourYouTubeLinkMovieLabel.setupCustomLabel(text: "-", size: 18)
        changeReleaseDateButton.setupCustomButton(name: "Change")
        changeYouTubeLinkButton.setupCustomButton(name: "Change")
        
        descriptionLabel.setupCustomLabel(text: "Description", size: 18)
        descriptionTextView.font = UIFont(name: "Manrope-Regular", size: 14)
        descriptionTextView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
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
            make.top.equalTo(changeNameButton.snp.bottom).inset(-32)
            make.left.equalToSuperview().inset(40)
        }
        
        youTubeLinkLabel.snp.makeConstraints { make in
            make.top.equalTo(changeRatingButton.snp.bottom).inset(-32)
            make.right.equalToSuperview().inset(40)
        }
        
        yourReleaseDateMovieLabel.snp.makeConstraints { make in
            make.top.equalTo(releaseDateMovieLabel.snp.bottom).inset(-6)
            make.left.equalTo(10)
            make.right.equalTo(viewCircle.snp.centerX)
        }

        yourYouTubeLinkMovieLabel.snp.makeConstraints { make in
            make.top.equalTo(youTubeLinkLabel.snp.bottom).inset(-6)
            make.right.equalTo(-10)
            make.left.equalTo(viewCircle.snp.centerX)
        }
        
        changeYouTubeLinkButton.snp.makeConstraints { make in
            make.width.equalTo(91.44)
            make.height.equalTo(27)
            make.top.equalTo(yourReleaseDateMovieLabel.snp.bottom).inset(-6)
            make.right.equalTo(-57.36)
        }
        
        changeReleaseDateButton.snp.makeConstraints { make in
            make.width.equalTo(91.44)
            make.height.equalTo(27)
            make.top.equalTo(yourYouTubeLinkMovieLabel.snp.bottom).inset(-6)
            make.left.equalTo(56.2)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(changeReleaseDateButton.snp.bottom).inset(-36)
            make.left.equalToSuperview().inset(32)
            make.right.equalToSuperview().inset(32)
        }
        
        descriptionTextView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).inset(-11)
            make.left.equalToSuperview().inset(32)
            make.right.equalToSuperview().inset(32)
            make.bottom.equalToSuperview().inset(47)
        }
    }
    
    private func placeholderTextView(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "With Spider-Man's identity now revealed, Peter asks Doctor Strange..."
            textView.textColor = .lightGray
        }
    }

    // MARK: - Helpers

    @objc private func saveButtonDidTapped() {
    
        guard let png = viewCircle.image?.pngData() else { return }
        
        let film = Film(name: yourNameMovieLabel.text ?? "",
                        rating: yourRatingMovieLabel.text ?? "",
                        imageFilm: png,
                        releaseDateMovie: yourReleaseDateMovieLabel.text ?? "",
                        youTubeLink: URL(fileURLWithPath: yourYouTubeLinkMovieLabel.text ?? ""),
                        descriptin: descriptionTextView.text ?? "")
        
        CoreDataManager.shared.saveFilm(film)
    }

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

    @objc private func changeRatingButtonDidTapped() {
        presenter?.changeRatingAction()
    }
    
    @objc private func changeReleaseDateDidTapped() {
        presenter?.changeReleaseDateAction()
    }
    
    @objc private func changeYouTubeLinkDidTapped() {
        presenter?.changeYouTubeLinkAction()
    }
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
    
    func updateRatingMovieLabel(text: String) {
        yourRatingMovieLabel.text = text
    }
    
    func updateReleaseDateMovieLabel(date: Date) {
        yourReleaseDateMovieLabel.text = date.description
    }
    
    func updateYouTubeLinkMovieLabel(text: String) {
        yourYouTubeLinkMovieLabel.text = text
    }
}
