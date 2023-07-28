import SwiftUI
import CoreData

struct FindParkGuest: View {
    var model = TestModel()
    var p = parkList()

    @State private var searchText = ""
    @State private var showGuestHome = false
    @State private var showHome = false
    @State private var selectedParks: Set<String> = []
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        NavigationView {
            GeometryReader { geo in
                let width = geo.size.width
                VStack {
                    Text("Find Your Park")
                        .font(.system(size: width * 0.09, weight: .bold))
                        .frame(width: width * 0.8)
                        .padding(.top, 50)

                   
                    
                    NavigationStack {
                        VStack {
                            List {
                                ForEach(searchResults, id: \.self) { name in
                                    Button(action: {
                                        
                                      
                                        

                                        if selectedParks.contains(name) {
                                            selectedParks.remove(name)
                                            
                                            
                                        } else {
                                            let newPark = model.createPark()
                                            newPark.parkName = String(name)
                                            model.save()
                                            selectedParks.insert(name)
                                        }
                                    }) {
                                        Text(name)
                                            .font(.system(size: width * 0.05, weight: .bold))
                                            .foregroundColor(selectedParks.contains(name) ? .green : .white)
                                            .padding(.top, 25)
                                            .padding(.bottom, 25)
                                    }
                                }
                            }
                        }
                    }
                    .navigationBarBackButtonHidden(true)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss() // Dismiss the current view
                            }) {
                                Image(systemName: "chevron.left")
                                    .font(.title)
                            }
                        }
                    }
                    .searchable(text: $searchText)
                    .preferredColorScheme(.dark)
                    
                    // Submit Button
                    Button("Submit", action: {
                        model.save()
                        showHome = true
                    })
                    .font(.system(size: width * 0.06, weight: .bold))
                    .foregroundColor(Color.black)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 40)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.top, 20)
                }
                .fullScreenCover(isPresented: $showGuestHome) {
                    GuestHome()
                }

                .fullScreenCover(isPresented: $showHome) {
                    
                    childHomeParkGuest(userData: UserViewData())
                   
                }
            }
        }
        .onAppear {
            model.load()
            
            model.save()
        }
    }

    var searchResults: [String] {
        if searchText.isEmpty {
            return p.names
        } else {
            return p.names.filter { $0.contains(searchText) }
        }
    }
}

struct FindParkGuest_Previews: PreviewProvider {
    static var previews: some View {
        let pv = PV() // Create a mock instance of PV

        return FindPark()
            .environmentObject(pv) // Inject the mock instance as an environment object
    }
}
