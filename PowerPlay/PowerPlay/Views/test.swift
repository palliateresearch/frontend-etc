import SwiftUI
import ConfettiSwiftUI

struct test: View {
    @State private var firstName: String = ""
    @State private var lastName: String = "" // Add a state variable for lastName
    @State private var counter = 0
    var model = TestModel()

    var body: some View {
        VStack {
            HStack {
                Button("Test") {
                    // Assuming `model.myPark` is an optional property of some class or struct
                    if let parkName = model.myParks.last?.parkName {
                        model.myParks.last?.parkName = "lalala"
                        model.save()
                        print(parkName) // This will print "lalala" if the value is present
                    }
                }

                .foregroundColor(.red)
                .confettiCannon(counter: $counter)

            }
            
            if !(model.myUsers.last?.lastName?.isEmpty ?? false) {
                Text("yay")
                    .font(.headline)
                    .foregroundColor(.green)
            }
            

        }
        .padding()
        .onAppear {
            model.load()

            DispatchQueue.main.async {
                firstName = model.myUsers.last?.lastName ?? ""
                lastName = model.myUsers.last?.lastName ?? "" // Load lastName from Core Data model
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
