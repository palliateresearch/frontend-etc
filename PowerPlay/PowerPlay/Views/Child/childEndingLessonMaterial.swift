//
//  childEndingLessonMaterial.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/20/23.
//

import SwiftUI

struct childEndingLessonMaterial: View {

    @State var chapter: String?
    @State var lesson: String?
    @State var header: String?
    @State var content: String?
    @State var frameSize: CGFloat?
    
    var body: some View {
        ZStack (alignment: .leading){
            ZStack (alignment: .topLeading) {
                Rectangle()
                    .foregroundColor(Color("darkBlue"))
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .frame(maxHeight: frameSize!)
            .overlay{
                VStack{
                    VStack{
                        Text(chapter!)
                            .bold()
                            .foregroundColor(Color("aliceBlue"))
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                            .font(.title2)
                        
                        Text(lesson!)
                            .bold()
                            .foregroundColor(Color("aliceBlue"))
                            .fontDesign(.rounded)
                            .font(.title3)
                            .padding()
                            .padding(.top, -30)
                    }
                    .frame(maxWidth: .infinity, alignment: .top)
                    
                    Text(header!)
                        .padding()
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                        .foregroundColor(Color("lightningYellow"))
                        .font(.title3)
                    Text(content!)
                        .padding(.horizontal,33)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("aliceBlue"))
                       
                    
                    HStack{
                        Button(action: {
                            
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 7)
                                    .padding()
                                    .frame(maxHeight: 80)
                                    .foregroundColor(Color("aliceBlue"))
                                RoundedRectangle(cornerRadius: 7)
                                    .padding()
                                    .padding([.bottom],10)
                                    .frame(maxHeight: 90)
                                    .foregroundColor(Color("dropShadowBlue"))
                                    .overlay{
                                        Text("BACK")
                                            .foregroundColor(Color("aliceBlue"))
                                            .fontWeight(.heavy)
                                            .font(.title2)
                                            .padding(.bottom, 7)
                                    }
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .top)
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 7)
                                    .padding()
                                    .frame(maxHeight: 80)
                                    .foregroundColor(Color("dropShadowBlue"))
                                RoundedRectangle(cornerRadius: 7)
                                    .padding()
                                    .padding([.bottom],10)
                                    .frame(maxHeight: 90)
                                    .foregroundColor(Color("aliceBlue"))
                                    .overlay{
                                        Text("DONE")
                                            .foregroundColor(Color("darkBlue"))
                                            .fontWeight(.heavy)
                                            .font(.title2)
                                            .padding(.bottom, 7)
                                    }
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .top)
                        })
                    }
                    
                }
            }
            
            
            
        }
        .padding([.horizontal], 25)
    }
}

struct childEndingLessonMaterial_Previews: PreviewProvider {
    static var previews: some View {
        childEndingLessonMaterial()
    }
}

