import SwiftUI
import AuthenticationServices

struct test: View {
    @ObservedObject var userData = UserViewData()
    
    var body: some View {
        VStack {
            Button (action: {
                print("userData: \(userData.username)")
            }) {
                Text("hello world")
            
            }
        }
    }
    
}


