//
//  childDiscoverUnactive.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/20/23.
//

import SwiftUI

struct childDiscoverUnactive: View {
    @State var progress: CGFloat = 0.0

    
    var body: some View {
        NavigationStack{
            VStack{
                childCustomNavBar(navTitle: "Discover", color: "darkGray")
                Spacer()
                Image("lock")
                    .scaleEffect(1.75)
                    .padding()
                    .padding()
                    .padding()
                Spacer()
                
                ZStack (alignment: .leading){
                    ZStack (alignment: .topLeading) {
                        Rectangle()
                            .foregroundColor(Color("mediumGray"))
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(maxHeight: 250)
                    .overlay{
                        VStack{
                            Text("Locked Chapter")
                                .bold()
                                .foregroundColor(Color("lightGray"))
                                .fontDesign(.rounded)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.top,80)
                                .padding(.bottom,-10)
                                .font(.title2)
                           
                                HStack(spacing: 0){
                                    Text("Locked")
                                        .bold()
                                        .foregroundColor(Color("lightGray"))
                                        .fontDesign(.rounded)
                                        .font(.title3)
                                    Circle()
                                        .scaleEffect(0.4)
                                        .foregroundColor(Color("lightGray"))
                                    Text("Lesson")
                                        .bold()
                                        .foregroundColor(Color("lightGray"))
                                        .fontDesign(.rounded)
                                        .font(.title3)
                                }
                                .padding()
                            
                            
                            Button(action: {
                                
                            }, label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 7)
                                        .padding()
                                        .frame(minHeight: 80)
                                        .foregroundColor(Color("darkGray"))
                                    RoundedRectangle(cornerRadius: 7)
                                        .padding()
                                        .padding([.bottom],6)
                                        .frame(minHeight: 90)
                                        .foregroundColor(Color("lightGray"))
                                        .overlay{
                                            Text("START")
                                                .foregroundColor(Color("mediumGray"))
                                                .fontWeight(.heavy)
                                                .font(.title2)
                                        }
                                        
                                }
                                .padding([.bottom], 70)
                            })
                        }
                    }
                    
                    
                    
                }
                .padding([.horizontal], 25)
                Spacer()
              
            }
            .background(Color("lightGray"))

        }
        .background(Color("lightGray"))
    }
}

struct childDiscoverUnactive_Previews: PreviewProvider {
    @State static var childModel = CurrentLesson()
    @State static var chapterLabel: String? = "C1"
    @State static var lesson: [String]? = ["a", "b", "c"]
    @State static var lessonNumber: [String]? = ["a", "b", "c"]
    @State static var lessonName: [String]? = ["a", "b", "c"]
    static var previews: some View {
        childDiscoverUnactive()
    }
}
