//
//  ProgressViewBootcampl.swift
//  Demo1
//
//  Created by Piyush Sinroja on 05/04/23.
//

import SwiftUI

struct ProgressViewBootcampl: View {
    
    @State private var downloadAmount = 0.0
    
    var body: some View {
        VStack {
            ProgressView("Downloading", value: downloadAmount, total: 100)
            Button("Increment Download") {
                if downloadAmount < 100 {
                    downloadAmount += 10
                }
            }
        }
    }
}

struct ProgressViewBootcampl_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViewBootcampl()
    }
}
