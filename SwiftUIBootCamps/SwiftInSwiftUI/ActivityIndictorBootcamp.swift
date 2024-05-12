//
//  ActivityIndictorBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 12/02/24.
//

import SwiftUI

struct ActivityIndictor: UIViewRepresentable {

    typealias UIViewType = UIActivityIndicatorView

    var style: UIActivityIndicatorView.Style = .medium
    
    var isLoading: Bool

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isLoading ? uiView.startAnimating() : uiView.stopAnimating()
    }

}

struct ActivityIndictorBootcamp: View {
    
    @State private var isLoading: Bool = false

    var body: some View {
        ActivityIndictor(style: .large, isLoading: isLoading)
            .padding()

        Button(action: {
            isLoading.toggle()
        }, label: {
            Text(isLoading ? "Stop": "Start")
                .padding(20)
                .background(Color.blue)
                .foregroundColor(.white)
        })

    }
}

#Preview {
    ActivityIndictorBootcamp()
}
