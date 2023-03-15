//
//  MessageButton.swift
//  TwitterTest
//
//  Created by Mateusz Chojnacki on 23/02/2023.
//

import SwiftUI

struct MessageButton: View {
    
    @State var isSet: Bool
    @State var counter: Int
    
    var body: some View {
        Button(action: {
            print("MessageButton tapped")
            if isSet == false {
                isSet = true
            } else {
                isSet = false
            }
        }) {
            HStack {
                Image(systemName: "message")
                    .font(.headline)
                    .foregroundColor(isSet ? .blue : .gray)
                Text("\(counter)")
                    .font(.subheadline)
            }
        }
    }
}

struct MessageButton_Previews: PreviewProvider {
    static var previews: some View {
        MessageButton(isSet: true ,counter: 3)
    }
}
