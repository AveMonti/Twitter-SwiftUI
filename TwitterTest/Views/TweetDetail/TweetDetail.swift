//
//  TweetDetail.swift
//  TwitterTest
//
//  Created by Mateusz Chojnacki on 23/02/2023.
//

import SwiftUI

struct TweetDetail: View {
    
    @EnvironmentObject private var modelData: ContentViewModel
    @State var index: Int
    
    var body: some View {
        List {
            WallElement(index: index)
                .environmentObject(modelData)
            
            ForEach(Array(modelData.content[index].comments.enumerated()), id: \.element) { (index, tweet) in
                
                
                WallElement(index: 0)
                    .environmentObject(modelData)
            }
        }
        .navigationBarHidden(false)
    }
}

struct TweetDetail_Previews: PreviewProvider {
    
    static let modelData = ModelData()
    
    static var previews: some View {
        TweetDetail(index: 0)
            .environmentObject(modelData)
    }
}
