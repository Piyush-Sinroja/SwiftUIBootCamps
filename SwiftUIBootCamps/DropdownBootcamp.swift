//
//  DropdownBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 20/03/24.
//

import SwiftUI

struct DropdownBootcamp: View {

    @State var selectedBreakPeriod: Int = 5

    static var uniqueKey: String {
        UUID().uuidString
    }

    let breakOptions: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: "1"),
        DropdownOption(key: uniqueKey, value: "5"),
        DropdownOption(key: uniqueKey, value: "10"),
        DropdownOption(key: uniqueKey, value: "15"),
        DropdownOption(key: uniqueKey, value: "20"),
        DropdownOption(key: uniqueKey, value: "30"),
        DropdownOption(key: uniqueKey, value: "60")
    ]

    var body: some View {
        VStack {
            DropdownSelector(
                placeholder: "\(selectedBreakPeriod) seconds",
                options: breakOptions,
                onOptionSelected: { option in
                    print(option)
                })
            .padding(.horizontal, 15)
        }
    }
}

#Preview {
    DropdownBootcamp()
}

struct DropdownOption: Hashable {
    let key: String
    let value: String

    public static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        return lhs.key == rhs.key
    }
}

struct DropdownRow: View {
    var option: DropdownOption
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?

    var body: some View {
        Button(action: {
            if let onOptionSelected = self.onOptionSelected {
                onOptionSelected(self.option)
            }
        }) {
            HStack {
                Text(self.option.value)
                    .font(.system(size: 17))
                    .foregroundColor(Color.black)
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
    }
}

struct Dropdown: View {
    var options: [DropdownOption]
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(self.options, id: \.self) { option in
                    DropdownRow(option: option, onOptionSelected: self.onOptionSelected)
                }
            }
        }
        .frame(minHeight: CGFloat(options.count) * 30, maxHeight: 250)
        .padding(.vertical, 5)
        .background(Color.white)
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

struct DropdownSelector: View {
    @State private var shouldShowDropdown = false
    @State private var selectedOption: DropdownOption? = nil
    var placeholder: String
    var options: [DropdownOption]
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?
    private let buttonHeight: CGFloat = 45

    var body: some View {
        Button(action: {
            self.shouldShowDropdown.toggle()
        }) {
            HStack {
                Text(selectedOption == nil ? placeholder : selectedOption!.value)
                    .font(.system(size: 17))
                    .foregroundColor(selectedOption == nil ? Color.gray: Color.black)

                Spacer()

                Image(systemName: self.shouldShowDropdown ? "chevron.up" : "chevron.down")
                    .foregroundColor(Color.gray)
            }
        }
        .padding(.horizontal, 8)
        .cornerRadius(5)
        .frame(width: .infinity, height: self.buttonHeight)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 1)
        )
        .overlay(
            VStack {
                if self.shouldShowDropdown {
                    Spacer(minLength: buttonHeight + 10)
                    Dropdown(options: self.options, onOptionSelected: { option in
                        shouldShowDropdown = false
                        selectedOption = option
                        self.onOptionSelected?(option)
                    })
                }
            }, alignment: .topLeading
        )
        .background(
            RoundedRectangle(cornerRadius: 5).fill(Color.white)
        )
    }
}

struct DropdownSelector_Previews: PreviewProvider {

    static var uniqueKey: String {
        UUID().uuidString
    }

    static let options: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: "1"),
        DropdownOption(key: uniqueKey, value: "Monday"),
        DropdownOption(key: uniqueKey, value: "Tuesday"),
        DropdownOption(key: uniqueKey, value: "Wednesday"),
        DropdownOption(key: uniqueKey, value: "Thursday"),
        DropdownOption(key: uniqueKey, value: "Friday"),
        DropdownOption(key: uniqueKey, value: "Saturday")
    ]


    static var previews: some View {
        VStack(spacing: 20) {
            DropdownSelector(
                placeholder: "Day of the week",
                options: options,
                onOptionSelected: { option in
                    print(option)
                })
            .padding(.horizontal)
            .zIndex(1)
        }
    }
}

protocol ItemStoring {
    associatedtype DataType

    var items: [DataType] {
        get set
    }

    mutating func add(item: DataType)
}

extension ItemStoring {

    mutating func add(item: DataType) {
        items.append(item)
    }
}

struct MyDatabase: ItemStoring {
    var items: [String]
}
