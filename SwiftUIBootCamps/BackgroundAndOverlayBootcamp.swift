//
//  BackgroundAndOverlayBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 06/04/23.
//

import SwiftUI

struct BackgroundAndOverlayBootcamp: View {
    
    /*
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(width: 100, height: 100, alignment: .center)
            .background(
                //Color.red
                
//                LinearGradient(gradient: Gradient(colors: [.red, .blue, .green]), startPoint: .leading, endPoint: .trailing)
                
                Circle()
                    .fill(.blue)
            )
            .frame(width: 150, height: 150, alignment: .center)
            .background(
                Circle()
                    .fill(.red)
            )
    }
     */
    
    /*
    var body: some View {
     Circle()
            .fill(Color.pink)
            .frame(width: 100, height: 100, alignment: .center)
            .overlay(
                Text("1")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            )
            .background(
                Circle()
                    .fill(Color.purple)
                    .frame(width: 110, height: 110, alignment: .center)
            
            )
    }
    */
    /*
    var body: some View {
        Rectangle()
            .frame(width: 100, height: 100)
            .overlay(
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 50, height: 50)
                , alignment: .center

            )
            .background(
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 150, height: 150)
                , alignment: .center
            )
    }
    */
    /*
    var body: some View {

        Rectangle()

            .frame (width: 100, height: 100)

            .overlay(
                Rectangle()
                    .fill(Color.blue)
                    .frame (width: 50, height: 50)
                , alignment: .center)

            .background (
                Rectangle()
                    . fill(Color.red)
                    . frame (width: 150, height: 150)
                , alignment: .center)
    }
     */
    var body: some View {
     Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundColor(.white)
            .background(
                Circle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    
                    )
                    .frame(width: 100, height: 100, alignment: .center)
                    .shadow(color: .black, radius: 10, x: 0.0, y: 10)
                    
                    .overlay(
                        Circle()
                            .fill(.blue)
                            .frame(width: 35, height: 35, alignment: .center)
                            .overlay(
                            Text("5")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            )
                            .shadow(color: .gray, radius: 10, x: 5, y: 5)
                        , alignment: .bottomTrailing
                    )
            
            )
        
    }
    
}

struct BackgroundAndOverlayBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundAndOverlayBootcamp()
    }
}
