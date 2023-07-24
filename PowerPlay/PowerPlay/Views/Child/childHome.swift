//
//  Home.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/12/23.
//

import SwiftUI

struct childHome: View {
    var model = TestModel()
    @State private var selectedTab: Int = 0
    @State var isSettings = false
    
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color("darkBlue"))
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color("lightGray"))
    }

    var body: some View {
        NavigationStack{
            TabView(selection: $selectedTab){
                if let parks = model.myUser?.parks{
                    ForEach(parks, id: \.self){park in
                        if let parkPage = model.getPark(parkName: park){
                            childHomePark(userName: model.myUser?.firstName ?? "hi", totalWattHrs: "295", parkLeaderboard: parkPage.leaderNum ?? "0", parkName: "\(park)", todayWattHrs: parkPage.wattHrsPerDay?.last ?? Float(0.0), mission1Completion: 1, mission2Completion: 2, mission3Completion: 3, mission4Completion: 4)
                                .tag(park)
                        }
                    }
                }
            }.tabViewStyle(PageTabViewStyle())
        }
    }
}

struct childHome_Previews: PreviewProvider {
    static var previews: some View {

        return childHome()
    }
}
