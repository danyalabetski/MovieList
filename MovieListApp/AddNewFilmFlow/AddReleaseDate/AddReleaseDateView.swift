import SnapKit
import UIKit

protocol AddReleaseDateViewProtocol: AnyObject {}

final class AddReleaseDateView: UIViewController {

    // MARK: - Properties

    var presenter: AddReleaseDatePresenterProtocol?

    // MARK: Public
    // MARK: Private

    private let releaseDateLabel = UILabel()
    private let releaseDatePicker = UIDatePicker()
    private let saveButton = UIButton()

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
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)

        view.addSubviews(view: releaseDateLabel, releaseDatePicker, saveButton)

        let calendar = Calendar(identifier: .gregorian)

        let currentDate = Date()
        var components = DateComponents()

        components.calendar = calendar

        components.year = -10
        components.month = 12
        let maxDate = calendar.date(byAdding: components, to: currentDate)!

        components.year = -150
        let minDate = calendar.date(byAdding: components, to: currentDate)!

        releaseDatePicker.minimumDate = minDate
        releaseDatePicker.maximumDate = maxDate

        saveButton.addTarget(self, action: #selector(saveButtonDidTapped), for: .touchUpInside)
    }

    private func configurationSetupAppearance() {
        releaseDateLabel.setupCustomLabel(text: "Release Date", size: 24)

        releaseDatePicker.preferredDatePickerStyle = .wheels
        releaseDatePicker.datePickerMode = .date

        saveButton.setupCustomButton(name: "Save")
    }

    private func configurationSetupConstraints() {
        releaseDateLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(26)
            make.top.equalToSuperview().inset(124)
            make.left.equalToSuperview().inset(88)
        }

        releaseDatePicker.snp.makeConstraints { make in
            make.top.equalTo(releaseDateLabel.snp.bottom).inset(-32)
            make.left.right.equalToSuperview()
            make.height.equalTo(194)
        }

        saveButton.snp.makeConstraints { make in
            make.top.equalTo(releaseDatePicker.snp.bottom).inset(-32)
            make.left.equalToSuperview().inset(148)
            make.right.equalToSuperview().inset(148)
        }
    }

    // MARK: - Helpers

    @objc private func saveButtonDidTapped() {
        presenter?.saveDate(date: releaseDatePicker.date)
    }
}

extension AddReleaseDateView: AddReleaseDateViewProtocol {}
