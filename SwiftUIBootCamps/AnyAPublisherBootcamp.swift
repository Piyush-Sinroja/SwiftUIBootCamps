//
//  AnyAPublisherBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 13/02/24.
//

import SwiftUI
import Combine

class AsyncPublisherDataManager {

    @Published var myData: [String] = []

    func addData() async {
        myData.append("Apple")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append ("Banana" )
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append ("Orange")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append ("Watermelon" )
    }
}

class AsyncPublisherBootcampViewModel: ObservableObject {
    @Published var items: [String] = []
    let manager = AsyncPublisherDataManager()
    var cancellables: Set<AnyCancellable> = []

    init() {
        addSubscribers()
    }

    private func addSubscribers() {

        Task {
            for await value in manager.$myData.values {
                await MainActor.run {
                    self.items = value
                }
            }
        }

//        manager.$myData
//            .receive(on: DispatchQueue.main, options: nil)
//            .sink { [weak self] data in
//                self?.items = data
//            }
//            .store(in: &cancellables)
    }

    func start() async {
        await manager.addData()
    }
}

struct AsyncPublisherBootcamp: View {

    @StateObject private var viewModel = AsyncPublisherBootcampViewModel()

    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.items, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                }
            }
        }
        .task {
            await viewModel.start()
        }
    }
}

#Preview {
    AsyncPublisherBootcamp()
}
