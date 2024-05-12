//
//  AnyLayoutBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 12/02/24.
//

import SwiftUI

struct AnyLayoutBootcamp: View {

    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass

    @State private var orientation = UIDeviceOrientation.unknown


    var body: some View {

        let layout: AnyLayout = orientation == UIDeviceOrientation.portrait ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())

//        VStack(spacing: 12) {
//            Text("Horizontal: \(horizontalSizeClass.debugDescription)")
//            Text("Vertical: \(verticalSizeClass.debugDescription)")
//
////            if horizontalSizeClass == .compact {
////                VStack {
////                    Text("Alpha")
////                    Text("Beta")
////                    Text("Gamma")
////                }
////            } else {
////                HStack {
////                    Text("Alpha")
////                    Text("Beta")
////                    Text("Gamma")
////                }
////            }
//
//            let layout: AnyLayout = horizontalSizeClass == .compact ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
//
//            layout {
//                Text("Alpha")
//                Text("Beta")
//                Text("Gamma")
//            }
//        }

        layout {
            Text("A")
            Text("B")
            Text("C")
            Text("D")
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}

#Preview {
    AnyLayoutBootcamp()
}


struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}
// A View wrapper to make the modifier easier to use
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

