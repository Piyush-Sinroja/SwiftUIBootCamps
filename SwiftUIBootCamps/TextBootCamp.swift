//
//  TextBootCamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 03/04/23.
//

import SwiftUI

struct TextBootCamp: View {
    var body: some View {
        Text(Date().addingTimeInterval(600), style: .relative)
        Text("this")
            //.font(.body)
            //.fontWeight(.heavy)
            //.bold()
            //.underline()
            //.italic()
            //.strikethrough()
            //.underline(true, color: .red)
            //.strikethrough(true, color: .yellow)
            //.font(.system(size: 24, weight: .semibold, design: .rounded))
            //.baselineOffset(10)
            .multilineTextAlignment(.leading)
            //.kerning(1.0)
            .foregroundColor(.red)
            .frame(width: 200, height: 100, alignment: .leading)
            .minimumScaleFactor(0.1)
        
        
            
    }
}

struct TextBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        TextBootCamp()
    }
}
