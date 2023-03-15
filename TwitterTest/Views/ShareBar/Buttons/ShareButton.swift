//
//  ShareButton.swift
//  TwitterTest
//
//  Created by Mateusz Chojnacki on 23/02/2023.
//

import SwiftUI

struct ShareButton: View {
    @State var isSet: Bool
    
    var body: some View {
        Button(action: {
            print("RettwetButton tapped")
            if isSet == false {
                isSet = true
            } else {
                isSet = false
            }
        }) {
            HStack {
                Image(systemName: "square.and.arrow.up")
                    .font(.headline)
                    .foregroundColor(isSet ? .blue : .gray)
            }
        }
    }
}

struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareButton(isSet: true)
    }
}
