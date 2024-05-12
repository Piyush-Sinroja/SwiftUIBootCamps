//
//  FrameBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 06/04/23.
//

import SwiftUI

struct FrameBootcamp: View {
    var body: some View {
        Text("Hello, World!")
        
            .background(Color.red)
            .frame( height: 100, alignment: .top)
            .background(Color.orange)
            .frame(width: 150)
            .background(Color.purple)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.pink)
            .frame(height: 400)
            .background(Color.green)
            .frame(maxHeight: .infinity, alignment: .center)
            .background(Color.yellow)
        
//            .background(Color.red)
//            .frame(width: 100, height: 100, alignment: .center)
//            .background(Color.orange)
//            .frame(width: 150, height: 150, alignment: .trailing)
//            .background(Color.purple)
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .background(Color.pink)
//            .frame(maxHeight: .infinity, alignment: .top)
//            .background(Color.yellow)
        /*
        Text("Hello, World!")
            .foregroundColor(.green)
            //.frame(width: 100, height: 100, alignment: .center)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color.red)
         */
    }
}

struct FrameBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FrameBootcamp()
    }
}
