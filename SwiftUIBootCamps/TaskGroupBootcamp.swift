//
//  TaskGroupBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 12/02/24.
//

import SwiftUI

class TaskGroupBotcampDataManager {
    func fetchImageWithAsyncLet() async throws -> [UIImage] {

        async let fetchImage1 = fetchImage(urlStr: "https://picsum.photos/200/300")
        async let fetchImage2 = fetchImage(urlStr: "https://picsum.photos/200/300")
        async let fetchImage3 = fetchImage(urlStr: "https://picsum.photos/200/300")
        async let fetchImage4 = fetchImage(urlStr: "https://picsum.photos/400/500")

        let (img1, img2, img3, img4) = try await (fetchImage1, fetchImage2, fetchImage3, fetchImage4)

        return [img1, img2, img3, img4]
    }

    func fetchImagesWithTaskGroup() async throws -> [UIImage] {
        var images: [UIImage] = []

        let urls = [
            "https://picsum.photos/200/300",
            "https://picsum.photos/200/400",
            "https://picsum.photos/200/500",
            "https://picsum.photos/200/600",
            "https://picsum.photos/200/800",
            "https://picsum.photos/200/700",
            "https://picsum.photos/500/500"
        ]

        try await withThrowingTaskGroup(of: UIImage?.self) { taskGroup in

            images.reserveCapacity(urls.count)

            for urlString in urls {
                taskGroup.addTask { [self] in
                    try? await fetchImage(urlStr: urlString)
                }
            }

            for try await result in taskGroup {
                if let image = result {
                    print("image", image)
                    images.append(image)
                }
            }
        }

        return images
    }

    private func fetchImage(urlStr: String) async throws -> UIImage {
        guard let url = URL(string: urlStr) else {
            throw URLError(.badURL)
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            if let image = UIImage(data: data) {
                return image
            } else {
                throw URLError(.badURL)
            }
        } catch {
            throw error
        }
    }
}

class TaskGroupViewModel: ObservableObject {

    @Published var images: [UIImage] = []
    let manager = TaskGroupBotcampDataManager()

    func getImages() async {
        if let images = try? await manager.fetchImageWithAsyncLet() {
            DispatchQueue.main.async {
                self.images = images
            }
        }

//        if let images = try? await manager.fetchImagesWithTaskGroup() {
//            DispatchQueue.main.async {
//                self.images = images
//            }
//        }
    }

}
struct TaskGroupBootcamp: View {

    @StateObject private var viewModel = TaskGroupViewModel()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    }
                }
            }
            .navigationTitle("Task Group")
//            .task {
//                await viewModel.getImages()
//            }

            .onAppear {
                Task {
                    await viewModel.getImages()
                }
            }
        }
    }
}

#Preview {
    TaskGroupBootcamp()
}
