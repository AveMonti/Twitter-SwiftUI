//
//  TwitterTestApp.swift
//  TwitterTest
//
//  Created by Mateusz Chojnacki on 22/02/2023.
//

import SwiftUI

@main
struct TwitterTestApp: App {
    @StateObject var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
