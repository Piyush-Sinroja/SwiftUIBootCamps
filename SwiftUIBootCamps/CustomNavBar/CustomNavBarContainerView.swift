//
//  CustomNavBarContainerView.swift
//  Demo1
//
//  Created by Piyush Sinroja on 17/04/23.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    
    let content: Content
    
    @State private var showBackButton: Bool = true
    @State private var title: String = "Title 1"//""
    @State private var subTitle: String? = "SubTitle 1" // nil

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            CustomNavBarView(showBackButton: showBackButton, title: title, subTitle: subTitle)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        .onPreferenceChange(CustomNavBarTitlePreferenceKeys.self) { value in
            self.title = value
        }
        
        .onPreferenceChange(CustomNavBarSubTitlePreferenceKeys.self) { value in
            self.subTitle = value
        }

        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKeys.self) { value in
            self.showBackButton = !value
        }
    }
}

struct CustomNavBarContainerView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CustomNavBarContainerView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                Text("Hello world")
                    .foregroundColor(.white)
                    .customNavigationTitle("New Title")
                    .customNavigationSubTitle("Sub title")
                    .customNavigationBarBackButtonHidden(true)
            }
        }
    }
}
