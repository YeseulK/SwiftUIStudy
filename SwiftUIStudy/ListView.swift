//
//  ListView.swift
//  SwiftUIStudy
//
//  Created by Yeseul Kim on 1/25/22.
//

import SwiftUI

struct CustomCell: Identifiable {
    var id = UUID() // Identifiable을 상속 받기 위해서는 고유 id 값이 필요
    var imageUrl: String
    var title: String
    var description: String
    var content: String
}

struct CustomCellRow: View {
    var cell: CustomCell
    @ObservedObject var imageLoader = ImageLoaderService()
    @State var image: UIImage = UIImage()
    
    var body: some View {
        HStack {
            Image(uiImage: image)
                .resizable()
                .frame(width:100, height:100)
                .onReceive(imageLoader.$image) { image in
                    self.image = image
                }
                .onAppear {
                    if !cell.imageUrl.isEmpty {
                        imageLoader.loadImage(for: cell.imageUrl)
                    } else {
                        image = UIImage(named: "sample2")!
                    }
                }
            VStack(alignment: .leading) {
                Text(cell.title).style(.primary)
                if cell.description.isEmpty {
                    Text(cell.content).style(.secondary)
                } else {
                    Text(cell.description).style(.secondary)
                }
            }
        }
    }
}

struct ListView: View {
    let arr = [
        CustomCell(imageUrl: "https://www.apple.com/ac/structured-data/images/knowledge_graph_logo.png?202201062232", title: "Apple", description: "맛있는 사과", content: "사과"),
        CustomCell(imageUrl: "https://sc04.alicdn.com/kf/Ue7f73a9978454adfbdaa17428993748dF.jpg", title: "Orange", description: "", content: sampleText),
        CustomCell(imageUrl: "", title: "Kiwi", description: "나는 키위", content: ""),
        CustomCell(imageUrl: "https://www.collinsdictionary.com/images/thumb/watermelon_222700726_250.jpg", title: "Water Melon", description: "수박 박수", content: ""),
        CustomCell(imageUrl: "", title: "Peach", description: "복숭아", content: sampleText),
        CustomCell(imageUrl: "", title: "Pear", description: "배", content: ""),
        CustomCell(imageUrl: "", title: "Apple", description: "맛없는 사과", content: "")
    ]
    
    var body: some View {
        NavigationView {
            List(arr) { cell in
                NavigationLink(destination: DetailView(cell: cell)) {
                    CustomCellRow(cell: cell)
                }
            }.navigationTitle("과일나라")
        }
    }
}

struct DetailView: View {
    var cell: CustomCell
    @ObservedObject var imageLoader = ImageLoaderService()
    @State var image: UIImage = UIImage()
    
    var body: some View {
        VStack() {
            Image(uiImage: image)
                .resizable()
                .frame(width:200, height:200)
                .onReceive(imageLoader.$image) { image in
                    self.image = image
                }
                .onAppear {
                    if !cell.imageUrl.isEmpty {
                        imageLoader.loadImage(for: cell.imageUrl)
                    } else {
                        image = UIImage(named: "sample2")!
                    }
                }
            Text(cell.description).style(.primary)
            Text(cell.content).padding() // TODO: 스크롤뷰?
        }
        .navigationBarTitle(cell.title)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
