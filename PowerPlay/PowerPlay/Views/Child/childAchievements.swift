//
//  childAchievements.swift
//  PowerPlay
//
//  Created by Valerie Kwan on 7/20/23.
//

import SwiftUI

struct childAchievements: View {
    var adaptiveColumns = [GridItem(.adaptive(minimum: 100))]
    @ObservedObject var userData: UserViewData
    @StateObject var model = TestModel()
    
    var body: some View {
        NavigationStack{

            VStack{
                childCustomNavBar(navTitle: "Achievements", color: "darkBlue")
                    .background(Color("lightBlue"))
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color("darkBlue"))
                        .frame(width: .infinity, height: 100)
                    HStack{
                        VStack{
                            Text("6 days")
                                .foregroundColor(Color("lightningYellow"))
                                .font(.system(size: 30))
                                .fontWeight(.heavy)
                                .fontDesign(.rounded)
                            Text("visit streak")
                                .foregroundColor(Color.white)
                                .font(.title3)
                                .bold()
                                .fontDesign(.rounded)
                        }.padding(.leading)
                        Image(systemName: "flame.circle.fill")
                            .scaleEffect(3.5)
                            .frame(width: 80, height: 100, alignment: .center)
                             .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("aliceBlue"))
                        VStack{
                            Text("10 days")
                                .foregroundColor(Color("lightningYellow"))
                                .font(.system(size: 30))
                                .fontWeight(.heavy)
                                .fontDesign(.rounded)
                            Text("current streak")
                                .foregroundColor(Color.white)
                                .font(.title3)
                                .bold()
                                .fontDesign(.rounded)
                        }.padding(.trailing)
                        
                    }
                }.padding()
                    .background(Color("lightBlue"))
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("aliceBlue"))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    
                    VStack{
                        Text("Badges Earned")
                            .foregroundColor(Color("darkBlue"))
                            .font(.system(size: 30))
                            .fontWeight(.heavy)
                            .fontDesign(.rounded)
                            .padding()
                        ScrollView {
                            LazyVGrid(columns: adaptiveColumns, spacing: 30) {
                                ForEach(model.myParks.last?.badges ?? ["badgeStreak1"], id: \.self) { image in
                                    ZStack {
                                        Image(image)
                                            .scaleEffect(0.065)
                                            .foregroundColor(Color.white)
                                            .frame(width: 100, height: 100)
                                    }
                                }
                            }
                        }.padding(.top, 25)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                }
                .padding()
                .background(Color("lightBlue"))
                
            }
            .background(Color("lightBlue"))
            .onAppear{
                
                userData.loadData()
                
                let wattage = userData.jsonData.totalEnergy
            
                calcBadgeWattHrs(wattHrs: userData.jsonData.totalEnergy)
                calcBadgeStreaks()
                model.load()
                
            }
        }
    }
    func appendBadgeToLastPark(name: String)  {
      
        if let lastPark = model.myParks.last {
            lastPark.badges = lastPark.badges ?? []
            lastPark.badges?.append(name)
            model.save()
          

        }
      
    }
    func dayOfMonth() -> Int {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: date)
        let dayOfMonth = components.day ?? 1
        return dayOfMonth
    }
    func calcBadgeWattHrs(wattHrs: Float) {
        if (wattHrs >= 500) {
            appendBadgeToLastPark(name: "badgeWh3")
        }
        if (wattHrs >= 150) {
            appendBadgeToLastPark(name: "badgeWh2")
        }
        if (wattHrs >= 50) {
            appendBadgeToLastPark(name: "badgeWh1")
        }
    }
    func calcBadgeStreaks() {
        autoPopulateCalendar()
        var streak = 0
        
        let day = dayOfMonth()
        for dayIndex in stride(from: day, through: 1, by: -1) {
            if let lastPark = model.myParks.last,
               dayIndex <= lastPark.wattHrsPerDay?.count ?? 1 {
                let wattHrsForDay = lastPark.wattHrsPerDay?[dayIndex]
                print ("\n\n\n\n\(wattHrsForDay)")
                if (wattHrsForDay ?? 50 > 50) {
                    streak += 1
                } else {
                    print ("It broke")
                    break
                }
            }
        }
        print (streak)
        print (model.myParks.last?.wattHrsPerDay)
        if (streak >= 15) {
            appendBadgeToLastPark(name: "badgeStreak3")
        }
        if (streak >= 10) {
            appendBadgeToLastPark(name: "badgeStreak2")
        }
        if (streak >= 5) {
            appendBadgeToLastPark(name: "badgeStreak1")
        }

    }
    
    func autoPopulateCalendar() {
        let range = 1..<31

        if model.myParks.last?.wattHrsPerDay == nil {
            model.myParks.last?.wattHrsPerDay = [Float]()
        }

        for _ in range {
            model.myParks.last?.wattHrsPerDay?.append(Float.random(in: 1.0..<750.0))
        }
        //print(model.myParks.last?.wattHrsPerDay)
    }




    
}

struct childAchievements_Previews: PreviewProvider {
    static var previews: some View {
        childAchievements(userData: UserViewData())
    }
}
