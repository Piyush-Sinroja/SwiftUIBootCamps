//
//  Navigation.swift
//  Demo1
//
//  Created by Piyush Sinroja on 20/10/22.
//

import SwiftUI

struct Navigation: View {
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink("Hello World", destination: MyNewScreen())
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            
            .navigationBarItems(
                leading:
                    HStack {
                        Image(systemName: "gear")
                        Image(systemName: "person.fill")
                    },
                trailing:
                    NavigationLink(destination: MyNewScreen(), label: {
                        Image(systemName: "flame.fill")
                    })
                    .tint(.red)
            )
        }
    }
}

struct MyNewScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
               // .navigationBarHidden(true)
            
            
            VStack {
                Text("MyNewScreen")
                
                Button("Back Button") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
