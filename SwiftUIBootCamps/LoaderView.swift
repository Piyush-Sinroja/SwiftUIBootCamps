//
//  LoaderView.swift
//  Demo1
//
//  Created by Piyush Sinroja on 28/02/24.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        ZStack {

            Rectangle()
                .fill(Color.gray.opacity(0.4))
                .ignoresSafeArea(.all)

            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 60, height: 60)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)

                    ProgressView()
                        .scaleEffect(2.0, anchor: .center)
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                }

                Text("Loading...")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.top, 5)
            }

        }
    }
}

#Preview {
    LoaderView()
}
