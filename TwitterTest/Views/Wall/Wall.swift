//
//  Wall.swift
//  TwitterTest
//
//  Created by Mateusz Chojnacki on 24/02/2023.
//

import SwiftUI

struct Wall: View {
    
    @EnvironmentObject private var modelData: ModelData
    
    var body: some View {
        List {
            ForEach(Array(modelData.tweetMockContent.enumerated()), id: \.element) { (index, tweet) in
                WallElement(index: index)
                    .environmentObject(modelData)
            }
        }
        
    }
}

struct Wall_Previews: PreviewProvider {
    
    static let modelData = ModelData()
    
    static var previews: some View {
        Wall()
            .environmentObject(modelData)
    }
}
