//
//  GuestHomeViewModel.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/14/23.
//

import Foundation

class GuestData: ObservableObject {
    @Published var park: String?
    
    @Published var userProgress1: CGFloat = 0.1
    @Published var userProgress2: CGFloat = 0.7
    @Published var userProgress3: CGFloat = 0.3
    @Published var userProgress4: CGFloat = 0.9
    
    @Published var parkProgress1: CGFloat = 0.1
    @Published var parkProgress2: CGFloat = 0.7
    @Published var parkProgress3: CGFloat = 0.3
    @Published var parkProgress4: CGFloat = 0.9
    
    
    func setPark(name: String) {
        park = name
    }
    
    func getPark() -> String {
        return park!
    }
}
