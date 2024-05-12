//
//  LinkBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 05/04/23.
//

import SwiftUI

struct LinkBootcamp: View {
    var body: some View {
//        Link("Learn SwiftUI", destination: URL(string: "https://www.google.com")!)
//            .font(.title)
//            .foregroundColor(.purple)
        Link(destination: URL(string: "https://www.google.com")!) {
            Image(systemName: "link.circle.fill")
                .font(.largeTitle)
        }
    }
}

struct LinkBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LinkBootcamp()
    }
}
