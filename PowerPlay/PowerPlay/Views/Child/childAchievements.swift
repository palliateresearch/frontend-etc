//
//  childAchievements.swift
//  PowerPlay
//
//  Created by Valerie Kwan on 7/20/23.
//

import SwiftUI
import SceneKit

struct childAchievements: View {
    var adaptiveColumns = [GridItem(.adaptive(minimum: 100))]
    @ObservedObject var userData: UserViewData
    var model = TestModel()
    
    let c: calculateAchievements
    @State var x: Int
    @State var y: Int
    @State var tempWattHrs: [String] = []

       init(userData: UserViewData) {
           self.userData = userData
           self.c = calculateAchievements()
           self.x = c.calcBadgeStreaks()
           self.y = c.calcBadgeVisits()
       }
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
                            Text("\(y) days")
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
                            Text("\(x) days")
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
                                ForEach(model.myParks.last?.badges ?? tempWattHrs, id: \.self) { image in
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
                
//                SceneView(
//                    scene: {
//                        let scene = SCNScene(named: "PowerPlay Badges 3.imported.usdz")
//                        
//                        if let scene = scene {
//                            scene.background.contents = UIColor.gray
//                        }
//                                
//                        return scene
//                    }() ,options: [.autoenablesDefaultLighting, .allowsCameraControl]
//                )
//                .frame(width: 200, height:  200)
//                .scaleEffect(0.65)
                
            }
            .background(Color("lightBlue"))
            .onReceive(userData.$jsonData) { _ in
              
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
                c.removeDuplicates()
            }
        }
    }
}
struct childAchievements_Previews: PreviewProvider {
    static var previews: some View {
        childAchievements(userData: UserViewData())
    }
}

struct calculateAchievements {
    var model = TestModel()
    func appendBadgeToLastPark(name: String)  {
        if let lastPark = model.myParks.last {
            print ("/n/n/n/n/n/n/n/n/n/n lalala /n/n/n/n//n/n/n/n/n/")
            lastPark.badges = lastPark.badges ?? []
            lastPark.badges?.append(name)
            print ("1: \(model.myParks.last?.badges)")
        } else {
            print ("/n/n/n/n/n/n/n/n/ OMG FOUND PROBLEM /n/n/n/n/n/n//n/n/n")
        }
        model.save()
    }
    func removeDuplicates() {
        model.myParks.last?.badges = Array(Set(model.myParks.last?.badges ?? []))
        model.save()
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
            appendBadgeToLastPark(name: "PowerPlay Badges 3.imported.usdz")
        }
        if (wattHrs >= 150) {
            appendBadgeToLastPark(name: "PowerPlay Badges 2.imported.usdz")
        }
        if (wattHrs >= 50) {
            appendBadgeToLastPark(name: "PowerPlay Badges.exported.usdz")
        }
        print (wattHrs)
    }
    func calcBadgeStreaks() -> Int {
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
        print (model.myParks.last?.wattHrsPerDay)
        if (streak >= 15) {
            appendBadgeToLastPark(name: "badgeStreak3")
        }
        if (streak >= 10) {
            appendBadgeToLastPark(name: "badgeStreak2")
        }
        if (streak >= 5) {
            appendBadgeToLastPark(name: "badgeStreak1")
            print ("lalalla")
        }
        return streak

    }
    func calcBadgeVisits() -> Int {
        var streak = 0
        
        let day = dayOfMonth()
        for dayIndex in stride(from: day, through: 1, by: -1) {
            if let lastPark = model.myParks.last,
               dayIndex <= lastPark.wattHrsPerDay?.count ?? 1 {
                let wattHrsForDay = lastPark.wattHrsPerDay?[dayIndex]
                print ("\n\n\n\n\(wattHrsForDay)")
                if (wattHrsForDay ?? 0 > 0) {
                    streak += 1
                } else {
                    print ("It broke")
                    break
                }
            }
        }
        return streak

    }
    
    func autoPopulateCalendar() {
        let maxArraySize = 30
        let remainingSlots = max(maxArraySize - (model.myParks.last?.wattHrsPerDay?.count ?? 0), 0)
        let range = 1..<min(remainingSlots, 31)

        if model.myParks.last?.wattHrsPerDay == nil {
            model.myParks.last?.wattHrsPerDay = [Float]()
            print ("it is nil")
        }

        for _ in range {
            model.myParks.last?.wattHrsPerDay?.append(Float.random(in: -50..<500.0))
        }
    }

}


