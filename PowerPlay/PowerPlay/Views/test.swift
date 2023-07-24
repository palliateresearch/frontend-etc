import SwiftUI
import ConfettiSwiftUI

struct test: View {
    var model = TestModel()

    var body: some View {
        VStack {
            Button(action: {
                print(model.myUser?.parks?[0])
            }, label: {
                
            }).frame(maxHeight: 75)
            
        }
        .padding()
        .onAppear {
            model.load()
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
