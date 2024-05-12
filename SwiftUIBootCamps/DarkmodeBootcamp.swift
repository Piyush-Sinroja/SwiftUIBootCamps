//
//  DarkmodeBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 11/04/23.
//

import SwiftUI

struct DarkmodeBootcamp: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("primary color")
                        .foregroundColor(.primary)
                    Text("secondary color")
                        .foregroundColor(.secondary)
                    Text("black color")
                        .foregroundColor(.black)
                    Text("white color")
                        .foregroundColor(.white)
                    Text("red color")
                        .foregroundColor(.red)
                    
                    Text("globally adaptive color")
                        .foregroundColor(Color("AdaptiveColor"))
                    
                    Text("locally adaptive color")
                        .foregroundColor(colorScheme == .light ? .green : .purple)
                }
            }
        }
    }
}

struct DarkmodeBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DarkmodeBootcamp().preferredColorScheme(.light)
            DarkmodeBootcamp().preferredColorScheme(.dark)
        }
        
    }
}
