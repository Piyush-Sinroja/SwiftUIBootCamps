//
//  GridLatest.swift
//  Demo1
//
//  Created by Piyush Sinroja on 29/02/24.
//

import SwiftUI

struct GridLatestFlexible: View {

    private var data  = Array(1...20)

    private let flexibleColumn = [
        GridItem(.flexible(minimum: 50, maximum: 200)),
        GridItem(.flexible(minimum: 50, maximum: 200)),
        GridItem(.flexible(minimum: 50, maximum: 200))
    ]


    var body: some View {
        ScrollView{
            LazyVGrid(columns: flexibleColumn, spacing: 10) {
                ForEach(data, id: \.self) { item in
                    Text(String(item))
                        .frame(maxWidth: (UIScreen.main.bounds.width - 40)/3,
                               minHeight: (UIScreen.main.bounds.width - 40)/3,
                               maxHeight: (UIScreen.main.bounds.width - 40)/3, alignment: .center)
                        .background(item % 2 == 0 ? .red : .green)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.title)
                }
            }

        } 
        .padding(.horizontal, 10)
    }
}

struct GridLatestFixed: View {

    private var data  = Array(1...20)
    private let fixedColumn = [

        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]

    var body: some View {

        ScrollView{
            LazyVGrid(columns: fixedColumn, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    Text(String(item))
                        .frame(width: 100, height: 100, alignment: .center)
                        .background(.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.title)
                }
            }
        }
    }
}

struct GridLatestAdaptive: View {

    private var data  = Array(1...20)
    private let gridRows = [
        GridItem(.adaptive(minimum: 150))

    ]
    var body: some View {

        ScrollView(.horizontal){
            LazyHGrid(rows: gridRows, spacing: 20)  {
                ForEach(data, id: \.self) { item in
                    Text(String(item))
                        .frame(width: 100, height: 100, alignment: .center)
                        .background(.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    GridLatestFlexible()
}

#Preview {
    GridLatestFixed()
}

#Preview {
    GridLatestAdaptive()
}
