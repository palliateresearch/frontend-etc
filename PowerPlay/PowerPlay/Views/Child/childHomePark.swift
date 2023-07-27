//
//  childHomePark.swift
//  PowerPlay
//
//  Created by Valerie Kwan on 7/20/23.
//

import SwiftUI

struct childHomePark: View{
    @ObservedObject var userData: UserViewData
    @State var selectedTab: Int = 0
    @State var timer: Timer?
    
    var model = TestModel()
    
  
    var parkLeaderboard: String?
    var mission1Completion: Int?
    var mission2Completion: Int?
    var mission3Completion: Int?
    var mission4Completion: Int?
    
//    func getLightBulbHr() -> String{
//        return String((todayWattHrs ?? 0) / 15)
//    }
    
//    init( parkLeaderboard: String? = nil, mission1Completion: Int = 0, mission2Completion: Int = 0, mission3Completion: Int = 0, mission4Completion: Int = 0) {
//
//        self.parkLeaderboard = parkLeaderboard
//        self.mission1Completion = mission1Completion
//        self.mission2Completion = mission2Completion
//        self.mission3Completion = mission3Completion
//        self.mission4Completion = mission4Completion
//    }
    
    
    var body: some View {
        
        NavigationStack{
            ScrollView{
                
                VStack{
                    ZStack(alignment: .leading){
                        ZStack(alignment: .topLeading){
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color("lightBlue"))
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("darkBlue"))
                                .frame(maxWidth: 245, maxHeight: .infinity, alignment: .leading)
                        }
                        
                        HStack{
                            Text(model.myUsers.last?.firstName ?? "Guest")
                                .minimumScaleFactor(0.03)
                                .fontWeight(.heavy)
                                .lineLimit(1)
                                .foregroundColor(Color("lightningYellow"))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding([.horizontal], 15)
                                .padding([.vertical], 7)
                                .font(.system(size:35))
                                .fontDesign(.rounded)
                            VStack{
                               
                                Text("\(String(format: "%.2f", userData.jsonData.totalEnergy))")
                                    .font(.system(size:35))
                                    .bold()
                                    .fontDesign(.rounded)
                                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 20))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                Text("total watt hours")
                                    .font(.system(size: 10))
                                    .bold()
                                    .fontDesign(.rounded)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 20))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                        .onAppear(perform: {
                            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                                userData.loadData()
                                print(userData.jsonData.totalEnergy)
                            }
                        })
                        .onDisappear(perform: {
                            timer?.invalidate()
                        })
                        
                        
                    }.padding()
                    Spacer()
                    Image("Sparky")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 225, alignment: .center)
                        .padding(.top)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }.background(LinearGradient(
                    colors: [Color.white, Color("lightBlue")],
                    startPoint: .top, endPoint: .bottom))
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(Color("aliceBlue"))
                        .shadow(
                            color: Color("darkBlue"),
                            radius: CGFloat(0),
                            x: 0, y: -5)
                        .background(LinearGradient(
                            colors: [Color("lightBlue"), Color.white],
                            startPoint: .top, endPoint: .bottom))
                }
                TabView{
                    ForEach (model.myParks) { park in
                        VStack {
                            ZStack {
                                ZStack (alignment: .topLeading) {
                                    Rectangle()
                                        .foregroundColor(Color("darkBlue"))
                                    
                                    Rectangle()
                                        .fill(Color("lightningYellow"))
                                        .frame(minWidth: 0, maxWidth: 400, maxHeight: 50, alignment: .top)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 20)).frame(minWidth: 0, maxWidth: 400, maxHeight: .infinity, alignment: .top)
                                
                                VStack{
                                    HStack{
                                        Image(systemName: "medal.fill")
                                            .foregroundColor(Color.white)
                                            .scaleEffect(1.5)
                                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 7, trailing: 0))
                                            .aspectRatio(contentMode: .fit)
                                        Text("#" + (parkLeaderboard ?? "5"))
                                            .bold()
                                            .foregroundColor(Color.white)
                                            .frame(maxWidth: 35, alignment: .leading)
                                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 7, trailing: 0))
                                            .lineLimit(1)
                                            .font(.system(size: 25))
                                            .fontDesign(.rounded)
                                        Text(park.parkName ?? "Apple Park")
                                            .minimumScaleFactor(0.03)
                                            .fontWeight(.heavy)
                                            .foregroundColor(Color.white)
                                            .frame(maxWidth: 7000, alignment: .center)
                                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 7, trailing: 30))
                                            .lineLimit(1)
                                            .font(.system(size: 25))
                                            .fontDesign(.rounded)
                                    }
                                    HStack{
                                        Text("You helped generate enough energy to power a lightbulb for")
                                            .lineLimit(nil)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 20))
                                            .bold()
                                            .fontDesign(.rounded)
                                            .frame(maxWidth:200, maxHeight: .infinity,alignment:.topLeading)
                                            .padding()
                                        VStack{
                                            Spacer()
                                            Image(systemName: "lightbulb")
                                                .foregroundColor(Color.white)
                                                .scaleEffect(2.5)
                                                .aspectRatio(contentMode: .fit)
                                                .padding(.top, 20)
                                            Text("\( String(format: "%.2f", (userData.jsonData.totalEnergy / 15.0))) hours")
                                                .foregroundColor(Color("lightningYellow"))
                                                .font(.system(size: 24))
                                                .fontWeight(.heavy)
                                                .fontDesign(.rounded)
                                                .frame(maxHeight: .infinity,alignment:.center)
                                                .padding()
                                        }
                                    }
                                }
                            }.padding(.top, 30)
                                .padding(.horizontal)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color("aliceBlue"))
                                VStack{
                                    Text("Missions")
                                        .fontWeight(.heavy)
                                        .cornerRadius(10)
                                        .foregroundColor(Color("darkBlue"))
                                        .fontDesign(.rounded)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .padding([.vertical], 9)
                                        .font(.system(size:24))
                                    
                                    HStack{
                                        ZStack{
                                            VStack{
                                                ZStack{
                                                    CircleProgress(progress: CGFloat((mission1Completion ?? 0) / 10), colorFinish: Color("darkBlue"), colorUnfinished: Color("lightBlue"), lineWidth: 10)
                                                        .frame(width: 70, height: 70, alignment: .leading)
                                                    Image(systemName:"lightbulb.fill")
                                                        .scaleEffect(2)
                                                        .aspectRatio(contentMode: .fit)
                                                        .foregroundColor(Color("darkBlue"))
                                                }
                                                Text("Park Power")
                                                    .foregroundColor(Color.black)
                                                    .font(.system(size: 12))
                                                    .fontWeight(.heavy)
                                                    .fontDesign(.rounded)
                                                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                                                Text(String(mission1Completion ?? 0) + "/10 watts")
                                                    .foregroundColor(Color.black)
                                                    .font(.system(size: 10))
                                                    .bold()
                                                    .fontDesign(.rounded)
                                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                                            }
                                        }.padding(EdgeInsets(top: 7, leading:0, bottom: 20, trailing: 10))
                                        ZStack{
                                            VStack{
                                                ZStack{
                                                    CircleProgress(progress: CGFloat((mission2Completion ?? 0) / 30), colorFinish: Color("darkBlue"), colorUnfinished: Color("lightBlue"), lineWidth: 10)
                                                        .frame(width: 70, height: 70)
                                                    Image(systemName:"hourglass")
                                                        .scaleEffect(2)
                                                        .aspectRatio(contentMode: .fit)
                                                        .foregroundColor(Color("darkBlue"))
                                                }
                                                Text("Park Time")
                                                    .foregroundColor(Color.black)
                                                    .font(.system(size: 12))
                                                    .fontWeight(.heavy)
                                                    .fontDesign(.rounded)
                                                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                                                Text(String(mission2Completion ?? 0) + "/30 minutes")
                                                    .foregroundColor(Color.black)
                                                    .font(.system(size: 10))
                                                    .bold()
                                                    .fontDesign(.rounded)
                                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                                            }
                                        }.padding(EdgeInsets(top: 7, leading: 0, bottom: 20, trailing: 10))
                                        
                                        ZStack{
                                            VStack{
                                                ZStack{
                                                    CircleProgress(progress: CGFloat((mission3Completion ?? 0) / 10), colorFinish: Color("darkBlue"), colorUnfinished: Color("lightBlue"), lineWidth: 10)
                                                        .frame(width: 70, height: 70)
                                                    Image(systemName:"tent")
                                                        .scaleEffect(1.75)
                                                        .aspectRatio(contentMode: .fit)
                                                        .foregroundColor(Color("darkBlue"))
                                                }
                                                Text("Park Visited")
                                                    .foregroundColor(Color.black)
                                                    .font(.system(size: 12))
                                                    .fontWeight(.heavy)
                                                    .fontDesign(.rounded)
                                                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                                                Text(String(mission3Completion ?? 0) + "/10 parks")
                                                    .foregroundColor(Color.black)
                                                    .font(.system(size: 10))
                                                    .bold()
                                                    .fontDesign(.rounded)
                                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                                            }
                                        }.padding(EdgeInsets(top: 7, leading: 0, bottom: 20, trailing: 10))
                                        
                                        ZStack{
                                            VStack{
                                                ZStack{
                                                    CircleProgress(progress: CGFloat((mission4Completion ?? 0) / 10), colorFinish: Color("darkBlue"), colorUnfinished: Color("lightBlue"), lineWidth: 10)
                                                        .frame(width: 70, height: 70)
                                                    Image(systemName:"book.closed")
                                                        .scaleEffect(2)
                                                        .aspectRatio(contentMode: .fit)
                                                        .foregroundColor(Color("darkBlue"))
                                                }
                                                Text("Discover")
                                                    .foregroundColor(Color.black)
                                                    .font(.system(size: 12))
                                                    .fontWeight(.heavy)
                                                    .fontDesign(.rounded)
                                                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                                                Text(String(mission4Completion ?? 0) + "/10 minutes")
                                                    .foregroundColor(Color.black)
                                                    .font(.system(size: 10))
                                                    .bold()
                                                    .fontDesign(.rounded)
                                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                                            }
                                        }.padding(EdgeInsets(top: 7, leading: 0, bottom: 20, trailing: 0))
                                        
                                    }
                                }
                            }.padding()
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(width: 400, height: 450)

                
                    
                        
                    
                    //end of VStack/ZStack
                }
        
                    
        }.onAppear{
            model.load()
            print (model.myParks.last?.parkName)
            print ("Test worked")
            userData.loadData()
            
        }
    }
}

struct childHomePark_Previews: PreviewProvider {
    static var previews: some View {
        childHomePark(userData: UserViewData())
    }
}

