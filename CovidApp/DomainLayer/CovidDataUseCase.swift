class CovidDataUseCase {
    private let covidRepository: CovidRepositoryProtocol

    init(covidRepository: CovidRepositoryProtocol) {
        self.covidRepository = covidRepository
    }
    
    func fetchCovidData(completion: @escaping (WorldData)-> Void) {
        covidRepository.fetchCovidData()  { data in
            completion(data)
       }
    }
}
