//
//  SafeAreaInsetBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 12/02/24.
//

import SwiftUI
// https://fatbobman.medium.com/mastering-safe-area-in-swiftui-a183b8ad04d0
struct SafeAreaInsetBootcamp: View {
    var body: some View {
        NavigationStack {
            List(0..<10) { _ in
                Rectangle()
                    .frame(height: 300)
            }
            .navigationTitle("Safe Area Insets")

            .safeAreaInset(edge: .top, alignment: .trailing, spacing: nil) {
                Text("Hi")
                    .frame(maxWidth: .infinity, alignment: .center)
                    //.background(Color.red)
                    .background(Color.red.edgesIgnoringSafeArea(.bottom))
                    .foregroundColor(.white)
            }
        }
    }
}
#Preview {
    SafeAreaInsetBootcamp()
}
