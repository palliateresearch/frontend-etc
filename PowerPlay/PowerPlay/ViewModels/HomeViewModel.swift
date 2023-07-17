//
//  HomeViewModel.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/13/23.
//

import Foundation

class Home_ViewModel_Data: ObservableObject {
    @Published var userProgress1: CGFloat?
    @Published var userProgress2: CGFloat?
    @Published var userProgress3: CGFloat?
    @Published var userProgress4: CGFloat?
    
    @Published var parkProgress1: CGFloat?
    @Published var parkProgress2: CGFloat?
    @Published var parkProgress3: CGFloat?
    @Published var parkProgress4: CGFloat?
    
    func getUserProgress1() -> CGFloat {
        userProgress1 = 0.5
        return userProgress1!
    }
    
    func getUserProgress2() -> CGFloat {
        userProgress2 = 0.7
        return userProgress2!
    }
    func getUserProgress3() -> CGFloat {
        userProgress3 = 0.1
        return userProgress3!
    }
    func getUserProgress4() -> CGFloat {
        userProgress4 = 0.9
        return userProgress4!
    }
    
    func getParkProgress1() -> CGFloat {
        parkProgress1 = 0.6
        return parkProgress1!
    }
    func getParkProgress2() -> CGFloat {
        parkProgress2 = 0.05
        return parkProgress2!
    }
    func getParkProgress3() -> CGFloat {
        parkProgress3 = 0.95
        return parkProgress3!
    }
    func getParkProgress4() -> CGFloat {
        parkProgress4 = 1.0
        return parkProgress4!
    }
}
