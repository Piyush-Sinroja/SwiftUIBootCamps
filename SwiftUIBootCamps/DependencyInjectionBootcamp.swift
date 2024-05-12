//
//  DependencyInjectionBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 30/11/22.
//

import SwiftUI
import Combine

struct PostsModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}


protocol DataServiceProtocol {
    func getData() -> AnyPublisher<[PostsModel], Error>
}

class ProductionDataService {
    
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func getData() -> AnyPublisher<[PostsModel], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({$0.data})
            .decode(type: [PostsModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
// MARK: - Use mark to logically organize your code
class MockDataService: DataServiceProtocol {
    
    var testData: [PostsModel]
    
    init(data: [PostsModel]) {
        self.testData = data
    }
    
    func getData() -> AnyPublisher<[PostsModel], Error> {
        Just(testData)
            .tryMap({$0})
            .eraseToAnyPublisher()
    }
}
// FIXME: Use fixme to create a reminder to fix broken code later
class DependencyInjectionViewModel: ObservableObject {
    @Published var dataArray: [PostsModel] = []
    var cancellables = Set<AnyCancellable>()
   // let dataService: ProductionDataService
    let dataService: DataServiceProtocol
    
//    init(dataService: ProductionDataService) {
//        self.dataService = dataService
//        loadPosts()
//    }
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
        loadPosts()
    }
    
    private func loadPosts() {
        dataService.getData()
            .sink { _ in
                
            } receiveValue: { [weak self] returnPosts in
                self?.dataArray = returnPosts
            }
            .store(in: &cancellables)
    }
}

struct DependencyInjectionBootcamp: View {
    
    @StateObject private var vm: DependencyInjectionViewModel

//    init(dataService: ProductionDataService) {
//        _vm = StateObject(wrappedValue: DependencyInjectionViewModel(dataService: dataService))
//    }
    
    init(dataService: DataServiceProtocol) {
        _vm = StateObject(wrappedValue: DependencyInjectionViewModel(dataService: dataService))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.dataArray) { post in
                    Text(post.title)
                }
            }
        }
    }
}


struct DependencyInjectionBootcamp_Previews: PreviewProvider {
    
  //  static let dataService = ProductionDataService(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
    
    static let dataService = MockDataService(data: [
        PostsModel(userId: 3, id: 3, title: "Three", body: "Three"),
        PostsModel(userId: 4, id: 4, title: "Four", body: "Four")
    ])
    
    static var previews: some View {
        DependencyInjectionBootcamp(dataService: dataService)
    }
}
