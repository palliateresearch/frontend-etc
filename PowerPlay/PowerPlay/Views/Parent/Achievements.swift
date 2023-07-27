//
//  Achievements.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/12/23.
//

import SwiftUI

struct Achievements: View {
    
    @EnvironmentObject var pv: PV
    @ObservedObject var userData: UserViewData
    var model = TestModel()
    
    let c: calculateAchievements
    @State var x: Int = 0
    @State var y: Int = 0
    @State var tempWattHrs: [String] = []
    
    var adaptiveColumns = [GridItem(.adaptive(minimum: 100))]
    @State var selectedDate: Date = Date()
    @ObservedObject var achievementsData = AchievementsData()
    
    init(userData: UserViewData) {
        self.userData = userData
        self.c = calculateAchievements()
        self.x = c.calcBadgeStreaks()
        self.y = c.calcBadgeVisits()
    }
    
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
                VStack {
                    HStack {
                       
                        Text("\(pv.selectedChild)")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .bold()
                            .padding(.trailing, 20)
                    }
                    HStack {
                        Text("Achievements")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.largeTitle)
                            .bold()
                            .padding()
                            .padding(.horizontal)
                        Spacer()
                        
                
                    }
                    
                }
               
                    HStack{
                        Spacer()
                        VStack{
                            Text("\(y) days")
                                .font(.title2)
                                .bold()
                                .fontDesign(.rounded)
                            Text("visit streak")
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
                            Text("\(x) days")
                                .font(.title2)
                                .bold()
                                .fontDesign(.rounded)
                            Text("current streak")
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
                    
                            CalendarView()

                            
                            
                            Text("Badges Earned")
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title3)
                                .fontDesign(.rounded)
                            


                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 30)], spacing: 50) {
                                ForEach(model.myParks.last?.badges ?? tempWattHrs, id: \.self) { image in
                                    ZStack {
                                        Image(image)
                                            .resizable()
                                            .scaledToFill()
                                            .foregroundColor(Color.white)
                                            .frame(width: 100, height: 100)
                                    }
                                    .frame(maxWidth: .infinity) // To make each cell occupy the same width and force 3 columns.
                                }
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
        .onAppear {
            if (pv.selectedChild == nil || pv.selectedChild == "") {
                for childName in pv.childrenNames.reversed() {
                    if !childName.isEmpty {
                        // Set the selectedChild to the first non-empty childName and break the loop
                        pv.selectedChild = childName
                        break
                    }
                }
            }
            print ("Index: \(pv.selectedOptionIndex)")
            print ("Array: \(pv.childrenNames)")
            // This block will be triggered when userData.jsonData is updated
            c.autoPopulateCalendar()
            var wattHrs: Float = userData.jsonData.totalEnergy
            c.calcBadgeWattHrs(wattHrs: wattHrs)
            if (wattHrs >= 500) {
                tempWattHrs.append("badgeWh3")
            }
            if (wattHrs >= 150) {
                tempWattHrs.append("badgeWh2")
            }
            if (wattHrs >= 50) {
                tempWattHrs.append("badgeWh1")
            }

            x = c.calcBadgeStreaks()
            y = c.calcBadgeVisits()
            
            if (x >= 15) {
                tempWattHrs.append("badgeStreak3")
            }
            if (x >= 10) {
                tempWattHrs.append("badgeStreak2")
            }
            if (x >= 5) {
                tempWattHrs.append("badgeStreak1")
            }
        }
            
        
    }
    
}

struct Achievements_Previews: PreviewProvider {
    static var previews: some View {
        Achievements(userData: UserViewData()).environmentObject(PV())
    }
}
