import UIKit

struct WorldDataViewModel {

    var dataList : [(String,Int)]

    init(_ data: WorldData) {
        self.dataList = [(String,Int)]()
        self.dataList.append(("Total Cases:", data.TotalCases))
        self.dataList.append(("New Cases:", data.NewCases))
        self.dataList.append(("Total deaths:", data.TotalDeaths))
        self.dataList.append(("New deaths:", data.NewDeaths))
        self.dataList.append(("Total recovered:", Int(data.TotalRecovered)!))
        self.dataList.append(("New recovered:", data.NewRecovered))
        self.dataList.append(("Active cases:", data.ActiveCases))
    }
}
