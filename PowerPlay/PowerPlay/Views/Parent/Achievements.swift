//
//  Achievements.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/12/23.
//

import SwiftUI

struct Achievements: View {
    
    var model = TestModel()
    
    private var adaptiveColumns = [GridItem(.adaptive(minimum: 100))]
    @State var selectedDate: Date = Date()
    @ObservedObject var achievementsData = AchievementsData()
    
    func getCurrentMonthAndYear() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        let monthAndYear = dateFormatter.string(from: currentDate)
        return monthAndYear
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                    Text("Achievements")
                    .fontDesign(.rounded)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .padding(.horizontal)
                    HStack{
                        Spacer()
                        VStack{
                            Text("6 days")
                                .font(.title2)
                                .bold()
                                .fontDesign(.rounded)
                            Text("current streak")
                                .bold()
                                .font(.subheadline)
                                .fontDesign(.rounded)
                        }
                        .padding(.leading)
                        
                        Image(systemName: "flame.circle.fill")
                            .resizable()
                            .scaleEffect(0.7)
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(Color("lightningYellow"))
                        
                        VStack{
                            Text("10 days")
                                .font(.title2)
                                .bold()
                                .fontDesign(.rounded)
                            Text("longest streak")
                                .bold()
                                .font(.subheadline)
                                .fontDesign(.rounded)
                        }
                        .padding(.trailing)
                        Spacer()
                        
                    }
                    
                    ZStack{
                        Spacer()
                        RoundedRectangle(cornerRadius: 15)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .ignoresSafeArea(.all)
                            .foregroundColor(Color("darkModeBackground"))
                        VStack{
                            Text(getCurrentMonthAndYear())
                                .font(.title2)
                                .bold()
                                .padding([.horizontal, .top])
                            
//                            VStack() {
//                                DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
//                                    .padding(.horizontal)
//                                    .datePickerStyle(.graphical)
//
//                            }
//                            .padding()
                            CalendarView()

                            
                            
                            Text("Badges Earned")
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title3)
                                .fontDesign(.rounded)
                            

                            LazyVGrid(columns: adaptiveColumns, spacing: 20){
                                ForEach(model.myParks.last?.badges?.sorted() ?? [""], id: \.self){image in
                                    ZStack {
                                        Image(image)
                                            .scaleEffect(0.065)
                                            .foregroundColor(Color.white)
                                            .frame(width: 300, height: 100)
                                    }
                                }
                            }.onAppear{
                                achievementsData.updateBadges()
                            }
                            VStack{
                                Spacer()
                                Spacer()
                                Spacer()
                            }
                            
                        }
                    }
                    
                }
                .background(Color("navyBlue"))
        }.foregroundColor(Color.white)
            
        
    }
    
}

struct Achievements_Previews: PreviewProvider {
    static var previews: some View {
        Achievements()
    }
}
