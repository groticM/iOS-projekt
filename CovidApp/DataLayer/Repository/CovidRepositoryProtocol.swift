protocol CovidRepositoryProtocol {
    func fetchCovidData(completion: @escaping (WorldData)-> Void)
}
