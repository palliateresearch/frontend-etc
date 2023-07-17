//
//  GuestAchievements.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/14/23.
//

import SwiftUI

struct GuestAchievements: View {
    
    private var adaptiveColumns = [GridItem(.adaptive(minimum: 100))]
    @State var selectedDate: Date = Date()
    
    func getCurrentMonthAndYear() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        let monthAndYear = dateFormatter.string(from: currentDate)
        return monthAndYear
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                    Text("Achievements")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    HStack{
                        Spacer()
                        VStack{
                            Text("6 days")
                                .font(.title2)
                                .bold()
                            Text("current streak")
                                .bold()
                                .font(.subheadline)
                        }
                        .padding(.leading)
                        
                        Image(systemName: "flame.circle.fill")
                            .resizable()
                            .scaleEffect(0.7)
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(Color("lightningYellow"))
                        
                        VStack{
                            Text("10 days")
                                .font(.title2)
                                .bold()
                            Text("longest streak")
                                .bold()
                                .font(.subheadline)
                        }
                        .padding(.trailing)
                        Spacer()
                        
                    }
                    
                    ZStack{
                        Spacer()
                        RoundedRectangle(cornerRadius: 15)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .ignoresSafeArea(.all)
                            .foregroundColor(Color("darkModeBackground"))
                        VStack{
                            Text(getCurrentMonthAndYear())
                                .font(.title2)
                                .bold()
                                .padding([.horizontal, .top])
                            CalendarView()

                            
                            
                            Text("Badges Earned")
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                            

                            LazyVGrid(columns: adaptiveColumns, spacing: 20){
                                ForEach(AchievementsData().setBadges(), id: \.self){image in
                                    ZStack {
                                        Image(systemName: image)
                                            .scaleEffect(2)
                                            .foregroundColor(Color.white)
                                            .padding()
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                    
                }
                .background(Color("navyBlue"))
            

        }.preferredColorScheme(.dark)
            
        
    }
    
}

struct GuestAchievements_Previews: PreviewProvider {
    static var previews: some View {
        Achievements()
    }
}
