//
//  FullScreenModalViewBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 05/04/23.
//

import SwiftUI


struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("This is a modal view")
            Text("Tap to dismiss")
            
            Spacer()
            
            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }.foregroundColor(.white)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .edgesIgnoringSafeArea(.all)
//        .onTapGesture {
//            presentationMode.wrappedValue.dismiss()
//        }
    }
}

struct FullScreenModalViewBootcamp: View {
    
    @State private var isPresented = false
    
    var body: some View {
        Button("Present!") {
            self.isPresented.toggle()
        }
        .fullScreenCover(isPresented: $isPresented, content: FullScreenModalView.init)
    }
}

struct FullScreenModalViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenModalViewBootcamp()
    }
}
