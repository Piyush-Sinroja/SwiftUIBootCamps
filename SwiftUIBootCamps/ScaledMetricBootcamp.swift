//
//  ScaledMetricBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 05/04/23.
//

import SwiftUI

struct ScaledMetricBootcamp: View {
    
    @ScaledMetric var imageSize: CGFloat = 100

    var body: some View {
        Image(systemName: "cloud.sun.bolt.fill")
            .resizable()
            .frame(width: imageSize, height: imageSize)
    }
}

struct ScaledMetricBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScaledMetricBootcamp()
    }
}
