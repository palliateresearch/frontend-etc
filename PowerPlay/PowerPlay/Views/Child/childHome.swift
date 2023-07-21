//
//  Home.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/12/23.
//

import SwiftUI

struct childHome: View {
    @EnvironmentObject private var pv: PV
    var model = TestModel()
    @State var isSettings = false
    
    var body: some View {
        NavigationStack{
            childHomePark(userName: "\(model.myUser?.firstName ?? "hello")", totalWattHrs: "295", parkLeaderboard: "4", parkName: "\(model.myUser?.park ?? "Apple")", todayWattHrs: 4, mission1Completion: 1, mission2Completion: 2, mission3Completion: 3, mission4Completion: 4)
        }
    }
}

struct childHome_Previews: PreviewProvider {
    static var previews: some View {
        let pv = PV() // Create a mock instance of PV

        return childHome()
            .environmentObject(pv) // Inject the mock instance as an environment object
    }
}
