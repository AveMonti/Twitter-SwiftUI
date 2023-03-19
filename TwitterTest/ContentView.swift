//
//  ContentView.swift
//  TwitterTest
//
//  Created by Mateusz Chojnacki on 22/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    @State private var selectedTab = BottomBarItem.home
    
    @State private var isMenuOpen = false
    var body: some View {
        
        NavigationView {
            ZStack {
                /// Start - CONTENT TWITTER WALL AND BOTTOM VIEW
                VStack {
                    if selectedTab == .home {
                        TweetViewContent()
                            .environmentObject(viewModel)
                    } else if selectedTab == .notifications {
                        Text("Search")
                    } else if selectedTab == .search {
                        Text("Notifications")
                    } else if selectedTab == .profile {
                        Text("profile")
                    }
                    HStack {
                        Spacer()
                        
                        BottomBar(selectedTab: $selectedTab)
                            .padding()
                    }
                }
                .onAppear {
                    viewModel.fetchContent()
                }
                /// End - CONTENT TWITTER WALL AND BOTTOM VIEW
                /// Start -- side Menu
                if isMenuOpen {
                    SideMenu(isMenuOpen: $isMenuOpen)
                        .transition(.move(edge: .leading))
                }
                /// Start -- side Menu
            }
            .navigationBarTitle("Twitter", displayMode: .inline)
            .navigationBarItems(leading:
                                    Button(action: {
                withAnimation {
                    self.isMenuOpen.toggle()
                }
            }) {
                Image(systemName: "bird.fill")
            }, trailing: Image(systemName: "magnifyingglass"))
            .navigationBarHidden(false)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
