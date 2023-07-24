//
//  childAchievements.swift
//  PowerPlay
//
//  Created by Valerie Kwan on 7/20/23.
//

import SwiftUI

struct childAchievements: View {
    var model = TestModel()
    
    private var adaptiveColumns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        NavigationStack{
            VStack{
                childCustomNavBar(navTitle: "Achievements", color: "darkBlue")
                VStack{
                    Spacer()
                    Spacer()
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color("darkBlue"))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    HStack{
                        VStack{
                            Text("6 days")
                                .foregroundColor(Color("lightningYellow"))
                                .font(.system(size: 30))
                                .fontWeight(.heavy)
                                .fontDesign(.rounded)
                            Text("visit streak")
                                .foregroundColor(Color.white)
                                .font(.title3)
                                .bold()
                                .fontDesign(.rounded)
                        }.padding(.leading)
                        Image(systemName: "flame.circle.fill")
                            .scaleEffect(3.5)
                            .frame(width: 80, height: 100, alignment: .center)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("aliceBlue"))
                        VStack{
                            Text("10 days")
                                .foregroundColor(Color("lightningYellow"))
                                .font(.system(size: 30))
                                .fontWeight(.heavy)
                                .fontDesign(.rounded)
                            Text("current streak")
                                .foregroundColor(Color.white)
                                .font(.title3)
                                .bold()
                                .fontDesign(.rounded)
                        }.padding(.trailing)
                        
                    }
                }.padding()
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("aliceBlue"))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    VStack{
                        Text("Badges Earned")
                            .foregroundColor(Color("darkBlue"))
                            .font(.system(size: 30))
                            .fontWeight(.heavy)
                            .fontDesign(.rounded)
                            .padding()
                        LazyVGrid(columns: adaptiveColumns, spacing: 30){
                            ForEach( model.getPark(parkName: "")?.badges?.sorted() ?? [""], id: \.self){image in
                                ZStack {
                                    Image(image)
                                        .scaleEffect(0.065)
                                        .foregroundColor(Color.white)
                                        .frame(width: 100, height: 100)
                                }
                            }
                        }.padding(.horizontal)
                            .padding([.bottom], 20)
                    }.onAppear{
                        AchievementsData().updateBadges()
                    }
                }.padding()
                VStack{
                    Spacer()
                    Spacer()
                }
                }.background(Color("lightBlue"))
            }
        }
}

struct childAchievements_Previews: PreviewProvider {
    static var previews: some View {
        childAchievements()
    }
}
