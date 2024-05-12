//
//  TabViewExample.swift
//  Demo1
//
//  Created by Piyush Sinroja on 20/10/22.
//

import SwiftUI

struct TabViewExample: View {
    
    @State var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }.tag(0)
            
            
            Text("Browse Tab")
                .tabItem {
                    Image(systemName: "globe")
                    Text("Browse")
                }.tag(1)
            
            ProfileView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }.tag(2)
        }
        .accentColor(.red)
    }
}

struct HomeView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            Color.red
            
                .edgesIgnoringSafeArea([.top, .leading, .trailing])
            
            VStack {
                
                Text("Home Tab")
                    .font(.largeTitle)
                .foregroundColor(.white)
                
                Button {
                    selectedTab = 2
                } label: {
                    Text("Go to profile")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(3.0)
                }

            }
            
           
        }
    }
}

struct ProfileView: View {
    
    @Binding var selectedTab: Int
    
    let icons = ["heart.fill", "globe", "house.fill", "person.fill"]
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea([.top, .leading, .trailing])
            TabView() {
                ForEach(icons, id: \.self) { icon in
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .padding(30)
                }
            }
            .frame(height: 400)
            .background(RadialGradient(colors: [.red, .blue], center: .center, startRadius: 5, endRadius: 300))
            .tabViewStyle(.page)
        }
    }
}

struct TabViewExample_Previews: PreviewProvider {
    static var previews: some View {
        TabViewExample()
    }
}
