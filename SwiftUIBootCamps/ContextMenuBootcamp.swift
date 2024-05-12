//
//  ContextMenuBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 10/04/23.
//

import SwiftUI

struct ContextMenuBootcamp: View {
    
    @State var bgColor: Color = .blue
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("SwiftUI Learning")
                .font(.headline)
            Text("How to user Context Menu")
                .font(.subheadline)
        }
        .foregroundColor(.white)
        .padding(30)
        .background(bgColor.cornerRadius(10))
        .contextMenu {
            
            Button {
                bgColor = .red
            } label: {
                Label("Btn 1", systemImage: "flame.fill")
            }

            Button {
                bgColor = .yellow
            } label: {
                Text("Btn 2")
            }
            
            Button {
                bgColor = .green
            } label: {
                Text("Btn 3")
                Image(systemName: "heart.fill")
                    
            }
        }
    }
}

struct ContextMenuBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuBootcamp()
    }
}
