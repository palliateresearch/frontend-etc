//
//  childLessonMaterial.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/20/23.
//

import SwiftUI

struct childLessonMaterial: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showNewPage = false
    
    @State var chapter: String?
    @State var lesson: String?
    @State var header: [String]?
    @State var content: [String]?
    @State var frameSize: [CGFloat]?
    @State private var currentIndex = 0
    @State var childModel = currentLesson()
    @State var firstKeyWithFalseValue: String?
    
    
    var body: some View {
        ZStack (alignment: .leading){
            ZStack (alignment: .topLeading) {
                Rectangle()
                    .foregroundColor(Color("darkBlue"))
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .frame(maxHeight: frameSize![currentIndex])
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
                    
                    Text(header![currentIndex])
                        .padding()
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                        .foregroundColor(Color("lightningYellow"))
                        .font(.title3)
                        //.opacity(currentIndex == 0 ? 1 : 0)
                        
                    
                    Text(content![currentIndex])
                        .padding(.horizontal,33)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("aliceBlue"))
                        //.opacity(currentIndex == 0 ? 1 : 0)
                  
                    
                    HStack{
                        Button(action: {
                            prevText()
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
                        if (currentIndex != (header!.count-1)){
                            Button(action: {
                                currentIndex = (currentIndex + 1)
                                print(childModel.progressC1)
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
                                            Text("NEXT")
                                                .foregroundColor(Color("darkBlue"))
                                                .fontWeight(.heavy)
                                                .font(.title2)
                                                .padding(.bottom, 7)
                                        }
                                    
                                }
                                .frame(maxWidth: .infinity, alignment: .top)
                            })
                        } else if (currentIndex == (header!.count-1)) {
                                Button(action: {
                                    findNextLesson()
                                    presentationMode.wrappedValue.dismiss()
                                    print(childModel.progressC1)
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
        }
        .padding([.horizontal], 25)
    }
    
    func findNextLesson(){

        firstKeyWithFalseValue = childModel.lessonStatus.first
        print(firstKeyWithFalseValue!)
        
        if (firstKeyWithFalseValue == "C1L1"){
            childModel.progressC1 = 0.33333333333
        }
        else if (firstKeyWithFalseValue == "C1L2"){
            childModel.progressC1 = 0.66666666666
        }
        else if (firstKeyWithFalseValue == "C1L3"){
            childModel.progressC1 = 1.0
        }
        else if (firstKeyWithFalseValue == "C2L1"){
            childModel.progressC1 = 0.33333333333
        }
        else if (firstKeyWithFalseValue == "C2L2"){
            childModel.progressC1 = 0.66666666666
        }
        else if (firstKeyWithFalseValue == "C2L3"){
            childModel.progressC1 = 1.0
        }
        else if (firstKeyWithFalseValue == "C3L1"){
            childModel.progressC1 = 0.33333333333
        }
        else if (firstKeyWithFalseValue == "C3L2"){
            childModel.progressC1 = 0.66666666666
        }
        else if (firstKeyWithFalseValue == "C3L3"){
            childModel.progressC1 = 1.0
        }
        
        childModel.lessonStatus.removeFirst()
    }
    
    func prevText() {
        if (currentIndex==0){
            presentationMode.wrappedValue.dismiss()
        } else {
            currentIndex = (currentIndex - 1)
        }
    }
}

struct childLessonMaterial_Previews: PreviewProvider {
    static var previews: some View {
        childLessonMaterial()
    }
}
