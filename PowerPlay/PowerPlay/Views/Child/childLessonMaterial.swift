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
    @State var lesson: [String]?
    @State var header: [[String]]?
    @State var content: [[String]]?
    @State var frameSize: [CGFloat]?
    @State private var currentIndex = 0
    @Binding var childModel: CurrentLesson
    @Binding var chapterLabel: String?
    
    
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
                        if (chapterLabel == "C1"){
                            Text(lesson![childModel.currentLessonCh1])
                                .bold()
                                .foregroundColor(Color("aliceBlue"))
                                .fontDesign(.rounded)
                                .font(.title3)
                                .padding()
                                .padding(.top, -30)
                        }
                        
                        if (chapterLabel == "C2"){
                            Text(lesson![childModel.currentLessonCh2])
                                .bold()
                                .foregroundColor(Color("aliceBlue"))
                                .fontDesign(.rounded)
                                .font(.title3)
                                .padding()
                                .padding(.top, -30)
                        }
                        
                        if (chapterLabel == "C3"){
                            Text(lesson![childModel.currentLessonCh3])
                                .bold()
                                .foregroundColor(Color("aliceBlue"))
                                .fontDesign(.rounded)
                                .font(.title3)
                                .padding()
                                .padding(.top, -30)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .top)
                    
                    if (chapterLabel == "C1"){
                        
                        Text(header![childModel.currentLessonCh1][currentIndex])
                            .padding()
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .bold()
                            .foregroundColor(Color("lightningYellow"))
                            .font(.title3)
                        //.opacity(currentIndex == 0 ? 1 : 0)
                        
                        
                        Text(content![childModel.currentLessonCh1][currentIndex])
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
                            if (currentIndex != (header![childModel.currentLessonCh1].count-1)){
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
                            } else if (currentIndex == (header![childModel.currentLessonCh1].count-1)) {
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
                    //here
                    if (chapterLabel == "C2"){
                        
                        Text(header![childModel.currentLessonCh2][currentIndex])
                            .padding()
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .bold()
                            .foregroundColor(Color("lightningYellow"))
                            .font(.title3)
                        //.opacity(currentIndex == 0 ? 1 : 0)
                        
                        
                        Text(content![childModel.currentLessonCh2][currentIndex])
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
                            if (currentIndex != (header![childModel.currentLessonCh2].count-1)){
                                Button(action: {
                                    currentIndex = (currentIndex + 1)
                                    print(childModel.progressC2)
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
                            } else if (currentIndex == (header![childModel.currentLessonCh2].count-1)) {
                                Button(action: {
                                    findNextLesson()
                                    presentationMode.wrappedValue.dismiss()
                                    
                                    print(childModel.progressC2)
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
                    if (chapterLabel == "C3"){
                        
                        Text(header![childModel.currentLessonCh3][currentIndex])
                            .padding()
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .bold()
                            .foregroundColor(Color("lightningYellow"))
                            .font(.title3)
                        //.opacity(currentIndex == 0 ? 1 : 0)
                        
                        
                        Text(content![childModel.currentLessonCh3][currentIndex])
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
                            if (currentIndex != (header![childModel.currentLessonCh3].count-1)){
                                Button(action: {
                                    currentIndex = (currentIndex + 1)
                                    print(childModel.progressC3)
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
                            } else if (currentIndex == (header![childModel.currentLessonCh3].count-1)) {
                                Button(action: {
                                    findNextLesson()
                                    presentationMode.wrappedValue.dismiss()
                                    
                                    print(childModel.progressC3)
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
        }
        .padding([.horizontal], 25)
    }
    
    func findNextLesson(){
        
        if (chapterLabel == "C1"){
            
            if (childModel.currentLessonCh1 == 2){
                childModel.Ch1Done = true
                childModel.currentLessonCh1 = 0
            } else {
                childModel.currentLessonCh1 = childModel.currentLessonCh1 + 1
            }
            
            if (childModel.currentLessonCh1 == 1){
                childModel.progressC1 = 0.33333333333
            } else if (childModel.currentLessonCh1 == 2) {
                childModel.progressC1 = 0.66666666666
            } else {
                childModel.progressC1 = 1.0
            }
        }
        if (chapterLabel == "C2"){
            
            if (childModel.currentLessonCh2 == 2){
                childModel.Ch2Done = true
                childModel.currentLessonCh2 = 0
            } else {
                childModel.currentLessonCh2 = childModel.currentLessonCh2 + 1
            }
            
            if (childModel.currentLessonCh2 == 1){
                childModel.progressC2 = 0.33333333333
            } else if (childModel.currentLessonCh2 == 2) {
                childModel.progressC2 = 0.66666666666
            } else {
                childModel.progressC2 = 1.0
            }
        }
        if (chapterLabel == "C3"){
            
            if (childModel.currentLessonCh3 == 2){
                childModel.Ch3Done = true
                childModel.currentLessonCh3 = 0
            } else {
                childModel.currentLessonCh3 = childModel.currentLessonCh3 + 1
            }
            
            if (childModel.currentLessonCh3 == 1){
                childModel.progressC3 = 0.33333333333
            } else if (childModel.currentLessonCh3 == 2) {
                childModel.progressC3 = 0.66666666666
            } else {
                childModel.progressC3 = 1.0
            }
        }
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
    @State static var childModel = CurrentLesson()
    @State static var chapterLabel: String? = "C1"
    static var previews: some View {
        childLessonMaterial(childModel: $childModel, chapterLabel: $chapterLabel)
    }
}
