//
//  Home.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/12/23.
//

import SwiftUI

struct childHome: View {
    @ObservedObject var userData = UserViewData()
    @State var isSettings = false
    
    var body: some View {
        NavigationStack{
            childHomePark(userName: "\(userData.firstName)", totalWattHrs: "295", parkLeaderboard: "4", parkName: "\(userData.park)", todayWattHrs: 4, mission1Completion: 1, mission2Completion: 2, mission3Completion: 3, mission4Completion: 4)
        }
    }
}

struct childHome_Previews: PreviewProvider {
    static var previews: some View {
        childHome(userData: UserViewData()).environment(\.colorScheme, .light)
        childHome(userData: UserViewData()).environment(\.colorScheme, .dark)
    }
}
