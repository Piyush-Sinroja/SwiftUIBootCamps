//
//  AsyncImageBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 11/04/23.
//

import SwiftUI

struct AsyncImageBootcamp: View {
    
    let url = URL(string: "https://picsum.photos/203")

    var body: some View {

        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .cornerRadius(20)
            case .failure:
                Image(systemName: "questionmark")
                    .font(.headline)
            default:
                Image(systemName: "questionmark")
                    .font(.caption)
            }
        }
        
//        if #available(iOS 15, *) {
//            AsyncImage(url: url, content: { img in
//                img
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 300, height: 300)
//                    .cornerRadius(20)
//            }, placeholder: {
//                ProgressView()
//            })
//        } else {
//
//        }
    }
}

struct AsyncImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageBootcamp()
    }
}
