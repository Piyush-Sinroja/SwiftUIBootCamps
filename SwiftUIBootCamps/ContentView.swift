//
//  ContentView.swift
//  Demo1
//
//  Created by Piyush Sinroja on 19/10/22.
//

import SwiftUI

struct ContentView: View {
    /*
    var body: some View {
        Text("good teasdsf gdgdgj igdjgkdfgjg kghfghfgkfgh khgifkghhf kghk hkfghjfkghf ikhgidhgdkfg hkh gdfgdgdkgj kj gfgdfj")
            //.font(.body)
            //.fontWeight(.bold)
            //.bold()
            //.italic()
            //.underline(true, color: .red)
            //.strikethrough(true, color: .blue)
            //.font(.system(size: 25, weight: .semibold, design: .rounded))
            //.baselineOffset(15)
            //.kerning(10)
            .multilineTextAlignment(.leading)
            .foregroundColor(.red)
            .background(Color(.blue))
            .frame(width: 200, height: 100, alignment: .center)
            .minimumScaleFactor(0.1)
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
    }
     */
    
//    var body: some View {
//        Circle()
//            .fill(Color.green)
//
//    }
    /*
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello World")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            
            Text("This dsadsd hfjdhdjh jjghdjdhjhjh jfdhjdhjgjdsjdhs gyerwyeqwrdjhsdihfkfbmfbfdgfiug jbfdjf yfefffeuyfgefgfeg bjfedhdjdmkjfdjchd.")
            
        }

        .padding()
        .padding(.vertical, 10)
        .background(
            Color.white
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.3), radius: 10,
                       x: 0,
                       y: 10)
        
        )
    }
     */
    
    /*
    var body: some View {
        HStack(spacing: 0) {
            
            Spacer()
                .frame(height: 10)
                .background(Color.green)
            
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
            
            
            Rectangle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
            
            
            Spacer()
                .frame(height: 10)
                .background(Color.green)
            
        }
        .background(Color.orange)

    }
    */
    /*
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVStack() {
                ForEach(0..<100) { index in
                    Rectangle()
                        .fill(Color.red)
                        .frame(height: 400)
                    Rectangle()
                        .fill(Color.green)
                        .frame(height: 400)
                    Rectangle()
                        .fill(Color.blue)
                        .frame(height: 400)
                }
                
            }
        }
    }
    */
    
    /*
    @State var bgColor: Color = .yellow
    
    var body: some View {
        ZStack {
            
            bgColor.edgesIgnoringSafeArea(.all)
            
            contentLayer
        }
    }
    
    var contentLayer: some View {
        Button {
            btnClick()
        } label: {
            Text("Click")
                .font(.headline)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding()
                .background(Color.black)
                .cornerRadius(10)
        }
    }
    
    
    func btnClick() {
        if bgColor == .yellow {
            bgColor = .green
        } else {
            bgColor = .yellow
        }
    }
     */
    
    @State var isAnimated = false
    
    var body: some View {
        VStack {
            Button("Button") {
                withAnimation(
                    Animation.easeInOut(duration: 1.0).repeatCount(5, autoreverses: true)) {
                    isAnimated.toggle()
                }
            }
            Spacer()
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
                .fill(isAnimated ? .red : .green)
                .frame(width: isAnimated ? 100 : 300,
                       height: isAnimated ? 100 : 300)
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 300 : 0)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
