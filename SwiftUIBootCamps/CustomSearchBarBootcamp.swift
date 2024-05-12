//
//  CustomSearchBarBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 04/03/24.
//

import SwiftUI

struct CustomSearchBarBootcamp: View {

    @Binding var text: String

    var body: some View {
        VStack {

            ZStack {
                // background
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.searchGray)
                    .frame(height: 36)

                HStack(spacing: 6) {
                    Spacer()
                        .frame(width: 0)

                    // 􀊫
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)

                    // TextField
                    TextField("", text: $text)
                        .placeholder(when: text.isEmpty, color: .gray) {
                            Text("Search")
                        }

                    // 􀁑
                    if !text.isEmpty {
                        Button {
                            text.removeAll()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 6)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

extension Color {
    static let searchGray = Color("SearchGray")
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        color: Color,
        @ViewBuilder placeholder: () -> Content) -> some View {

            ZStack(alignment: alignment) {
                placeholder()
                    .opacity(shouldShow ? 1 : 0)
                    .foregroundColor(color)
                self
            }
        }
}

#Preview {
    CustomSearchBarBootcamp(text: .constant(""))
}
