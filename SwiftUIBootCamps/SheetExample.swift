//
//  SheetExample.swift
//  Demo1
//
//  Created by Piyush Sinroja on 20/10/22.
//

import SwiftUI

struct SheetExample: View {
    
    @State var showNewScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Button("Click") {
                    showNewScreen.toggle()
                }
                .font(.largeTitle)
                Spacer()
            }
            // Method 1
//            .sheet(isPresented: $showNewScreen) {
//                NewScreen(showNewScreen: $showNewScreen)
//            }
            // Method 2
//            ZStack {
//                if showNewScreen {
//                    NewScreen(showNewScreen: $showNewScreen)
//                        .padding(.top, 100)
//                        .transition(.move(edge: .bottom))
//                        .animation(.spring())
//                }
//            }
//            .zIndex(2.0)
            // Method 3
            
            NewScreen(showNewScreen: $showNewScreen).padding(.top, 0)
                .offset(y: showNewScreen ? 0 : UIScreen.main.bounds.height)
                .animation(.spring())
            
        }
    }
}

struct NewScreen: View {
    
    @Environment(\.presentationMode) var mode
    @Binding var showNewScreen: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.purple
                .edgesIgnoringSafeArea(.all)
           
            Button {
                //mode.wrappedValue.dismiss()
                showNewScreen.toggle()
            } label: {
                Text("Close")
                    .font(.largeTitle)
                    .fontWeight(.black)
            }

            Spacer()
        }
    }
}

struct SheetExample_Previews: PreviewProvider {
    static var previews: some View {
        SheetExample()
    }
}
