//
//  ExpandingListBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 05/04/23.
//

import SwiftUI

struct ExpandingListBootcamp: View {
    
    let itemArr: [Bookmark] = [.example1, .example2, .example3]
    @ObservedObject var sections = SectionModel()
    
    var body: some View {
//        List(itemArr, children: \.items) { row in
//            HStack {
//                Image(systemName: row.icon)
//                Text(row.name)
//            }
//            .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
////            .background(
////                Rectangle()
////                    .fill(.brown)
////
////            )
//            .listRowBackground(Color.red)
//        }
//        .scrollContentBackground(.hidden)
//        .listStyle(.insetGrouped)
//        .background(Color.yellow)
//        //.scrollContentBackground(.hidden)
//        //.background(Color.green)
//
//        //.listRowInsets(EdgeInsets())

        List() {
            ForEach(itemArr) { row in
                Section {
                    CategoryHeader(title: row.name, model: self.sections)
                }
                .listRowBackground(Color.yellow)

                if self.sections.isOpen(title: row.name) {
                    ForEach(0..<4) { row in
                        Text("Item #\(row)")
                    }
                    .listRowSeparatorTint(.black)

                } else {
                    EmptyView()
                }
            }
            .listRowBackground(Color.red)
            .listSectionSeparatorTint(.black)
        }
        .listStyle(.plain)
        .background(Color.mint)
    }
}

struct ExpandingListBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ExpandingListBootcamp()
    }
}

struct Bookmark: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let icon: String
    var items: [Bookmark]?
}

extension Bookmark {
    static let apple = Bookmark(name: "Apple", icon: "1.circle")
    static let bbc = Bookmark(name: "BBC", icon: "square.and.pencil")
    static let swift = Bookmark(name: "Swift", icon: "bolt.fill")
    static let twitter = Bookmark(name: "Twitter", icon: "mic")

    static let example1 = Bookmark(name: "Favorites", icon: "star", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example2 = Bookmark(name: "Recent", icon: "timer", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example3 = Bookmark(name: "Recommended", icon: "hand.thumbsup", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
}

class SectionModel: NSObject, ObservableObject {
    // 2
    @Published var sections: [String: Bool] = [String: Bool]()

    func isOpen(title: String) -> Bool {
        // 3
        if let value = sections[title] {
            return value
        } else {
            return true
        }
    }

    // 4
    func toggle(title: String) {
        let current = sections[title] ?? true
        withAnimation {
            sections[title] = !current
        }
    }
}

struct CategoryHeader: View {
    var title: String
    // 2
    @ObservedObject var model: SectionModel
    var body: some View {
        VStack {
            HStack {
                Text(title)
                Spacer()
                // 3
                Image(systemName: model.isOpen(title: title) ?
                      "chevron.up" :
                        "chevron.down")
            }
        }

        // 4
        .contentShape(Rectangle())
        .onTapGesture {
            // 5
            self.model.toggle(title: self.title)
        }
    }
}

