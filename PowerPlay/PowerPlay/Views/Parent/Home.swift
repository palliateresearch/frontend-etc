//
//  Home.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/12/23.
//

import SwiftUI
import Charts

struct Home: View {
    @EnvironmentObject var pv: PV
    var model = TestModel()
    @ObservedObject var userData: UserViewData
    @State var tempName: String = ""
    
    @State var progress: CGFloat = 0.75
    @State var isSettings = false
    @State var timer: Timer?
    
    @State var progress1: CGFloat = 0.75/*CGFloat(Float.random(in: 0, 1))*/
    
    @State var viewDays: [ViewDays] = [
        .init(date: Date.from(month: 7, day: 18), viewCount: 3),
        .init(date: Date.from(month: 7, day: 19), viewCount: 2),
        .init(date: Date.from(month: 7, day: 20), viewCount: 1),
        .init(date: Date.from(month: 7, day: 21), viewCount: 0),
        .init(date: Date.from(month: 7, day: 22), viewCount: 4),
        .init(date: Date.from(month: 7, day: 23), viewCount: 1),
        .init(date: Date.from(month: 7, day: 24), viewCount: 0),
        .init(date: Date.from(month: 7, day: 25), viewCount: 3),
        .init(date: Date.from(month: 7, day: 26), viewCount: 2),
        .init(date: Date.from(month: 7, day: 27), viewCount: 3),
        .init(date: Date.from(month: 7, day: 28), viewCount: 0)
        ]
    
    func getMonth() -> String {
        let calendar = Calendar.current
        let currentMonth = calendar.component(.month, from: Date())
        let monthArr: [String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        return monthArr[currentMonth]
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
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
                        HStack {
                            
                            Picker("Select an option", selection: $pv.selectedOptionIndex) {
                                        ForEach(0..<model.myChildren.count, id: \.self) { index in
                                            if (model.myChildren[index].childName != nil && model.myChildren[index].childName != "") {
                                                Text(model.myChildren[index].childName ?? "")
                                            }
                                        }
                                    }
                                    .onChange(of: pv.selectedOptionIndex, perform: { newIndex in
                                        pv.selectedChild = model.myChildren[newIndex].childName ?? ""
                                    })
                                    .onAppear {
                                        if !(model.myChildren.isEmpty) {
                                            pv.selectedChild = model.myChildren[pv.selectedOptionIndex].childName ?? ""
                                        }
                                       
                                    }
                                    .pickerStyle(.menu) 
                    
                            Image(systemName: "person.crop.circle.fill")
                                .scaleEffect(2.3)
                                .padding()
                                .foregroundColor(Color("lightningYellow"))
                        }
                        
                    })
                }
                ForEach (model.myParks) { park in
                    if let parkName = park.parkName {
                        Text("\(parkName)'s Achievements - " + getMonth())
                            .frame(alignment: .leading)
                            .font(.title3)
                            .bold()
                            .padding(.top)
                            .fontDesign(.rounded)
                            .lineLimit(1) // Set maximum number of lines
                            .minimumScaleFactor(0.2) // Set the minimum scale factor (adjust as needed)
                            .padding(.leading, 10)
                            .padding(.trailing, 10)

                    } else {
                        // Handle the case when parkName is nil (optional is not set)
                        // You can display a default value or show a different message
                        Text("User's Achievements - " + getMonth())
                            .frame(alignment: .leading)
                            .font(.title3)
                            .bold()
                            .padding(.top)
                            .fontDesign(.rounded)
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
                        
                        VStack {
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
                                
                                VStack {
                                    Text("Total Power")
                                        .bold()
                                        .foregroundColor(Color.black)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .padding([.horizontal], 15)
                                        .padding([.vertical], 7)
                                        .font(.title3)
                                        .fontDesign(.rounded)
                                    Spacer()
                                    Spacer()
                                    HStack{
                                        VStack{
                                            Text(String(userData.jsonData.totalEnergy))
                                                .foregroundColor(Color.white)
                                                .font(.system(size: 70))
                                                .bold()
                                                .fontDesign(.rounded)
                                                .frame(maxHeight: .infinity,alignment:.center)
                                        }
                                        .padding()
                                        .onAppear(perform: {
                                            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                                                userData.loadData()
                                                viewDays.removeLast()
                                                viewDays.append(.init(date: Date.from(month: 7, day: 28), viewCount: Int(userData.jsonData.totalEnergy)))
                                            }
                                        })
                                            
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
                                
                                VStack {
                                    Text("Monthly Watt Hours")
                                        .bold()
                                        .cornerRadius(7)
                                        .foregroundColor(Color.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding([.horizontal], 15)
                                        .padding([.vertical], 7)
                                        .font(.title3)
                                        .fontDesign(.rounded)
                                       
                                    Chart {
                                        ForEach(viewDays) { viewDay in
                                            LineMark(x: .value("Date", viewDay.date, unit: .day), y: .value("Views", viewDay.viewCount))
                                        }
                                        .foregroundStyle(Color.white)
                                    }
                                    .frame(width: CGFloat(viewDays.count)*35)
                                    .chartXAxisLabel(position: .bottom, alignment: .center) {
                                        Text("July")
                                            .foregroundColor(Color.white)
                                            .fontDesign(.rounded)
                                    }
                                    .chartXAxis {
                                        AxisMarks(values: viewDays.map {$0.date}) { date in
                                            AxisValueLabel(format: .dateTime.day()).foregroundStyle(Color.white)
                                            AxisGridLine().foregroundStyle(Color("lightningYellow"))
                                        }
                                    }
                                    .foregroundStyle(Color.white)
                                    .chartYAxis {
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
                
            }
//            .background(Color("darkModeBackground"))
            .background(Color.black)
            .foregroundColor(Color.white)
            .scrollIndicators(.hidden)
            
        }.padding()
            .background(Color.black)
//        .background(Color("darkModeBackground"))
        

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(userData: UserViewData()).environment(\.colorScheme, .light)
        Home(userData: UserViewData()).environment(\.colorScheme, .dark)
    }
}

struct CircleProgress: View {
    var progress: CGFloat
    var colorFinish: Color
    var colorUnfinished: Color
    var lineWidth: Int
    
    var currentPercentage: Int {
        Int(progress*100)
    }
    
    var body: some View {
        Circle()
            .trim(from: 0, to: progress)
            .stroke(colorFinish, style: StrokeStyle(lineWidth: CGFloat(lineWidth), lineCap: .round))
                .rotationEffect(.degrees(-90))
                .background(Circle().stroke(colorUnfinished, style: StrokeStyle(lineWidth: CGFloat(lineWidth), lineCap: .round)))
    }
}

