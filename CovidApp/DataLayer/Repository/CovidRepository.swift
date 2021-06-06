class CovidRepository : CovidRepositoryProtocol {
    private let networkDataSource: CovidNetworkServiceProtocol
    private let coreDataSource: CovidCoreDataProtocol

    init(networkDataSource: CovidNetworkServiceProtocol, coreDataSource: CovidCoreDataProtocol) {
        self.networkDataSource = networkDataSource
        self.coreDataSource = coreDataSource
    }
    
    func fetchCovidData(completion: @escaping (WorldData)-> Void) {
        networkDataSource.fetchWorldData()  { data in
            completion(data)
       }
    }
}
