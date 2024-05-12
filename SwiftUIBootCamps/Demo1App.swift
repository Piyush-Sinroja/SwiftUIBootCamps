//
//  Demo1App.swift
//  Demo1
//
//  Created by Piyush Sinroja on 19/10/22.
//

import SwiftUI

@main
struct Demo1App: App {
    
    @StateObject var appContext = AppContext()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appdelegate
    
    @StateObject private var container = Container.shared

    var body: some Scene {
        WindowGroup {
          //    ContentView()
          //  ImagePicker()
            
          //  ScrollViewBootcamp()
          //  LazyStackBootcamp()
          //  AppStorageBootcamp()
          //  ImproveListBootcamp()
          //  ViewModelBootcamp()
          //  FocusStateBootcamp()
            ExpandingListBootcamp()
          //    TaskGroupBootcamp()
          //  SearchableBootcamp()
           // ButtonBootcamp()
        //    SingletonWithEnvironment()
            //    .environmentObject(container)
        }
    }
    
    func loadExportFiles() {

    }
}
class AppContext: ObservableObject {
    @Published var fileSaveDialogShown = false
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Finished launching")
        return true
    }
}
