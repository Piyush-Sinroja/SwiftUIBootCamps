//
//  OnAppear.swift
//  Demo1
//
//  Created by Piyush Sinroja on 20/10/22.
//

import SwiftUI

struct OnAppear: View {
    
    @State var count: Int = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(0..<10) { _ in
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(height: 200)
                            .padding()
                            .onAppear {
                                count += 1
                            }
                    }

                }
            }
            .navigationTitle("On Appear: \(count)")
        }
    }
}

struct OnAppear_Previews: PreviewProvider {
    static var previews: some View {
        OnAppear()
    }
}
