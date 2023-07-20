import SwiftUI

struct test: View {
    @State private var firstName: String = ""
    @State private var lastName: String = "" // Add a state variable for lastName
    var model = TestModel()

    var body: some View {
        VStack {
            TextField("First Name", text: $firstName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Last Name", text: $lastName) // Add TextField for lastName
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            HStack {
                Button("Save") {
                    model.myUser?.firstName = firstName
                    model.myUser?.lastName = lastName // Save lastName to the Core Data model
                    model.save()
                    print("First \(firstName)")
                    print("Last \(lastName)")
                    print("Model First \(model.myUser?.firstName)")
                    print("Model Last \(model.myUser?.lastName)")
                }
                .foregroundColor(.red)

            }
            
            if !(model.myUser?.firstName?.isEmpty ?? false) {
                Text("yay")
                    .font(.headline)
                    .foregroundColor(.green)
            }
            

        }
        .padding()
        .onAppear {
            model.load()

            DispatchQueue.main.async {
                firstName = model.myUser?.firstName ?? ""
                lastName = model.myUser?.lastName ?? "" // Load lastName from Core Data model
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
