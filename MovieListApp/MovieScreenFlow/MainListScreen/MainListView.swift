import UIKit

protocol MainListViewProtocol: AnyObject {
    func updateTableView()
}

final class MainListView: UIViewController {
    
    var movies = [Film]() {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Properties
    var presenter: MainListPresenterProtocol!

    // MARK: Public
    // MARK: Private

    private let tableView = UITableView(frame: .zero, style: .insetGrouped)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configurationSetupBehavior()
        configurationSetupMainListView()
        configurationSetupAppearance()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        configurationSetupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        movies = CoreDataManager.shared.getMovie()
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

    private func configurationSetupBehavior() {
        view.addSubviews(view: tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        tableView.allowsSelection = false
    }

    private func configurationSetupAppearance() {}

    private func configurationSetupConstraints() {
        tableView.frame = view.bounds
    }

    // MARK: - Helpers

    @objc private func addNewFilmScreenDidTappedButton() {
        presenter.actionNextScreen()
    }
}

extension MainListView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let movie = movies[indexPath.row]
        cell.movieImageView.image = UIImage(data: movie.imageFilm)
        cell.movieNameLabel.text = movie.name
        cell.movieRatingLabel.text = "\(movie.rating)/10"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 212
    }
}

extension MainListView: MainListViewProtocol {
    func updateTableView() {
        tableView.reloadData()
    }
}
