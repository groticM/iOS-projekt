import Foundation
import UIKit

class AppCoordinator : AppCoordinatorProtocol {
    private let navigationController = UINavigationController()
    private var window: UIWindow!

    init(window: UIWindow) {
        self.window = window
        setRootViewController()
    }
    
    private func setRootViewController() {
        let covidDataController = createCovidDataViewController()
        navigationController.viewControllers = [covidDataController]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    private func createCovidDataViewController() -> CovidDataViewController {
        //let coreDataContext = CoreDataStack(modelName: "CovidApp").managedContext
        let covidDataRepository = CovidRepository(
            networkDataSource: CovidNetworkDataSource(),
            coreDataSource: CovidCoreDataSource()
        )
        let covidUseCase = CovidDataUseCase(covidRepository: covidDataRepository)
        let presenter = CovidDataPresenter(covidUseCase: covidUseCase, coordinator: self)
        return CovidDataViewController(presenter: presenter)
    }
    
    
}
