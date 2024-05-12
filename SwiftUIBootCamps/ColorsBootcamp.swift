//
//  ColorsBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 04/04/23.
//

import SwiftUI

struct ColorsBootcamp: View {
    
    var color = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .fill(
               // Color.primary
                //Color(.secondarySystemBackground)
                Color("Custom")
            )
            .frame(width: 200, height: 200, alignment: .center)
            .shadow(color: .red, radius: 10, x: 0, y: 0)
        
    }
}

struct ColorsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ColorsBootcamp()
         //   .preferredColorScheme(.dark)
    }
}
