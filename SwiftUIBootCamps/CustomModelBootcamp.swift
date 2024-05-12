//
//  CustomModelBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 11/04/23.
//

import SwiftUI

struct UserModel: Hashable {
    var id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let follwerCount: Int
}


struct CustomModelBootcamp: View {
    
//    @State var users: [String] = ["Paresh", "Piyush", "Sagar", "Tushar"]
    
    @State var users: [UserModel] = [
    UserModel(displayName: "Paresh", userName: "Paresh123", follwerCount: 100),
    UserModel(displayName: "Piyush", userName: "Piyush123", follwerCount: 70),
    UserModel(displayName: "Sagar", userName: "Sagar123", follwerCount: 40),
    UserModel(displayName: "Tushar", userName: "Tushar123", follwerCount: 50)
    ]
    
    
    /// <#Description#>
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.self) { user in
                    HStack(spacing: 15.0) {
                        Circle()
                            .frame(width: 35, height: 35)
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                            Text(user.userName)
                            Text(user.id)
                                .font(.system(size: 11, weight: .regular, design: .default))
                        }
                    }
                    .padding(.vertical, 10)
                    
                }
            }
        }
    }
}

struct CustomModelBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomModelBootcamp()
    }
}
