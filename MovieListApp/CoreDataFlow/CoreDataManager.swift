import CoreData
import UIKit

final class CoreDataManager {
    static let shared = CoreDataManager()

    func saveFilm(_ film: Film) {
        guard let appDelegete = UIApplication.shared.delegate as? AppDelegate else { return }

        let managerContext = appDelegete.persistentContainer.viewContext

        if let entity = NSEntityDescription.entity(forEntityName: "FilmEntity", in: managerContext) {

            let movie = NSManagedObject(entity: entity, insertInto: managerContext)

            movie.setValue(film.name, forKey: "name")
            movie.setValue(film.rating, forKey: "rating")
            movie.setValue(film.imageFilm, forKey: "imageFilm")
            movie.setValue(film.releaseDateMovie, forKey: "releaseDateMovie")
            movie.setValue(film.youTubeLink, forKey: "youTubeLink")
            movie.setValue(film.descriptin, forKey: "descriptin")

            do {
                try managerContext.save()
                print("Save request send.")
            } catch let error as NSError {
                print(error)
            }

        } else {
            print("❌ ERROR")
        }
    }

    func getMovie() -> [Film] {

        guard let appDelegete = UIApplication.shared.delegate as? AppDelegate else { return [] }

        let managerContext = appDelegete.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FilmEntity")

        do {
            let objects = try managerContext.fetch(fetchRequest)

            var films = [Film]()

            for object in objects {
                let name = object.value(forKey: "name") as? String ?? ""
                let rating = object.value(forKey: "rating") as? String ?? ""
                let imageFilm = object.value(forKey: "imageFilm") as? Data ?? Data()
                let releaseDateMovie = object.value(forKey: "releaseDateMovie") as? String ?? ""
                let youTubeLink = object.value(forKey: "youTubeLink") as? URL ?? URL(fileURLWithPath: "https://www.youtube.com")
                let descriptin = object.value(forKey: "descriptin") as? String ?? ""

                let film = Film(name: name,
                                rating: rating,
                                imageFilm: imageFilm,
                                releaseDateMovie: releaseDateMovie,
                                youTubeLink: youTubeLink,
                                descriptin: descriptin)

                films.append(film)
            }

            return films

        } catch let error as NSError {
            print(error)
        }

        return []
    }

    private init() {}
}
