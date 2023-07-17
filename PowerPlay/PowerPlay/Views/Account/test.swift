import SwiftUI
import AuthenticationServices

struct test: View {
    @ObservedObject var userData = UserData()
    
    var body: some View {
        VStack {
            Text(userData.firstName)
            Text("1031")
        }
    }
}


