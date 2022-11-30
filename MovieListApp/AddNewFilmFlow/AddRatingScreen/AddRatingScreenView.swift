import SnapKit
import UIKit

protocol AddRatingScreenViewProtocol: AnyObject {}

final class AddRatingScreenView: UIViewController {

    // MARK: - Properties

    var presenter: AddRatingPresenterProtocol?

    // MARK: Public

    // MARK: Private

    private let ratingLabel = UILabel()
    private var pickerView = UIPickerView()
    private let saveRatingButton = UIButton()
    private var arrayPickerView: [Double] = []
    private var rating: String?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configurationSetupBehavior()
        configurationSetupAppearance()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        configurationSetupConstraints()
    }

    // MARK: - Setups

    private func configurationSetupBehavior() {
        view.addSubviews(view: ratingLabel, pickerView, saveRatingButton)

        pickerView.delegate = self
        pickerView.dataSource = self
        arrayPickerView = presenter?.fillArray() ?? []
        
        saveRatingButton.addTarget(self, action: #selector(saveRatingDidTappedButton), for: .touchUpInside)
    }

    private func configurationSetupAppearance() {
        view.backgroundColor = UIColor(named: "CustomColor")

        ratingLabel.setupCustomLabel(text: "Your Rating", size: 24)

        saveRatingButton.setupCustomButton(name: "Save")
    }

    private func configurationSetupConstraints() {
        view.noneIntoMask(view: ratingLabel, pickerView, saveRatingButton)

        ratingLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(26)
            make.top.equalToSuperview().inset(124)
            make.left.equalToSuperview().inset(88)
        }

        pickerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(182)
            make.left.equalToSuperview()
            make.trailing.equalToSuperview()
        }

        saveRatingButton.snp.makeConstraints { make in
            make.top.equalTo(pickerView.snp.bottom).inset(-32)
            make.left.equalToSuperview().inset(148)
            make.right.equalToSuperview().inset(148)
        }
    }

    // MARK: - Helpers
    
    @objc private func saveRatingDidTappedButton() {
        presenter?.saveRating(text: rating ?? "")
    }
}

extension AddRatingScreenView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        arrayPickerView.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        String(format: "%.1f", arrayPickerView[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rating = String(format: "%.1f", arrayPickerView[row])
    }
}

extension AddRatingScreenView: AddRatingScreenViewProtocol {}
