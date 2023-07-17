import SwiftUI

struct FindPark: View {
    let names = ["Fremont Park", "Calabazas Park", "Planet Fitness", "Bellarmin College Prepatory Playground Site", "Nishka's Playground","Valerie's Playground", "Vaughn's Playground", "Eddie's Playground", "Aadit's Playground"]

    @State private var searchText = ""
    @State private var showGuestHome = false
    @EnvironmentObject var guestData: GuestData
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode> // Add the presentationMode property

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
                                        guestData.park = name
                                        showGuestHome = true
                                    }) {
                                        Text(name)
                                            .font(.system(size: width * 0.05, weight: .bold))
                                            .foregroundColor(.white)
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
                }
                .fullScreenCover(isPresented: $showGuestHome) {
                    GuestContentView()
                }
            }
        }
    }

    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}
