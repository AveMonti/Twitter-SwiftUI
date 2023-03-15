//
//  TweetView.swift
//  TwitterTest
//
//  Created by Mateusz Chojnacki on 22/02/2023.
//

import SwiftUI

struct WallElement: View {
    
    @EnvironmentObject private var modelData: ModelData
    var index: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                CircleImage(image: modelData.tweetMockContent[index].avatarUrl)
                    .padding(.init(top: 30, leading: 20, bottom: 30, trailing: 40))
                
                Text("\(modelData.tweetMockContent[index].username) - \(modelData.tweetMockContent[index].dateContent, formatter: dateFormatter)")
                    .font(.headline)
            }
            
            Text(modelData.tweetMockContent[index].text)
                .font(.body)
            
            if let unwrappedString = modelData.tweetMockContent[index].imageUrl {
                if !unwrappedString.isEmpty {
                    AsyncImage(url: URL(string: modelData.tweetMockContent[index].imageUrl!)) { image in
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
    @EnvironmentObject private var modelData: ModelData
    
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
