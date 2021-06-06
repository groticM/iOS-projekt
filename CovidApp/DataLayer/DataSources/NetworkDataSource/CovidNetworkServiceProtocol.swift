protocol CovidNetworkServiceProtocol {
    func fetchWorldData(completion: @escaping (WorldData)-> Void)
}
