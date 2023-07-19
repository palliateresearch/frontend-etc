//
//  AchievementsViewModel.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/13/23.
//

import Foundation

class AchievementsData: ObservableObject {
    @Published var userData = UserViewData()
    @Published var badges: Set<String> = []
    @Published var daysFullGoalAchieved: [Int] = []
    @Published var daysPartialGoalAchieved: [Int] = []
    private var totalEnergy = 0
        
    func setBadges() -> Set<String> {
        badges = userData.badgesComplete
        return badges
    }
    
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
        if(totalEnergy >= 50){
                userData.badgesComplete.insert("badgeWh1")
        }
        else if(totalEnergy >= 150){
                userData.badgesComplete.insert("badgeWh2")
        }
        else if(totalEnergy >= 500){
                userData.badgesComplete.insert("badgeWh3")
        }
    }

}
