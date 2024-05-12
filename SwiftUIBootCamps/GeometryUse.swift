//
//  GeometryUse.swift
//  Demo1
//
//  Created by Piyush Sinroja on 10/11/22.
//

import SwiftUI

struct GeometryUse: View {
    
    @State var isShowingStats: Bool
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
               // Spacer(minLength: geometry.size.width * 0.15)
               
                VStack(spacing: 0) {
                    
                    Text("geometry.size.width \(geometry.size.width)")
                    Text("geometry.size.height \(geometry.size.height)")
                    
                    Text("geometry.safeAreaInsets.leading \(geometry.safeAreaInsets.leading)")
                    Text("geometry.safeAreaInsets.trailing \(geometry.safeAreaInsets.trailing)")
                    Text("geometry.safeAreaInsets.top \(geometry.safeAreaInsets.top)")
                    Text("geometry.safeAreaInsets.bottom \(geometry.safeAreaInsets.bottom)")
                    
                    HStack {
                        Button(
                            action: {
                                isShowingStats = false
                            },
                            label: {
                                Image(systemName: "xmark.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(10)
                                    .frame(height: 44)
                                    .foregroundColor(.white)
                            }
                        )
                        
                        Spacer()
                    }
                    .background(Color.black.opacity(0.55))
                    
                }
                .padding(.vertical, geometry.size.height * 0.1)
            }
            .ignoresSafeArea()
            
            /// Use opacity to hide the view so that it stays in the view hierarchy. `StatsViewController` is old code
            /// that expects to stay in memory even when it is not visible.
            .opacity(isShowingStats ? 1 : 0)
        }
    }
}

struct GeometryUse_Previews: PreviewProvider {
    static var previews: some View {
        GeometryUse(isShowingStats: true)
        
    }
}
