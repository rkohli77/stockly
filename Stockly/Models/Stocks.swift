import Foundation

struct Stocks: Codable {
//    let id = UUID().uuidString
     let metadata: MetaData
     let timeSeries: [String: TimeSeriesDaily]

    enum CodingKeys: String, CodingKey {
        case metadata = "Meta Data"
        case timeSeries = "Time Series (Daily)"
    }
}

struct MetaData: Codable {
    let information: String
    let symbol: String
    let lastRefreshed: String
    let outputSize: String
    let timezone: String
    
    enum CodingKeys: String, CodingKey {
        case information = "1. Information"
        case symbol = "2. Symbol"
        case lastRefreshed = "3. Last Refreshed"
        case outputSize = "4. Output Size"
        case timezone = "5. Time Zone"
    }
}

struct TimeSeriesDaily: Codable, Identifiable {
    let id = UUID().uuidString
    let open: String
    let high: String
    let low: String
    let close: String
    let volume: String
    
    enum CodingKeys: String, CodingKey {
        case open = "1. open"
        case high = "2. high"
        case low = "3. low"
        case close = "4. close"
        case volume = "5. volume"
    }
}

struct ModifiedStocks: Identifiable {
    let id = UUID().uuidString
    let key: String
    let open: String
    let high: String
    let low: String
    let close: String
    let volume: String
}
