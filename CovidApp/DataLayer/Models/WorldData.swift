import Foundation

struct WorldData: Codable {

    let TotalCases: Int
    let NewCases: Int
    let TotalDeaths: Int
    let NewDeaths: Int
    let TotalRecovered: String
    let NewRecovered: Int
    let ActiveCases: Int
}
