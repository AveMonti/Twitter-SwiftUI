//
//  RettwetButton.swift
//  TwitterTest
//
//  Created by Mateusz Chojnacki on 23/02/2023.
//

import SwiftUI

struct RettwetButton: View {
    @State var isSet: Bool
    @State var counter: Int
    
    var body: some View {
        Button(action: {
            print("RettwetButton tapped")
            if isSet == false {
                counter += 1
                isSet = true
            } else {
                counter -= 1
                isSet = false
            }
        }) {
            HStack {
                Image(systemName: "arrow.2.squarepath")
                    .font(.headline)
                    .foregroundColor(isSet ? .blue : .gray)
                    
                Text("\(counter)")
                    .font(.subheadline)
            }
        }
    }
}

struct RettwetButton_Previews: PreviewProvider {
    static var previews: some View {
        RettwetButton(isSet: true,counter: 3)
    }
}
