//
//  ExportFilesBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 05/04/23.
//

import SwiftUI
import UniformTypeIdentifiers

struct ExportFilesBootcamp: View {
    
    @EnvironmentObject var appContext: AppContext
    let document = TextFile(initialText: "ExportFilesExample")

    var body: some View {
        VStack {
            Button(action: {
                appContext.fileSaveDialogShown.toggle()
            }, label: {
                Text("Button")
            })
        }
        .frame(width: 200, height: 200)
    }
}

struct ExportFilesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ExportFilesBootcamp()
    }
}

struct ImageDocument: FileDocument {
    static var readableContentTypes: [UTType] { [.jpeg, .png, .tiff] }
    
    var image: UIImage
    
    init(image: UIImage?) {
        self.image = image ?? UIImage()
    }
    
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let image = UIImage(data: data)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        self.image = image
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        // You can replace tiff representation with what you want to export
        return FileWrapper(regularFileWithContents: image.pngData()!)
    }
}

struct TextFile: FileDocument {
    // tell the system we support only plain text
    static var readableContentTypes = [UTType.plainText]

    // by default our document is empty
    var text = ""

    // a simple initializer that creates new, empty documents
    init(initialText: String = "") {
        text = initialText
    }

    // this initializer loads data that has been saved previously
    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            text = String(decoding: data, as: UTF8.self)
        }
    }

    // this will be called when the system wants to write our data to disk
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = Data(text.utf8)
        return FileWrapper(regularFileWithContents: data)
    }
}
