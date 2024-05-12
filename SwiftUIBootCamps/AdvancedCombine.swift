//
//  AdvancedCombine.swift
//  Demo1
//
//  Created by Piyush Sinroja on 09/11/22.
//

import SwiftUI
import Combine

class AdvancedCombineDataService {
    
    //@Published var basicPublisher: [String] = []
   // @Published var basicPublisher: Int = 0
    
   // var currentValuePublisher = CurrentValueSubject<Int, Error>(0)
    var passThroughPublisher = PassthroughSubject<Int, Error>()
    
    init() {
        publishFakeData()
    }
    
    private func publishFakeData() {
        let items: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        
        for x in items.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
                self.passThroughPublisher.send(items[x])

                if x == items.indices.last {
                    self.passThroughPublisher.send(completion: .finished)
                }
            }
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
//            self.passThroughPublisher.send(1)
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            self.passThroughPublisher.send(2)
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//            self.passThroughPublisher.send(3)
//        }
    }
}


class AdvancedCombineViewModel: ObservableObject {
    @Published var data: [Int] = []
    @Published var errorStr = ""
    let dataService = AdvancedCombineDataService()
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }

    private func addSubscribers() {
        dataService.passThroughPublisher
        
        /*
//            .tryFirst(where: { intValue in
//                if intValue == 3 {
//                    throw URLError(.badServerResponse)
//                }
//                return intValue > 1
//            })
            //.dropFirst(3)
            //.drop(while: {$0 < 5})
           // .prefix(5)
           // .output(at: 5)
           // .output(in: 2...5)
           // .map({$0 * 2})
           // .last()
           // .last(where: {$0 > 4})
        */
        
            //.max()
            
//            .tryMap({ int in
//                if int == 5 {
//                    throw URLError(.badServerResponse)
//
//                }
//                return String(int)
//            })
        
//            .compactMap({ int in
//                if int == 5 {
//                    return nil
//                }
//                return int
//            })
            
           // .collect()
        
           // .debounce(for: 0.75, scheduler: DispatchQueue.main)
          //  .throttle(for: 10, scheduler: DispatchQueue.main, latest: false)
        
            .retry(2)
        
            .sink { completion in
                switch completion  {
                case .finished:
                    break
                case .failure(let error):
                    self.errorStr = "Error: \(error.localizedDescription)"
                    break
                }
            } receiveValue: { [weak self] returnValue in
                // (returnValue: Int) -> Void
                // print("returnValue \(returnValue)")
                //self?.data = returnValue
               self?.data.append(returnValue)
            }
            .store(in: &cancellables)
    }
}

struct AdvancedCombine: View {
    
    @StateObject private var vm = AdvancedCombineViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.data, id:\.self) {
                    Text("\($0)")
                        .font(.title3)
                        .fontWeight(.black)
                }
                
                if !vm.errorStr.isEmpty {
                    Text(vm.errorStr)
                }
            }
        }
    }
}

struct AdvancedCombine_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedCombine()
    }
}
