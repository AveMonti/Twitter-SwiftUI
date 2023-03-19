//
//  TweetView.swift
//  TwitterTest
//
//  Created by Mateusz Chojnacki on 22/02/2023.
//

import SwiftUI

struct WallElement: View {
    
    @EnvironmentObject private var modelData: ContentViewModel
    var index: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                CircleImage(image: modelData.content[index].avatarUrl)
                    .padding(.init(top: 30, leading: 20, bottom: 30, trailing: 40))
                
                Text("\(modelData.content[index].username) - \(modelData.content[index].dateContent, formatter: dateFormatter)")
                    .font(.headline)
            }
            
            Text(modelData.content[index].text)
                .font(.body)
            
            if let unwrappedString = modelData.content[index].imageUrl {
                if !unwrappedString.isEmpty {
                    AsyncImage(url: URL(string: modelData.content[index].imageUrl!)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
                        
            ShareBar(index: .constant(index))
                .environmentObject(modelData)
                .padding()
        }
    }
}

struct TweetViewContent: View {
    @EnvironmentObject private var modelData: ContentViewModel
    
    var body: some View {
        Wall()
            .environmentObject(modelData)
    }
}

struct TweetViewContent_Previews: PreviewProvider {
    
    static let modelData = ModelData()
    
    static var previews: some View {
        TweetViewContent()
            .environmentObject(modelData)
    }
}
