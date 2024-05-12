//
//  UIViewControllerRepresentableBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 18/04/23.
//

import SwiftUI

struct UIViewControllerRepresentableBootcamp: View {
    
    @State private var showScrenn: Bool = true
    
    var body: some View {
        VStack {
            Text("hi")
            
            Button {
                showScrenn = true
            } label: {
                Text("click here")
            }

            .sheet(isPresented: $showScrenn) {
                BasicUIViewControllerRepsentable(labelText: "New text here")
            }
        }
    }
}

struct UIViewControllerRepresentableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerRepresentableBootcamp()
    }
}

struct BasicUIViewControllerRepsentable: UIViewControllerRepresentable {
    
    let labelText: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = MyFirstViewController()
        vc.labelText = labelText
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        uiViewController.view.backgroundColor = .red
    }
}

class MyFirstViewController: UIViewController {
    
    var labelText = "Temp Value"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        let label = UILabel()
        label.text = labelText
        label.textColor = UIColor.white
        
        view.addSubview(label)
        label.frame = view.frame
    }
}
