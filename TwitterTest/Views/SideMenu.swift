//
//  SideMenu.swift
//  TwitterTest
//
//  Created by Mateusz Chojnacki on 22/02/2023.
//

import SwiftUI

struct SideMenu: View {
    
    @Binding var isMenuOpen: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                NavigationLink(destination: HomeView()) {
                    Text("Home")
                }

                NavigationLink(destination: SearchView()) {
                    Text("Search")
                }

                NavigationLink(destination: ProfileView()) {
                    Text("Profile")
                }

                NavigationLink(destination: HomeView()) {
                    Text("Settings")
                }
            }
            .listStyle(SidebarListStyle())

            Spacer()

            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)

                Text("John Doe")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
        }
        .frame(width: 250)
        .background(Color.white)
        .offset(x: isMenuOpen ? -90 : -250) // przesunięcie menu o -250px poza ekran
        .animation(.easeInOut(duration: 1.0)) // animacja easeInOut
        
    }
}

struct ContentSideMenu: View {
    @State private var isMenuOpen = false

    var body: some View {
        NavigationView {
            ZStack {
                // Main view content here
                // ...
                Text("TEST")
                if isMenuOpen {
                    SideMenu(isMenuOpen: $isMenuOpen)
                        .transition(.move(edge: .leading))
                }
            }
            .navigationBarItems(leading: Button(action: {
                withAnimation {
                    self.isMenuOpen.toggle()
                }
            }) {
                Image(systemName: "line.horizontal.3")
            })
        }
    }
}

struct ContentSideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentSideMenu()
    }
}
