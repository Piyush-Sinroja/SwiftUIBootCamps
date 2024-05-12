//
//  FutureBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 30/11/22.
//

import SwiftUI
import Combine

class FutureBootcampViewModel: ObservableObject {
    
    @Published var title: String = "Starting title"
    
    let url = URL(string: "https://www.google.com")!
    var cancellables = Set<AnyCancellable>()
    
    init() {
        download()
    }
    
    func download() {
//        getCombinePublisher()
//            .sink { _ in
//
//            } receiveValue: { [weak self] returnValue in
//                self?.title = returnValue
//            }
//            .store(in: &cancellables)
        
//        getEscapingClosure { [weak self] returnValue, error in
//            self?.title = returnValue
//        }
        
        getFuturePublisher()
            .sink { _ in
                
            } receiveValue: { [weak self] returnValue in
                self?.title = returnValue
            }
            .store(in: &cancellables)
    }
    
    func getCombinePublisher() -> AnyPublisher<String, URLError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .timeout(1, scheduler: DispatchQueue.main)
            .map({ _ in
                return "New value"
            })
            .eraseToAnyPublisher()
    }
    
    func getEscapingClosure(completionHandler: @escaping (_ value: String, _ error: Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completionHandler("New value 2", nil)
        }
        .resume()
    }
    
    func getFuturePublisher() -> Future<String, Error> {
        return Future { promise in
            self.getEscapingClosure { returnValue, error in
                if let error {
                    promise(.failure(error))
                } else {
                    promise(.success(returnValue))
                }
            }
        }
    }
}

struct FutureBootcamp: View {
    
    @StateObject private var vm = FutureBootcampViewModel()
    
    var body: some View {
        Text(vm.title)
    }
}

struct FutureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FutureBootcamp()
    }
}
