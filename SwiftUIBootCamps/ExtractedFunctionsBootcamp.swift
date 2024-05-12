//
//  ExtractedFunctionsBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 07/04/23.
//

import SwiftUI

struct ExtractedFunctionsBootcamp: View {
    
    @State var bgColor: Color = .pink
    
    var body: some View {
        ZStack {
            bgColor
                .ignoresSafeArea(.all)
            
            contentLayer
        }
    }
    
    var contentLayer: some View {
        VStack {
            Text("Title")
                .font(.largeTitle)
            
            Button {
                btnPressed()
            } label: {
                Text("Press me")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            }

        }
    }
    
    func btnPressed() {
        bgColor = .cyan
    }
}

struct ExtractedFunctionsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ExtractedFunctionsBootcamp()
    }
}
