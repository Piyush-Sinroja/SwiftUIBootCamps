//
//  DisclosureGroupBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 05/04/23.
//

import SwiftUI

struct DisclosureGroupBootcamp: View {
    
    @State private var showInfo = false
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea(.all)
                
            VStack {
                DisclosureGroup("Show information", isExpanded: $showInfo) {
                    Text("Long terms and conditions here")
                    
                    Button("Hide again") {
                        showInfo.toggle()
                    }
                }.padding(.horizontal)
                
                Spacer()
            }
            .ignoresSafeArea(.all)
        }
    }
}

struct DisclosureGroupBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroupBootcamp()
    }
}
