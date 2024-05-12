//
//  AppStorageBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 05/04/23.
//

import SwiftUI

struct AppStorageBootcamp: View {
    
    //@AppStorage("username") var username = "Piyush"

    @AppStorage("username", store: UserDefaults(suiteName: "group.com.hacking")) var username = "Piyush"

    var body: some View {
        VStack {
            Text("Welcome, \(username)")
            
            Button("Log in") {
                username = "Developer"
            }
        }
    }
}

struct AppStorageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageBootcamp()
    }
}
