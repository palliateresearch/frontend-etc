//
//  AchievementsViewModel.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/13/23.
//

import Foundation

class AchievementsData: ObservableObject {
    @Published var badgesComplete: Set<String> = []
    @Published var daysFullGoalAchieved: [Int] = []
    @Published var daysPartialGoalAchieved: [Int] = []
    @Published var userData = UserViewData()
    private var totalEnergy = 0
    var model = TestModel()

        
//    func setBadges(badge: String){
//        model.myParks.last?.badges!.insert(badge)
//        model.save()
//    }
//    
    func setDaysFullGoalAchieved() -> [Int] {
        daysFullGoalAchieved = [1, 2, 9, 10, 13]
        return daysFullGoalAchieved
    }
    
    func setDaysPartialGoalAchieved() -> [Int] {
        daysPartialGoalAchieved = [3, 6, 7, 11]
        return daysPartialGoalAchieved
    }
    
    func getStartDayOfWeek() -> Int {
        let calendar = Calendar.current
        let currentDate = Date()
        
        let components = calendar.dateComponents([.year, .month], from: currentDate)
        let startOfMonth = calendar.date(from: components)!
        
        let startDayOfWeek = calendar.component(.weekday, from: startOfMonth)
        
        // Adjust the weekday index to start from 1 instead of 0
        let adjustedStartDayOfWeek = startDayOfWeek == 1 ? 7 : startDayOfWeek - 1
        
        return adjustedStartDayOfWeek
    }
    
    func updateBadges(){
        //all existing badges: "badgeStreak1", "badgeStreak2", "badgeStreak3", "badgeWh1", "badgeWh2", "badgeWh3", "badge100Elec", "badge100Ener", "badge100Green"
        if(totalEnergy >= 50){
                badgesComplete.insert("PowerPlay Badges.exported.usdz")
        }
        else if(totalEnergy >= 150){
                badgesComplete.insert("PowerPlay Badges 2.imported.usdz")
        }
        else if(totalEnergy >= 500){
                badgesComplete.insert("PowerPlay Badges 3.imported.usdz")
        }
    }
    
//    func runAt1159PM() {
//        // Get the current date and time
//        //userData.jsonData.totalEnergy
//        let currentDate = Date()
//
//        // Create a Calendar instance
//        let calendar = Calendar.current
//
//        // Extract components from the current date
//        let components = calendar.dateComponents([.hour, .minute], from: currentDate)
//
//        // Get the hour and minute components
//        if let hour = components.hour, let minute = components.minute {
//            // Calculate the seconds until 11:59 PM
//            let secondsUntil1159PM = (23 - hour) * 3600 + (59 - minute) * 60
//
//            // Schedule the function to run after the calculated seconds
//            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(secondsUntil1159PM)) {
//
//                print("It's 11:59 PM now!")
//
//
//            }
//        }
//    }

}
