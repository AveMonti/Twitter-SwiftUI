//
//  BottomBar.swift
//  TwitterTest
//
//  Created by Mateusz Chojnacki on 22/02/2023.
//

import SwiftUI

enum BottomBarItem: Int {
    case home, search, notifications, profile
}

struct HomeView: View {
    
    var body: some View {
        Text("HomeView")
    }
}

struct SearchView: View {
    
    var body: some View {
        Text("SearchView")
    }
}

struct ProfileView: View {
    
    var body: some View {
        Text("ProfileView")
    }
}

struct BottomBar: View {
    @Binding var selectedTab: BottomBarItem

    var body: some View {
        HStack {
            Button(action: {
                self.selectedTab = .home
            }) {
                VStack {
                    Image(systemName: "house.fill")
                        .font(.system(size: 20, weight: .bold))

                    Text("Home")
                        .font(.system(size: 11))
                }
                .padding(.vertical, 6)
                .foregroundColor(selectedTab == .home ? .blue : .gray)
            }

            Spacer(minLength: 20)

            Button(action: {
                self.selectedTab = .notifications
            }) {
                VStack {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 20, weight: .bold))

                    Text("Search")
                        .font(.system(size: 11))
                }
                .padding(.vertical, 6)
                .foregroundColor(selectedTab == .notifications ? .blue : .gray)
            }

            Spacer(minLength: 20)

            Button(action: {
                self.selectedTab = .search
            }) {
                VStack {
                    Image(systemName: "bell.fill")
                        .font(.system(size: 20, weight: .bold))

                    Text("Notifications")
                        .font(.system(size: 11))
                }
                .padding(.vertical, 6)
                .foregroundColor(selectedTab == .search ? .blue : .gray)
            }

            Spacer(minLength: 20)

            Button(action: {
                self.selectedTab = .profile
            }) {
                VStack {
                    Image(systemName: "envelope.fill")
                        .font(.system(size: 20, weight: .bold))

                    Text("Messages")
                        .font(.system(size: 11))
                }
                .padding(.vertical, 6)
                .foregroundColor(selectedTab == .profile ? .blue : .gray)
            }
        }
        .background(Color.white)
        .clipShape(Capsule())
    }
}

struct BottomBar_Previews: PreviewProvider {
    
    static var someValue: Binding<BottomBarItem> = .constant(.home)
    static var previews: some View {
        BottomBar(selectedTab: someValue)
    }
}
