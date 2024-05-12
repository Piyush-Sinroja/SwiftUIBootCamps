//
//  HVZStackBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 06/04/23.
//

import SwiftUI

struct HVZStackBootcamp: View {
    /*
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.green)
                .frame(width: 100, height: 100)
            
            Rectangle()
                .fill(Color.red)
                .frame(width: 80, height: 80)
            
            Rectangle()
                .fill(Color.yellow)
                .frame(width: 60, height: 60)
        }
    }
     */
    
    var body: some View {
//        VStack(alignment: .trailing, spacing: nil) {
//            Rectangle()
//                .fill(Color.green)
//                .frame(width: 100, height: 100)
//
//            Rectangle()
//                .fill(Color.red)
//                .frame(width: 80, height: 80)
//
//            Rectangle()
//                .fill(Color.yellow)
//                .frame(width: 60, height: 60)
//        }
        
//        HStack(alignment: .top, spacing: nil) {
//            Rectangle()
//                .fill(Color.green)
//                .frame(width: 100, height: 100)
//
//            Rectangle()
//                .fill(Color.red)
//                .frame(width: 80, height: 80)
//
//            Rectangle()
//                .fill(Color.yellow)
//                .frame(width: 60, height: 60)
//        }
        
//        ZStack(alignment: .center) {
//            Rectangle()
//                .fill(Color.green)
//                .frame(width: 100, height: 100)
//
//            Rectangle()
//                .fill(Color.red)
//                .frame(width: 80, height: 80)
//
//            Rectangle()
//                .fill(Color.yellow)
//                .frame(width: 60, height: 60)
//        }
        
//        ZStack(alignment: .top) {
//
//            Rectangle()
//                .fill(Color.yellow)
//                .frame(width: 350, height: 350, alignment: .center)
//
//            VStack(alignment: .leading, spacing: 20) {
//                Rectangle()
//                    .fill(Color.green)
//                    .frame(width: 100, height: 100)
//
//                Rectangle()
//                    .fill(Color.red)
//                    .frame(width: 80, height: 80)
//
//                HStack(alignment: .bottom) {
//                    Rectangle()
//                        .fill(Color.purple)
//                    .frame(width: 60, height: 60)
//
//                    Rectangle()
//                        .fill(Color.pink)
//                    .frame(width: 75, height: 75)
//
//                    Rectangle()
//                        .fill(Color.blue)
//                    .frame(width: 25, height: 25)
//                }.background(Color.white)
//            }.background(Color.black)
//        }
        
//        VStack(alignment: .center, spacing: 10) {
//            Text("5")
//                .font(.largeTitle)
//                .underline()
//            Text("Items in your cart:")
//                .font(.caption)
//                .foregroundColor(.gray)
//        }
        
        VStack(spacing: 50) {
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                
                Text("1")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            Text("1")
                .font(.title)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .frame(width: 100, height: 100)
                )
            
        }
    }
}

struct HVZStackBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HVZStackBootcamp()
    }
}
