//
//  AppNavBarView.swift
//  Demo1
//
//  Created by Piyush Sinroja on 17/04/23.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        //defaultNavView
        
//        CustomNavBarContainerView {
//            ZStack {
//                Color.orange.ignoresSafeArea()
//
//                NavigationLink {
//                    Text("Destination")
//                } label: {
//                    Text("Navigate")
//                }
//            }
//        }
        
        CustomNavView {
            ZStack {
                Color.orange.ignoresSafeArea()
                
                CustomNavLink(
                    destination:
                        Text("Destination")
                        .customNavigationTitle("Second Screen")
                        .customNavigationSubTitle("Sub title Second Screen")
                ) {
                    Text("Navigate")
                }
                
//                NavigationLink {
//                    Text("Destination")
//                } label: {
//                    Text("Navigate")
//                }
            }
            .customNavBarItems(title: "Custom Title", subTitle: "Custom Subtitle", backBarHidden: false)
        }
    }
}

struct AppNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavBarView()
    }
}

extension AppNavBarView {
    private var defaultNavView: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()

                NavigationLink(destination:
                                Text("Destination")
                    .navigationTitle("Title 2")
                    .navigationBarBackButtonHidden(false)
                    .navigationBarTitleDisplayMode(.inline)
                ) {
                    Text("Navigate")
                }
            }
            .navigationTitle("Nav title here")
        }
    }
}
