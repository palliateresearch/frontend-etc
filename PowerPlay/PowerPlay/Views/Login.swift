
import SwiftUI

struct Login: View {
    
    @State var isLogin = false
    
    var body: some View {
        VStack {
            Button(action: {
                isLogin = true
            }) {
                Text("Login Placeholder")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(10)
            }
        }
        .fullScreenCover(isPresented: $isLogin) {
            ContentView()
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
