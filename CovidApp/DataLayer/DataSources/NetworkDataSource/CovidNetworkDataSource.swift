import UIKit

class CovidNetworkDataSource : CovidNetworkServiceProtocol {
    func executeUrlRequest<T: Decodable>(_ request: URLRequest, completionHandler: @escaping (Result<T, RequestError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, err in
            guard err == nil else {
                completionHandler(.failure(.clientError))
                return
            }
        
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completionHandler(.failure(.serverError))
                return
            }
        
            guard let data = data else
            {
                completionHandler(.failure(.noDataError))
                return
            }
            
            guard let value = try? JSONDecoder().decode(T.self, from: data) else
            {
                completionHandler(.failure(.dataDecodingError))
                return
            }
            completionHandler(.success(value))
        }
        dataTask.resume()
    }
    
    
    func fetchWorldData(completion: @escaping (WorldData)-> Void) {
        let headers = [
            "x-rapidapi-key": "245b751144msh3ee40c8cb20cd60p1c8d76jsn5b7ac566c8a0",
            "x-rapidapi-host": "vaccovid-coronavirus-vaccine-and-treatment-tracker.p.rapidapi.com"
        ]
        guard let url = URL(string: "https://vaccovid-coronavirus-vaccine-and-treatment-tracker.p.rapidapi.com/api/npm-covid-data/world") else { return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        executeUrlRequest(request) { (result: Result<[WorldData], RequestError>) in
                    switch result {
                                case .failure(let error):
                                    print(error)
                                case .success(let value):
                                    print("success")
                                    completion(value[0])
                    }
        }
    }
}
