//
//  CalendarView.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/13/23.
//

import SwiftUI

struct CalendarView: View {
    private let calendar = Calendar.current
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter
    }()
    
    private var currentYear: Int{
        calendar.component(.year, from: Date())
    }

    private var currentMonth: Int {
        calendar.component(.month, from: Date())
    }
    
    private var numberOfDaysInMonth: Int {
        let dateComponents = DateComponents(year: currentYear, month: currentMonth)
        let date = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    private var daysOfWeek: [String] {
        calendar.veryShortWeekdaySymbols
    }

    func getFirstDayOfWeekForCurrentMonth() -> Int? {
        let currentDate = Date()
        let calendar = Calendar.current
        
        let components = calendar.dateComponents([.year, .month], from: currentDate)
        guard let firstDayOfMonth = calendar.date(from: components) else {
            return nil
        }
        
        let firstWeekday = calendar.component(.weekday, from: firstDayOfMonth)
        return firstWeekday - 1
    }
    
    func getCurrentDay() -> Int {
        let currentDate = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: currentDate)
        return day
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(daysOfWeek, id: \.self) { day in
                    Text(day)
                        .fontDesign(.rounded)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                }
            }
            
            let startColumnIndex = getFirstDayOfWeekForCurrentMonth()
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 8) {
                
                ForEach(0..<startColumnIndex!, id: \.self) { _ in
                    Color.clear
                }
                
                ForEach(1...numberOfDaysInMonth, id: \.self) { day in
                    let isFullDaySelected = AchievementsData().setDaysFullGoalAchieved().contains(day)
                    let isPartialDaySelected = AchievementsData().setDaysPartialGoalAchieved().contains(day)
                    
                    
                    if (isFullDaySelected){
                        Text("\(day)")
                            .fontDesign(.rounded)
                            .font(.headline)
                            .foregroundColor(isFullDaySelected ? Color("darkModeBackground") : .primary)
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .background(
                                
                                Circle()
                                    .foregroundColor(isFullDaySelected ? Color("lightningYellow") : .clear)
                                
                            )
                    }
                    else if (isPartialDaySelected){
                        Text("\(day)")
                            .fontDesign(.rounded)
                            .font(.headline)
                            .foregroundColor(isPartialDaySelected ? .white : .primary)
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .background(
                                
                                Circle()
                                    .stroke(Color.white, lineWidth: 2)
                                
                            )
                    }
                    else if (day <= getCurrentDay()){
                        Text("\(day)")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .fontDesign(.rounded)
                    }
                    else {
                        Text("\(day)")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .fontDesign(.rounded)
                    }
                    
                }
            }
            
            HStack{
                HStack{
                    Image(systemName: "circle.fill")
                        .foregroundColor(Color("lightningYellow"))
                        .font(.system(size: 6))
                    Text("Goals Met")
                        .fontDesign(.rounded)
                        .font(.caption)
                        .fontDesign(.rounded)
                }
                HStack{
                    Image(systemName: "circle")
                        .foregroundColor(.white)
                        .font(.system(size: 6))
                        .bold()
                    Text("Goals Unfinished")
                        .fontDesign(.rounded)
                        .font(.caption)
                        .fontDesign(.rounded)
                }
            }
            
            
        }
        .padding()
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

