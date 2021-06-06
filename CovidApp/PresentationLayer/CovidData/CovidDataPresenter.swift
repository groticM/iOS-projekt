class CovidDataPresenter {
    private var coordinator: AppCoordinatorProtocol!
    private var covidUseCase: CovidDataUseCase!
    private var dataList : [(String,Int)] = []

    init(covidUseCase: CovidDataUseCase, coordinator: AppCoordinatorProtocol) {
        self.coordinator = coordinator
        self.covidUseCase = covidUseCase
    }
    
    func fetchData(completion: @escaping (WorldDataViewModel)-> Void) {
        covidUseCase.fetchCovidData()  { data in
            let worldDataViewModel = WorldDataViewModel(data)
            self.dataList = worldDataViewModel.dataList
            completion(worldDataViewModel)
       }
    }
    
    func rowCount() -> Int {
        return dataList.count
    }
    
}
