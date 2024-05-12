//
//  ResizaleSheetBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 12/02/24.
//

import SwiftUI

struct ResizaleSheetBootcamp: View {
    
    @State private var showSheet: Bool = false
    @State private var detents: PresentationDetent = .large

    var body: some View {
        Button("Show Sheet") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet, content: {
            MyNextView(detents: $detents)
                .presentationDetents([.medium, .large], selection: $detents)
                //.presentationDetents([.fraction(0.1), .medium, .large])
               // .presentationDetents([.height(200)])
            //.presentationDragIndicator(.hidden)
            //.interactiveDismissDisabled()
        })
    }
}

#Preview {
    ResizaleSheetBootcamp()
}

struct MyNextView: View {

    @Binding var detents: PresentationDetent

    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
        }

        VStack(spacing: 20) {
            Button("Dismiss") {
                detents = .medium
            }

            Button("Large") {
                detents = .large
            }
        }
    }
}
