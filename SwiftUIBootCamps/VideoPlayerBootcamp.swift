//
//  VideoPlayerBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 05/04/23.
//

import SwiftUI
import AVKit
struct VideoPlayerBootcamp: View {
    var body: some View {
        VideoPlayer(player: AVPlayer(url: URL(string: "https://bit.ly/swswift")!)) {
            VStack {
                Text("Watermark")
                    .font(.caption)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.7))
                    .clipShape(Capsule())
                
                Spacer()
            }
        }
    }
}

struct VideoPlayerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerBootcamp()
    }
}
