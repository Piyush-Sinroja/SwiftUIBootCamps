//
//  List.swift
//  Demo1
//
//  Created by Piyush Sinroja on 20/10/22.
//

import SwiftUI

struct ListView: View {
    
    @State var fruits: [String] = ["A", "B", "C", "D"]
    
    @State var veggies: [String] = ["tomato", "potato", "carrot"]
    
    var body: some View {
        
        NavigationView {
            List {
                Section(
                    header: Text("Fruits Section").foregroundColor(.red)) {
                    
                        ForEach(fruits.indices, id: \.self) { indexValue in
                            
                        Text(fruits[indexValue].capitalized)
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button("Archive") {
                                    
                                }
                                .tint(.green)
                                
                                Button("Save") {
                                    fruits.remove(at: indexValue)
//                                    if let indexValue = fruits.firstIndex(where: {$0 == fruitName}) {
//                                        fruits.remove(at: indexValue)
//                                    }
                                }
                                .tint(.blue)
                                
                                Button("Junk") {
                                    
                                    
                                }
                                .tint(.black)
                            }
                    }
                    //.onDelete(perform: delete)
                        .onMove(perform: move)
                    }
                
                Section(header: Text("Veggies").foregroundColor(.red)) {
                    ForEach(veggies, id: \.self ) { veg in
                        Text(veg.capitalized)
                    }
                        .onMove(perform: moveVeg)
                }
            }
            .navigationTitle("Grocery List")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: EditButton())
        }
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    func move(indices: IndexSet, newOffSet: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffSet)
    }
    
    func moveVeg(indices: IndexSet, newOffSet: Int) {
        veggies.move(fromOffsets: indices, toOffset: newOffSet)
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
