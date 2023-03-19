//
//  ShareBar .swift
//  TwitterTest
//
//  Created by Mateusz Chojnacki on 23/02/2023.
//

import SwiftUI

struct ShareBar: View {
    
    @EnvironmentObject private var modelData: ContentViewModel
    @Binding var index: Int
    
    var body: some View {
        HStack {
            
            ZStack {
                MessageButton(isSet: false, counter: modelData.content[index].comments.count)
                NavigationLink(destination: TweetDetail(index: index).environmentObject(modelData)) {
                    EmptyView()
                }
                .opacity(0.0)
                .frame(width: 0, height: 0)
            }
            Spacer()
            ZStack {
                HeartButton(isSet: false, counter: modelData.content[index].likes)
            }
            Spacer()
            ZStack {
                RettwetButton(isSet: false, counter: modelData.content[index].retweets)
            }
            Spacer()
            ShareButton(isSet: false)
        }
    }
}

struct ShareBar_Previews: PreviewProvider {
    
    static let modelData = ModelData()
    
    static var previews: some View {
        ShareBar(index: .constant(0))
            .environmentObject(modelData)
    }
}
