//
//  TimeLineViewBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 13/02/24.
//

import SwiftUI

struct TimeLineViewBootcamp: View {
    var body: some View {
        VStack {
            TimelineView(.animation) { context in
                Text("\(context.date.timeIntervalSince1970)" )
                Text("\(context.date)")
            }
        }
    }
}

#Preview {
    TimeLineViewBootcamp()
}
