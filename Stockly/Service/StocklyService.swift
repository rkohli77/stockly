import Foundation

public class StocklyService {
    let apiKey = "KM2AH23VIVOKDBM6"
    let urlStr = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&outputsize=compact&symbol=IBM&apikey="
    var stocks: Stocks?
    
    func getStocks() async throws -> Stocks? {
        let urlString = urlStr + apiKey
        // "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=IBM&apikey=\(apiKey)"
        let url = URL(string: urlString)
        if let url = url {
            let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
            if let stocks = try? JSONDecoder().decode(Stocks.self, from: data) {
                let count: Int = stocks.timeSeries.count
                print(count)
                return stocks
            } else {
                print("invalid response")
            }
        }
        return nil
    }
}
