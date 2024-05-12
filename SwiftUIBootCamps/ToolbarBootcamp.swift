//
//  SlowListFix.swift
//  Demo1
//
//  Created by Piyush Sinroja on 01/12/22.
//

import SwiftUI

struct ToolbarBootcamp: View {
        
    var body: some View {
        NavigationView {
            Text("Hello, World!").padding()
                .navigationTitle("SwiftUI")
            
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        Button(action: {
//                            taskListVM.taskListTitle = ""
//                            taskListVM.taskListItem = nil
//                            addView.toggle()
//                        }, label: {
//                            Label("Add Item",systemImage: "plus")
//                        })
//                    }
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        Button(action: {
//                            taskListVM.taskListTitle = ""
//                            taskListVM.taskListItem = nil
//                            addView.toggle()
//                        }, label: {
//                            Text("Edit")
//                        })
//                    }
//                }
            
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button("First") {
                            print("Pressed")
                        }

                        Spacer()

                        Button("Second") {
                            print("Pressed")
                        }
                        
                    }
                }
        }
    }
}

struct ToolbarBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarBootcamp()
    }
}
