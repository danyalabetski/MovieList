import SnapKit
import UIKit
import WebKit

protocol DetailViewProtocol: AnyObject {
    func setMovie(movie: Film)
}

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
    private let youTubeWebView = WKWebView()

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
        view.addSubviews(view: movieImageView, detailView, nameFilmTitleLabel, starImage, ratingFilmLabel, releaseFilmLabel, descriptionFilmLabel, youTubeWebView)

        movieImageView.contentMode = .scaleToFill

        nameFilmTitleLabel.font = UIFont(name: "Manrope-Bold", size: 24)
    }

    private func configurationSetupAppearance() {
        view.backgroundColor = .white

        detailView.backgroundColor = .white
        detailView.layer.cornerRadius = 16

        starImage.image = UIImage(systemName: "star.fill")
        starImage.tintColor = .systemYellow

        ratingFilmLabel.font = UIFont(name: "Manrope-Bold", size: 14)

        releaseFilmLabel.font = UIFont(name: "Manrope-Regular", size: 14)
        releaseFilmLabel.textColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)

        descriptionFilmLabel.font = UIFont(name: "Manrope-Regular", size: 14)
        descriptionFilmLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
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

        starImage.snp.makeConstraints { make in
            make.top.equalTo(nameFilmTitleLabel.snp.bottom).inset(-18)
            make.leading.equalTo(detailView.snp.leading).inset(19)
            make.width.equalTo(16)
            make.height.equalTo(16)
        }

        ratingFilmLabel.snp.makeConstraints { make in
            make.top.equalTo(nameFilmTitleLabel.snp.bottom).inset(-14)
            make.leading.equalTo(detailView.snp.leading).inset(46)
            make.height.equalTo(24)
        }

        releaseFilmLabel.snp.makeConstraints { make in
            make.top.equalTo(nameFilmTitleLabel.snp.bottom).inset(-20)
            make.leading.equalTo(detailView.snp.leading).inset(101)
            make.height.equalTo(12)
        }

        descriptionFilmLabel.snp.makeConstraints { make in
            make.top.equalTo(releaseFilmLabel.snp.bottom).inset(-19)
            make.leading.equalTo(detailView.snp.leading).inset(19)
            make.right.equalTo(detailView.snp.right).inset(19)
        }
        
        youTubeWebView.snp.makeConstraints { make in
            make.top.equalTo(descriptionFilmLabel.snp.bottom).inset(-24)
            make.leading.equalTo(detailView.snp.leading).inset(18)
            make.trailing.equalTo(detailView.snp.trailing).inset(19)
            make.bottom.equalTo(detailView.snp.bottom).inset(52)
        }
    }

    // MARK: - Helpers
}

extension DetailView: DetailViewProtocol {
    func setMovie(movie: Film) {
        movieImageView.image = UIImage(data: movie.imageFilm)
        nameFilmTitleLabel.text = movie.name
        ratingFilmLabel.text = "\(movie.rating)/10"
        releaseFilmLabel.text = movie.releaseDateMovie
        descriptionFilmLabel.text = movie.descriptin
        youTubeWebView.load(URLRequest(url: URL(string: movie.youTubeLink)!))
    }
}
