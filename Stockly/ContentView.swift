import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @StateObject var viewModel: StocksViewModel
    var body: some View {
        NavigationSplitView {
            List {
                Section {
                    ForEach(viewModel.series, id: \.id) { ser in
                        VStack {
                            HStack {
                                Text("Date")
                                Text(ser.key)
                            }
                            HStack {
                                HStack {
                                    Text("Open")
                                    Text(ser.open)
                                }
                                Spacer()
                                HStack {
                                    Text("Close")
                                    Text(ser.close)
                                }
                            }
                            HStack {
                                HStack {
                                    Text("High")
                                    Text(ser.high)
                                }
                                Spacer()
                                HStack {
                                    Text("Low")
                                    Text(ser.low)
                                }
                            }
                            HStack {
                                Text("Volume")
                                Text(ser.volume)
                            }
                        }
                    }
                } header: {
                    Text(viewModel.model?.metadata.symbol ?? "")
                        .font(.title)
                }
            }
            .listStyle(.insetGrouped)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
        .task { @MainActor in
            await viewModel.loadData()
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}



//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
