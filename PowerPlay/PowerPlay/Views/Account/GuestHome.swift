//
//  GuestHome.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/12/23.
//

import SwiftUI
import Charts

struct GuestHome: View {
    var model = TestModel()
    
    @State var progress: CGFloat = 0.75
    @State var toStart = false

    var body: some View {
        NavigationStack{
            ScrollView{
                HStack{
                    Text("PowerPlay")
                        .fontDesign(.rounded)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                        .bold()
                        .padding(.vertical)
                    Button(action: {
                        toStart = true
                    }) {
                        HStack{
                            Text("Guest").foregroundColor(Color.white)
                                .fontDesign(.rounded)
                            Image(systemName: "person.crop.circle.fill")
                                .scaleEffect(2.3)
                                .padding()
                                .foregroundColor(Color("lightningYellow"))
                        }
                    }
                }
                Text("\(model.myUser?.park ?? "") - January") // Using model to access park
                    .fontDesign(.rounded)
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
                                .fontDesign(.rounded)
                                .bold()
                                .cornerRadius(10)
                                .foregroundColor(Color.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.horizontal], 15)
                                .padding([.vertical], 7)
                                .font(.title3)
                            
                            VStack{
                                HStack{
                                    ZStack{
                                        CircleProgress(progress: progress, colorFinish: Color.white, colorUnfinished: Color.white.opacity(0.2), lineWidth: 3)
                                            .frame(height: 70)
                                        Image(systemName:"lightbulb.fill")
                                            .scaleEffect(2)
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(Color("lightningYellow"))
                                    }
                                    
                                    ZStack{
                                        CircleProgress(progress: progress, colorFinish: Color.white, colorUnfinished: Color.white.opacity(0.2), lineWidth: 3)
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
                                        CircleProgress(progress: progress, colorFinish: Color.white, colorUnfinished: Color.white.opacity(0.2), lineWidth: 3)
                                            .frame(height: 70)
                                        Image(systemName:"wand.and.stars.inverse")
                                            .scaleEffect(2)
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(Color("lightningYellow"))
                                    }
                                    
                                    ZStack{
                                        CircleProgress(progress: progress, colorFinish: Color.white, colorUnfinished: Color.white.opacity(0.2), lineWidth: 3)
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
                                        .font(.system(size: 70))
                                        .bold()
                                        .fontDesign(.rounded)
                                        .frame(maxHeight: .infinity,alignment:.center)
                                }
                            }
                            
                        
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
                                    .fontDesign(.rounded)
                                    .bold()
                                    .cornerRadius(7)
                                    .foregroundColor(Color.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding([.horizontal], 15)
                                    .padding([.vertical], 7)
                                    .font(.title3)
                                   
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
            }.background(Color("darkModeBackground"))
        }
        .foregroundColor(Color.white)
        .background(Color("darkModeBackground"))
        .scrollIndicators(.hidden)
        .padding()
        .background(Color("darkModeBackground"))
        .fullScreenCover(isPresented: $toStart) {
            StartView()
        }
        .onAppear {
            model.load() // Loading data from the model
        }
    }
}

struct GuestHome_Previews: PreviewProvider {
    static var previews: some View {
        GuestHome().environment(\.colorScheme, .light)
        GuestHome().environment(\.colorScheme, .dark)
    }
}
