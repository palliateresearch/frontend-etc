import SwiftUI


struct ContentView: View {
    @ObservedObject var userData = UserViewData()
    @State private var tabColor: Color!
    
    @State private var park: String = ""

    var body: some View {
        VStack {
            TabView {
                Home(userData: userData) // Pass the park binding to the Home view
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(0)
                
                Achievements()
                    .tabItem {
                        Label("Achievements", systemImage: "trophy")
                    }
                
                Discover()
                    .tabItem {
                        Label("Discover", systemImage: "books.vertical")
                    }
                
                Settings(userData: userData)
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
            .tint(Color("lightningYellow"))
        }
        
        .preferredColorScheme(.dark)
        .padding()
        .foregroundColor(.white)
        .background(Color.black.opacity(0.5))
        .edgesIgnoringSafeArea(.bottom)
        
    }
}
