//
//  NativeNPopoverBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 12/02/24.
//

import SwiftUI

struct NativeNPopoverBootcamp: View {

    @State private var showPopover = false

    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()

            Button("Click Me"){
                showPopover.toggle()
            }
            .popover(isPresented: $showPopover, attachmentAnchor: .point(.center)) {
                Text("Hello, World!")
                    if #available(iOS 16.4, *) {
                        presentationCompactAdaptation(.popover)
                    } else {
                        // Fallback on earlier versions
                    }
            }
        }
    }
}

#Preview {
    NativeNPopoverBootcamp()
}
