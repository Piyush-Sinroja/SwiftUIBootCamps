//
//  BindingBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 07/04/23.
//

import SwiftUI

struct BindingBootcamp: View {
    
    @State var bgColor: Color = .green

    var body: some View {
        ZStack {
            bgColor.ignoresSafeArea(.all)
            ButtonView(bgColor: $bgColor)
        }
    }
}

struct BindingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BindingBootcamp()
    }
}

struct ButtonView: View {
    
    @Binding var bgColor: Color
    @State var isOn: Bool = false
    @State var btnColor: Color = .blue
    
    var body: some View {
        
        Button {
            isOn.toggle()
            changeColor()
        } label: {
            Text("Submit".uppercased())
                .bold()
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(btnColor)
                .cornerRadius(10)
        }
    }

    func changeColor() {
        if isOn {
            bgColor = .red
            btnColor = .mint
        } else {
            bgColor = .green
            btnColor = .pink
        }
    }
}
