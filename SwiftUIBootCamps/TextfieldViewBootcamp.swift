//
//  TextfieldViewBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 13/03/24.
//

import SwiftUI

//https://fatbobman.medium.com/advanced-swiftui-textfield-events-focus-keyboard-c99bc9f57c91
struct TextfieldViewBootcamp: View {

    @State var name = ""

    var body: some View{
        List{
            TextField("name:",text:$name, onEditingChanged: getFocus)
        }
    }

    func getFocus(focused:Bool) {
        print("get focus:\(focused ? "true" : "false")")
    }
}

#Preview {
    TextfieldViewBootcamp()
}


struct OnCommitDemo:View{
    @State var name = ""
    var body: some View{
        List{
            TextField("name:",text: $name,onCommit: {
                print("commit")
            })
        }
    }
}

#Preview {
    OnCommitDemo()
}

struct OnFocusDemo:View{
    @FocusState var isNameFocused:Bool
    @State var name = ""
    var body: some View{
        List{
            TextField("name:",text:$name)
                .focused($isNameFocused)
        }
        .onChange(of:isNameFocused){ value in
            print(value)
        }
    }
}
#Preview {
    OnFocusDemo()
}

struct MultipleOnFocusDemo:View{
    @FocusState var isNameFocused:Bool
    @FocusState var isPasswordFocused:Bool
    @State var name = ""
    @State var password = ""
    var body: some View{
        List{
            TextField("name:",text:$name)
                .focused($isNameFocused)
            SecureField("password:",text:$password)
                .focused($isPasswordFocused)
        }
        .onChange(of:isNameFocused){ value in
            print(value)
        }
        .onChange(of:isPasswordFocused){ value in
            print(value)
        }
    }
}
#Preview {
    MultipleOnFocusDemo()
}
struct SupportHashableOnFocusDemo:View{
    @FocusState var focus:FocusedField?
    @State var name = ""
    @State var password = ""
    var body: some View{
        List{
            TextField("name:",text:$name)
                .focused($focus, equals: .name)
            SecureField("password:",text:$password)
                .focused($focus,equals: .password)
        }
        .onChange(of: focus, perform: {print($0)})
    }

    enum FocusedField:Hashable{
        case name,password
    }
}
#Preview {
    SupportHashableOnFocusDemo()
}

struct SwitchingOnFocusDemo: View {
    @FocusState var focus:FocusedField?
    @State var name = ""
    @State var email = ""
    @State var phoneNumber = ""
    var body: some View{
        List {
            TextField("Name:", text: $name)
                .focused($focus, equals: .name)
            TextField("Email:", text: $email)
                .focused($focus, equals: .email)
            TextField("PhoneNumber:", text: $phoneNumber)
                .focused($focus, equals: .phone)
        }
        .onSubmit {
            switch focus {
                case .name:
                    focus = .email
                case .email:
                    focus = .phone
                case .phone:
                    if !name.isEmpty, !email.isEmpty, !phoneNumber.isEmpty {
                        submit()
                    }
                default:
                    break
            }
        }
    }

    private func submit(){
        // submit all infos
        print("submit")
    }

    enum FocusedField:Hashable{
        case name,email,phone
    }
}
#Preview {
    SwitchingOnFocusDemo()
}
