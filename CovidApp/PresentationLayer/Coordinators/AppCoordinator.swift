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
        covidDataController.tabBarItem = UITabBarItem(title: "World COVID Statistics", image:  UIImage(systemName: "waveform.path.ecg.rectangle"), selectedImage: UIImage(systemName:"waveform.path.ecg.rectangle.fill"))
        
        let vaccineDataViewController = VaccineDataViewController()
        vaccineDataViewController.tabBarItem = UITabBarItem(title: "Vaccine", image:  UIImage(systemName: "heart.text.square"), selectedImage: UIImage(systemName:"heart.text.square.fill"))
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [covidDataController, vaccineDataViewController]
        
        navigationController.viewControllers = [tabBarController]
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
