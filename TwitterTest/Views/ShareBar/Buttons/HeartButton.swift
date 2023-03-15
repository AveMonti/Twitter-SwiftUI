//
//  HeartButton.swift
//  TwitterTest
//
//  Created by Mateusz Chojnacki on 23/02/2023.
//

import SwiftUI

struct HeartButton: View {
    @State var isSet: Bool
    @State var counter: Int
    
    var body: some View {
        Button(action: {
            print("HeartButton tapped")
            if isSet == false {
                counter += 1
                isSet = true
            } else {
                counter -= 1
                isSet = false
            }
        }) {
            HStack {
                Image(systemName: "heart")
                    .font(.headline)
                    .foregroundColor(isSet ? .pink : .gray)
                    
                Text("\(counter)")
                    .font(.subheadline)
            }
        }
    }
}

struct HeartButton_Previews: PreviewProvider {
    static var previews: some View {
        HeartButton(isSet: true,counter: 3)
    }
}
