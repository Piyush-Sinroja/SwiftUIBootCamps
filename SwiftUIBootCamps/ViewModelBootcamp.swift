//
//  ViewModelBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 11/04/23.
//

import SwiftUI

struct FruitModel: Identifiable {
    var id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    
   @Published var fruitArray: [FruitModel] = []
    
   @Published var isLoading: Bool = false
    
    init() {
        getFruits()
    }
    
    func getFruits() {
        let fruit1 = FruitModel(name: "Orange", count: 16)
        let fruit2 = FruitModel(name: "Banana", count: 67)
        let fruit3 = FruitModel(name: "Watermelon", count: 44)
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            
            self.isLoading = false
        }
    }
    
    func deleteFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
}

struct ViewModelBootcamp: View {
    
//    @State var fruitArry: [FruitModel] = [
//        FruitModel(name: "Apples", count: 5)
//    ]
    
   //@StateObject -> Use this when model creating firstTime / init
   //@ObservedObject -> Use this for subviews
    
   @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView {
            if fruitViewModel.isLoading {
                ProgressView()
            } else {
                List {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text("\(fruit.name)")
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }
                .listStyle(.grouped)
                .navigationTitle("Fruit List")
                .navigationBarItems(trailing:
                                        NavigationLink(destination: RandomScreen(fruitViewModel: fruitViewModel), label: {
                    Image(systemName: "arrow.right").font(.title)
                })
                
                )
            }
        }
        
//        .onAppear {
//            fruitViewModel.getFruits()
//        }
    }
}

struct ViewModelBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModelBootcamp()
    }
}

struct RandomScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            
            VStack {
                ForEach(fruitViewModel.fruitArray, content: { fruit in
                    Text(fruit.name)
                        .foregroundColor(.white)
                        .font(.headline)
                })
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Go Back")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                }
            }
        }
    }
}
