import SnapKit
import UIKit

protocol DetailViewProtocol: AnyObject {}

final class DetailView: UIViewController {

    // MARK: - Properties

    var presenter: DetailPresenterProtocol?
    

    // MARK: Public
    // MARK: Private

    var movieImageView = UIImageView()

    private let detailView = UIView()
    private let nameFilmTitleLabel = UILabel()
    private let starImage = UIImageView()
    private let ratingFilmLabel = UILabel()
    private let releaseFilmLabel = UILabel()
    private let descriptionFilmLabel = UILabel()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configurationSetupBehavior()
        configurationSetupAppearance()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        configurationSetupConstraints()
    }

    // MARK: - Setups

    private func configurationSetupBehavior() {
        view.addSubviews(view: movieImageView, detailView, nameFilmTitleLabel, starImage, ratingFilmLabel, releaseFilmLabel, descriptionFilmLabel)
        
        nameFilmTitleLabel.font = UIFont(name: "Manrope-Bold", size: 24)
    }

    private func configurationSetupAppearance() {
        view.backgroundColor = .white

        detailView.backgroundColor = .brown

        detailView.layer.cornerRadius = 16
    }

    private func configurationSetupConstraints() {

        movieImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(526)
        }

        detailView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(286)
            make.bottom.left.right.equalToSuperview()
        }

        nameFilmTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(detailView.snp.top).inset(29)
            make.left.equalTo(detailView.snp.left).inset(19)
            make.right.equalTo(detailView.snp.right).inset(18)
        }
    }

    // MARK: - Helpers
}

extension DetailView: DetailViewProtocol {}
