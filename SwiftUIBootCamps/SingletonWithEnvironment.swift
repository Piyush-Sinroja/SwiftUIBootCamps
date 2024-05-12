//
//  SingletonWithEnvironment.swift
//  Demo1
//
//  Created by Piyush Sinroja on 04/03/24.
//

import SwiftUI

protocol NetworkService {
    func fetchData() -> [String]
}

class NetworkServiceImpl: NetworkService {
    func fetchData() -> [String] {
        return ["Data1", "Data2", "Data3"]
    }
}

class Container: ObservableObject {

    static let shared = Container()

    let networkService: NetworkService

    init() {
        networkService = NetworkServiceImpl()
    }
}

struct SingletonWithEnvironment: View {

    @EnvironmentObject var container: Container

    var body: some View {
        List(container.networkService.fetchData(), id: \.self) { data in
            Text(data)
        }
    }
}

#Preview {
    SingletonWithEnvironment()
        .environmentObject(Container.shared)
}
