//
//  Home.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/12/23.
//

import SwiftUI
import Charts

struct Home: View {
    @ObservedObject var userData = UserViewData()
    @State var progress: CGFloat = 0.75
    @State var isSettings = false
    //@State
    
    var body: some View {
        
        NavigationStack{
            ScrollView{
                HStack{
                    Text("PowerPlay")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                        .bold()
                        .padding(.vertical)
                        .fontDesign(.rounded)
                    Button(action: {
                        isSettings = true
                    }
                    , label: {
                        HStack{
                            Text("\(userData.firstName)").fontDesign(.rounded)
                            Image(systemName: "person.crop.circle.fill")
                                .scaleEffect(2.3)
                                .padding()
                                .foregroundColor(Color("lightningYellow"))
                        }
                        
                    })
                }
                Text("\(userData.firstName)'s Achievements")
                    .fontDesign(.rounded)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                         
                ZStack (alignment: .leading){
                    ZStack (alignment: .topLeading) {
                        Rectangle()
                            .foregroundColor(Color("navyBlue"))

                        Rectangle()
                            .fill(Color("lightningYellow"))
                            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 40, alignment: .top)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    VStack{
                        Text("Goals")
                            .bold()
                            .cornerRadius(10)
                            .foregroundColor(Color.black)
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.horizontal], 15)
                            .padding([.vertical], 7)
                            .font(.title3)
                           
                        HStack{
                            ZStack{
                                CircleProgress(progress: $progress)
                                    .frame(height: 70)
                                Image(systemName:"lightbulb.fill")
                                    .scaleEffect(2)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color("lightningYellow"))
                            }
                                
                            ZStack{
                                CircleProgress(progress: $progress)
                                    .frame(height: 70)
                                Image(systemName:"hourglass")
                                    .scaleEffect(2)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color("lightningYellow"))
                            }
                                
                            ZStack{
                                CircleProgress(progress: $progress)
                                    .frame(height: 70)
                                Image(systemName:"wand.and.stars.inverse")
                                    .scaleEffect(2)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color("lightningYellow"))
                            }
                            
                            ZStack{
                                CircleProgress(progress: $progress)
                                    .frame(height: 70)
                                Image(systemName:"figure.walk")
                                    .scaleEffect(2)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color("lightningYellow"))
                            }
                                
                            
                                
                        }
                        .padding(15)
                    
                    }
                    
                }
                .padding([.bottom])
                
                
                ScrollView(.horizontal) {
                    HStack(spacing: 14) {
                        ZStack {
                            ZStack (alignment: .topLeading) {
                                Rectangle()
                                    .foregroundColor(Color("navyBlue"))

                                Rectangle()
                                    .fill(Color("lightningYellow"))
                                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 40, alignment: .top)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            VStack{
                                Text("Total Power")
                                    .bold()
                                    .foregroundColor(Color.black)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .padding([.horizontal], 15)
                                    .padding([.vertical], 7)
                                    .font(.title3)
                                    .fontDesign(.rounded)
                                   
                                HStack{
                                    VStack{
                                        Spacer()
                                        Spacer()
                                        Text("485")
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 60))
                                            .bold()
                                            .fontDesign(.rounded)

                                        ZStack{
                                            Capsule()
                                                .foregroundColor(Color.white)
                                            HStack{
                                                Text("1").fontDesign(.rounded)
                                                Text("Nishka").fontDesign(.rounded)
                                            }
                                            .foregroundColor(Color.black)
                                            .padding(2)
                                            .bold()
                                            
                                        }
                                    }
                                    .padding()
                                        
                                }
                                
                            
                            }
                            
                        }
                        ZStack (alignment: .leading){
                            ZStack (alignment: .topLeading) {
                                Rectangle()
                                    .foregroundColor(Color("navyBlue"))

                                Rectangle()
                                    .fill(Color("lightningYellow"))
                                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 40, alignment: .top)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            VStack{
                                Text("Weekly Watt Hours")
                                    .bold()
                                    .cornerRadius(7)
                                    .foregroundColor(Color.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding([.horizontal], 15)
                                    .padding([.vertical], 7)
                                    .font(.title3)
                                    .fontDesign(.rounded)
                                   
                                Chart{
                                    ForEach(HomeData().viewDays){ viewDay in
                                        LineMark(x: .value("Date", viewDay.date, unit: .day), y: .value("Views", viewDay.viewCount))
                                    }
                                    .foregroundStyle(Color.white)
                                }
                                .frame(width: CGFloat(HomeData().viewDays.count)*35)
                                .chartXAxisLabel(position: .bottom, alignment: .center) {
                                    Text("July")
                                        .foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                .chartXAxis{
                                    AxisMarks(values: HomeData().viewDays.map {$0.date}) {date in
                                        AxisValueLabel(format: .dateTime.day()).foregroundStyle(Color.white)
                                        AxisGridLine().foregroundStyle(Color("lightningYellow"))
                                    }
                                }
                                .foregroundStyle(Color.white)
                                .chartYAxis{
                                    AxisMarks(values: .automatic) { _ in
                                        AxisValueLabel().foregroundStyle(Color.white)
                                        AxisGridLine().foregroundStyle(Color("lightningYellow"))
                                    }
                                }
                                .foregroundStyle(Color.white)
                                .padding()
                            }
                            
                        }
                        
                    }
                }.scrollIndicators(.visible)
                
                Spacer()
                Spacer()
                
                Text("\(userData.park) - January")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title3)
                    .bold()
                    .padding(.top)
                    .fontDesign(.rounded)
                
                HStack{
                    ZStack (alignment: .leading){
                        ZStack (alignment: .topLeading) {
                            Rectangle()
                                .foregroundColor(Color("navyBlue"))
                            
                            Rectangle()
                                .fill(Color("lightningYellow"))
                                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 40, alignment: .top)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        VStack{
                            Text("Goals")
                                .bold()
                                .cornerRadius(10)
                                .foregroundColor(Color.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.horizontal], 15)
                                .padding([.vertical], 7)
                                .font(.title3)
                                .fontDesign(.rounded)
                            
                            VStack{
                                HStack{
                                    ZStack{
                                        CircleProgress(progress: $progress)
                                            .frame(height: 70)
                                        Image(systemName:"lightbulb.fill")
                                            .scaleEffect(2)
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(Color("lightningYellow"))
                                    }
                                    
                                    ZStack{
                                        CircleProgress(progress: $progress)
                                            .frame(height: 70)
                                        Image(systemName:"hourglass")
                                            .scaleEffect(2)
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(Color("lightningYellow"))
                                    }
                                }
                                
                                Spacer()
                                
                                HStack{
                                    ZStack{
                                        CircleProgress(progress: $progress)
                                            .frame(height: 70)
                                        Image(systemName:"wand.and.stars.inverse")
                                            .scaleEffect(2)
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(Color("lightningYellow"))
                                    }
                                    
                                    ZStack{
                                        CircleProgress(progress: $progress)
                                            .frame(height: 70)
                                        Image(systemName:"figure.walk")
                                            .scaleEffect(2)
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(Color("lightningYellow"))
                                    }
                                }
                                
                                
                            }
                            .padding(15)
                        }
                        
                    }
                    .padding([.trailing], 5)
                    
                    ZStack (alignment: .leading){
                        ZStack (alignment: .topLeading) {
                            Rectangle()
                                .foregroundColor(Color("navyBlue"))
                            
                            Rectangle()
                                .fill(Color("lightningYellow"))
                                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 40, alignment: .top)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        VStack{
                            Text("Leaderboard")
                                .bold()
                                .cornerRadius(10)
                                .foregroundColor(Color.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.horizontal], 15)
                                .padding([.vertical], 7)
                                .font(.title3)
                                .fontDesign(.rounded)
                            
                            VStack{
                                ZStack{
                                    Capsule()
                                        .foregroundColor(Color.white)
                                    HStack{
                                        Text("1")
                                            .fontDesign(.rounded)
                                        Text("Nishka").fontDesign(.rounded)
                                    }
                                    .foregroundColor(Color.black)
                                    .padding(2)
                                    
                                }
                                ZStack{
                                    Capsule()
                                        .foregroundColor(Color.white)
                                    HStack{
                                        Text("2")
                                            .fontDesign(.rounded)
                                        Text("Valerie")
                                            .fontDesign(.rounded)
                                    }
                                    .foregroundColor(Color.black)
                                    .padding(2)
                                    
                                }
                                ZStack{
                                    Capsule()
                                        .foregroundColor(Color.white)
                                    HStack{
                                        Text("3")
                                            .fontDesign(.rounded)
                                        Text("Aadit")
                                            .fontDesign(.rounded)
                                    }
                                    .foregroundColor(Color.black)
                                    .padding(2)
                                    
                                }
                                ZStack{
                                    Capsule()
                                        .foregroundColor(Color.white)
                                    HStack{
                                        Text("4")
                                            .fontDesign(.rounded)
                                        Text("Eddie")
                                            .fontDesign(.rounded)
                                    }
                                    .foregroundColor(Color.black)
                                    .padding(2)
                                    
                                }
                                ZStack{
                                    Capsule()
                                        .foregroundColor(Color.white)
                                    HStack{
                                        Text("5")
                                            .fontDesign(.rounded)
                                        Text("Vaughn")
                                            .fontDesign(.rounded)
                                    }
                                    .foregroundColor(Color.black)
                                    .padding(2)
                                    
                                }
                                
                            }
                            .padding(15)
                            .bold()
                        }
                        
                    }
                
                    
                }
                .padding([.bottom])
                
                ScrollView(.horizontal) {
                    HStack(spacing: 14) {
                    
                        ZStack (alignment: .leading){
                            ZStack (alignment: .topLeading) {
                                Rectangle()
                                    .foregroundColor(Color("navyBlue"))

                                Rectangle()
                                    .fill(Color("lightningYellow"))
                                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 40, alignment: .top)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            VStack{
                                Text("Weekly Watt Hours")
                                    .bold()
                                    .cornerRadius(7)
                                    .foregroundColor(Color.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding([.horizontal], 15)
                                    .padding([.vertical], 7)
                                    .font(.title3)
                                    .fontDesign(.rounded)
                                   
                                Chart{
                                    ForEach(HomeData().viewDays){ viewDay in
                                        LineMark(x: .value("Date", viewDay.date, unit: .day), y: .value("Views", viewDay.viewCount))
                                    }
                                    .foregroundStyle(Color.white)
                                }
                                .frame(width: CGFloat(HomeData().viewDays.count)*35)
                                .chartXAxisLabel(position: .bottom, alignment: .center) {
                                    Text("July")
                                        .foregroundColor(Color.white)
                                }
                                .chartXAxis{
                                    AxisMarks(values: HomeData().viewDays.map {$0.date}) {date in
                                        AxisValueLabel(format: .dateTime.day()).foregroundStyle(Color.white)
                                        AxisGridLine().foregroundStyle(Color("lightningYellow"))
                                    }
                                }
                                .foregroundStyle(Color.white)
                                .chartYAxis{
                                    AxisMarks(values: .automatic) { _ in
                                        AxisValueLabel().foregroundStyle(Color.white)
                                        AxisGridLine().foregroundStyle(Color("lightningYellow"))
                                    }
                                }
                                .foregroundStyle(Color.white)
                                .padding()
                            }
                            
                        }
                        
                    }
                }.scrollIndicators(.visible)
            }
            .foregroundColor(Color.white)
            .padding()
            .background(Color("darkModeBackground"))
            .scrollIndicators(.hidden)
            
            
        }.preferredColorScheme(.dark)
            .fullScreenCover(isPresented: $isSettings) {
                Settings(userData: userData)
            }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(userData: UserViewData()).environment(\.colorScheme, .light)
        Home(userData: UserViewData()).environment(\.colorScheme, .dark)
    }
}

struct CircleProgress: View {
    @Binding var progress: CGFloat
    
    var currentPercentage: Int {
        Int(progress*100)
    }
    
    var body: some View {
        Circle()
            .trim(from: 0, to: progress)
            .stroke(Color.white, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .background(Circle().stroke(Color.white.opacity(0.2), style: StrokeStyle(lineWidth: 3, lineCap: .round)))
            
    }
}
