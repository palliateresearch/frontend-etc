//
//  HomeModel.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/12/23.
//

import Foundation

//struct CustomColors {
//    static let navyBlue =  Color("navyBlue")
//}

struct HomeData {
    let viewDays: [ViewDays] = [
        .init(date: Date.from(month: 7, day: 1), viewCount: 5500),
        .init(date: Date.from(month: 7, day: 2), viewCount: 9000),
        .init(date: Date.from(month: 7, day: 3), viewCount: 2220),
        .init(date: Date.from(month: 7, day: 4), viewCount: 7000),
        .init(date: Date.from(month: 7, day: 5), viewCount: 9500),
        .init(date: Date.from(month: 7, day: 6), viewCount: 200),
        .init(date: Date.from(month: 7, day: 7), viewCount: 3000),
        .init(date: Date.from(month: 7, day: 8), viewCount: 8000),
        .init(date: Date.from(month: 7, day: 9), viewCount: 8500),
        .init(date: Date.from(month: 7, day: 10), viewCount: 4000),
        .init(date: Date.from(month: 7, day: 11), viewCount: 70),
        .init(date: Date.from(month: 7, day: 12), viewCount: 1500)
        
    ]
    
}


struct ViewDays: Identifiable {
    let id = UUID()
    let date: Date
    let viewCount: Int
}

extension Date {
    static func from (month: Int, day: Int) -> Date {
        let components = DateComponents(month: month, day: day)
        return Calendar.current.date(from: components)!
    }
}


