//
//  CircleImage.swift
//  TwitterTest
//
//  Created by Mateusz Chojnacki on 23/02/2023.
//
import SwiftUI

struct CircleImage: View {
    
    var image: String
    
    var body: some View {
        
        AsyncImage(url: URL(string: image)) { image in
            image
                .frame(width: 55.0,height: 55.0)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 4)
        } placeholder: {
            ProgressView()
        }.frame(width: 5.0,height: 5.0)
    }
    
}


struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: "https://picsum.photos/200/300")
    }
}

