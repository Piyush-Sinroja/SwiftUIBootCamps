//
//  PaddingAndSpacerBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 06/04/23.
//

import SwiftUI

struct PaddingBootcamp: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .background(Color.yellow)
//            .padding(.all, 20)
//            .padding(.leading, 20)
//            .background(Color.blue)
        
        VStack(alignment: .leading) {
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text("This is the description of what we will do on this screen.")
                .multilineTextAlignment(.leading)
        }
        .background(Color.blue)
        .padding()
        .padding(.vertical, 30)
        .background(
            Color.white
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0)
        )
       // .padding(.horizontal, 10)
      //  .background(Color.green)
    }
}

struct PaddingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PaddingBootcamp()
    }
}
