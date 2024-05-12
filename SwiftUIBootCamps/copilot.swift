//
//  SwiftUIView.swift
//  Demo1
//
//  Created by Piyush Sinroja on 11/05/23.
//

import SwiftUI

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        loginforminswiftui()
    }
}

struct loginforminswiftui: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            VStack(alignment: .leading) {
                Text("Email")
                    .font(.headline)
                    .fontWeight(.light)
                    .foregroundColor(Color.init(.label).opacity(0.75))
                TextField("Enter Your Email", text: $email)
                    .padding()
                    .background(Color.init(.tertiarySystemFill))
                    .cornerRadius(10.0)
                    .padding(.bottom, 20)
                Text("Password")
                    .font(.headline)
                    .fontWeight(.light)
                    .foregroundColor(Color.init(.label).opacity(0.75))
                SecureField("Enter Your Password", text: $password)
                    .padding()
                    .background(Color.init(.tertiarySystemFill))
                    .cornerRadius(10.0)
                    .padding(.bottom, 20)
                HStack {
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Forget Password?")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Color.init(.label).opacity(0.75))
                    })
                }
            }
            .padding(.horizontal, 6)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            })
            Spacer()
        }
        .padding()
    }
}
