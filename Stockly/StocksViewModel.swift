import Foundation

@MainActor
class StocksViewModel: ObservableObject {
    @Published var model: Stocks?
    let service: StocklyService
    @Published var series = [ModifiedStocks]()
    
    init(service: StocklyService) {
        self.service = service
    }
    
    func loadData() async {
        do {
            model = try await service.getStocks()
            createStocks()
        } catch(let e) {
            print(e.localizedDescription)
        }
    }
    
    func createStocks() {
        if let data = model?.timeSeries {
            data.forEach { key, timeseries in
                series.append(ModifiedStocks(key: key, open: timeseries.open, high: timeseries.high, low: timeseries.low, close: timeseries.close, volume: timeseries.volume))
            }
        }
    }
}
