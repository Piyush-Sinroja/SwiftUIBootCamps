//
//  SubscriberBootCampl.swift
//  Demo1
//
//  Created by Piyush Sinroja on 09/11/22.
//

import SwiftUI
import Combine

class SubscriberViewModel: ObservableObject {
    @Published var count: Int = 0
//    var timer: AnyCancellable?
    var cancellables = Set<AnyCancellable>()
    
    @Published var textfieldText: String = ""
    @Published var textIsValid: Bool = false
    
    @Published var showButton: Bool = false
    
    init() {
        setUpTimer()
        addTextFieldSubscriber()
        addButtonSubscriber()
    }
    
    func addTextFieldSubscriber() {
        $textfieldText
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .map { (text) -> Bool in
                if text.count > 3 {
                    return true
                }
                return false
            }
            .sink(receiveValue: { [weak self] (isValid) in
                self?.textIsValid = isValid
            })
            //.assign(to: \.textIsValid, on: self)
            .store(in: &cancellables)
    }
    
    func addButtonSubscriber() {
        $textIsValid
            .combineLatest($count)
            .sink { [weak self] (isValid, count) in
                guard let weakSelf = self else { return }
                weakSelf.showButton = (isValid && count >= 10)
            }
            .store(in: &cancellables)
    }
    
    func setUpTimer() {
         Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                
                guard let weakSelf = self else {return}
                
                weakSelf.count += 1
                
                if weakSelf.count >= 10 {
                    //self?.timer?.cancel()
                    
                    for item in weakSelf.cancellables {
                        item.cancel()
                    }
                }
            }
            .store(in: &cancellables)
    }
}

struct SubscriberBootCampl: View {
    
    @StateObject var vm = SubscriberViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
                .foregroundColor(.red)
            
            Text(vm.textIsValid.description)
            
            TextField("Type here", text: $vm.textfieldText)
                .padding(.leading)
                .frame(height: 55)
                .font(.headline)
                .background(Color(#colorLiteral(red: 0.5802771449, green: 0.7275415659, blue: 1, alpha: 1)))
                .cornerRadius(10)
            
            Button(action: {}) {
                Text("Submit".uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
                    .opacity(vm.showButton ? 1.0 : 0.5)
            }
            .disabled(!vm.showButton)
        }
    }
}

struct SubscriberBootCampl_Previews: PreviewProvider {
    static var previews: some View {
        SubscriberBootCampl()
    }
}
