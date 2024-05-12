//
//  ImageBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 06/04/23.
//

import SwiftUI

struct ImageBootcamp: View {
    var body: some View {
        Image("WhatsAppCall")
           .resizable()
           //.aspectRatio(contentMode: .fill)
           .scaledToFill()
           .frame(width: 300, height: 200)
           //.clipped()
           //.cornerRadius(150)
//           .clipShape(
//            Circle()
            //RoundedRectangle(cornerRadius: 25.0)
            //Ellipse()
            
 //          )
//
//            .background(Color.red)
    }
}

struct ImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ImageBootcamp()
    }
}
