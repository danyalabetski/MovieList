import SnapKit
import UIKit

final class CustomTableViewCell: UITableViewCell {

    static let identifier = "cell"

    var movieImageView = UIImageView()
    var movieNameLabel = UILabel()
    var movieRatingLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configurationSetupBehavior()
        configurationSetupAppearance()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        configurationSetupConstraints()
    }

    private func configurationSetupBehavior() {
        addSubviews(view: movieImageView, movieNameLabel, movieRatingLabel)

        selectionStyle = .none
    }

    private func configurationSetupAppearance() {
        movieImageView.contentMode = .scaleToFill
        movieImageView.layer.shadowRadius = 4
        movieImageView.layer.shadowOffset = CGSize(width: 20, height: 10)
        movieImageView.layer.masksToBounds = false

        movieNameLabel.font = UIFont(name: "Manrope-Medium", size: 18)
        movieNameLabel.textAlignment = .center

        movieRatingLabel.font = UIFont(name: "Manrope-Bold", size: 18)
        movieRatingLabel.textAlignment = .center
    }

    private func configurationSetupConstraints() {

        movieImageView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(197)
        }

        movieNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(34)
            make.right.equalToSuperview().inset(15)
            make.left.equalTo(movieImageView.snp.right).inset(-15)
        }

        movieRatingLabel.snp.makeConstraints { make in
            make.left.equalTo(movieImageView.snp.right).inset(-31)
            make.right.equalToSuperview().inset(28)
            make.bottom.equalToSuperview().inset(50)
        }
    }
}
