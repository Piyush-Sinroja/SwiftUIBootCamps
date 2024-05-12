//
//  PickerView.swift
//  Demo1
//
//  Created by Piyush Sinroja on 20/10/22.
//

import SwiftUI

struct PickerView: View {
    
//    @State var selection = "1"
    
//    var body: some View {
//        VStack {
//            HStack {
//                Text("Age:")
//                Text(selection)
//            }
//
//            Picker(
//                selection: $selection,
//                label: Text("Picker"),
//                content: {
//                    ForEach(18..<100) { number in
//                        Text("\(number)")
//                            .font(.headline)
//                            .foregroundColor(.red)
//                            .tag("\(number)")
//                    }
//            })
//
//            .pickerStyle(.wheel)
//        }
//    }
    
    let filterOption: [String] = [
        "Most Recent", "Most Popular", "Most Liked"
    ]
//
//    var body: some View {
//        Picker(
//            selection: $selection,
//            label:
//            HStack {
//            Text("Filter:")
//            Text(selection)
//        }
//            .font(.headline)
//            .foregroundColor(.white)
//            .padding()
//            .padding(.horizontal)
//            .background(Color.blue)
//            .cornerRadius(10)
//            .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 10)
//               ,
//               content: {
//                   ForEach(filterOption, id: \.self) { option in
//                       HStack {
//                           Text(option)
//                           Image(systemName: "heart.fill")
//                       }
//                       .tag(option)
//                   }
//        })
//    }
    
    @State var selection = "Most Recent"
    
    var body: some View {
        Picker(
            selection: $selection,
            label: Text("Picker"),
            content: {
                ForEach(filterOption.indices) { index in
                    Text(filterOption[index])
                        .tag(filterOption[index])
                }
            })
        
        .pickerStyle(.segmented)
    }
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .blue
        
        UISegmentedControl.appearance().backgroundColor = .yellow
        
        let attribute: [NSAttributedString.Key: Any] = [
            .foregroundColor : UIColor.red
        ]
        
        UISegmentedControl.appearance().setTitleTextAttributes(attribute, for: .selected)
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
