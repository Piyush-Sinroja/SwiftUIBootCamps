//
//  ScrollViewOffsetPreferenceKeyBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 18/04/23.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
   
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
    
}

struct ScrollViewOffsetPreferenceKeyBootcamp: View {
  
    let title: String = "New title here!!!"
    @State private var scrollViewOffset: CGFloat = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    titleLayer
                        .opacity(Double(scrollViewOffset) / 63.0)
                        .background(
                            GeometryReader { geo in
                                Text("")
                                    .preference(key: ScrollViewOffsetPreferenceKey.self, value: geo.frame(in: .global).minY)
                                
                            }
                        
                        )
                    contentLayer
                }
                .padding()
            }
            .overlay(Text("\(scrollViewOffset)"))
            .onPreferenceChange(ScrollViewOffsetPreferenceKey.self, perform: { value in
                scrollViewOffset = value
            })
            .overlay(navBarLayer
                .opacity(scrollViewOffset < 40 ? 1.0 : 0.0)
                     , alignment: .top)
        }
    }
}

struct ScrollViewOffsetPreferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewOffsetPreferenceKeyBootcamp()
    }
}

extension ScrollViewOffsetPreferenceKeyBootcamp {
    
    private var titleLayer: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var contentLayer: some View {
        ForEach(0..<100) {_ in
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red.opacity(0.3))
                .frame(width: 300, height: 200)
        }
    }
    
    private var navBarLayer: some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.blue)
    }
}
