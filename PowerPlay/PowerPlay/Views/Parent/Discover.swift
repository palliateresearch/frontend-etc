//
//  Discover.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/12/23.
//

import SwiftUI

struct Discover: View {
    
    var body: some View {
        NavigationStack{
            ScrollView{
                
                Text("Discoåver")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontDesign(.rounded)
                    .font(.largeTitle)
                    .bold()
                    .padding(.vertical)
                
                Chapters(chapterTitle: "Renewable Energy", icon: "lightbulb")
                
                Group{
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                Chapters(chapterTitle: "Generating Electricity", icon: "bolt.fill")
                
                Group{
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                Chapters(chapterTitle: "Going Green", icon: "leaf.arrow.triangle.circlepath")
                    .onTapGesture {
                        
                    }
                
            }.padding()
            .background(Color("darkModeBackground"))
        }
        .preferredColorScheme(.dark)
        
    }
}

struct Chapters: View{
    @State private var isShowingAnotherView = false
    
    var chapterTitle: String
    var icon: String
    
    var body: some View {
        NavigationStack{
            VStack{
                Text(chapterTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title3)
                    .fontDesign(.rounded)
                    .bold()
                
                ScrollView(.horizontal) {
                    HStack(spacing: 5) {
//                        Lessons(icon: icon, lessonName: "Experiment 1", lessonView: Learning())
//                        Lessons(icon: icon, lessonName: "Experiment 2", lessonView: Learning())
//                        Lessons(icon: icon,lessonName: "Experiment 3", lessonView: Learning())
                        Lessons(icon: icon, chapterTitle: chapterTitle, lessonName: "Experiment 1", lessonView: Learning(chapterTitle: chapterTitle, lessonName: "Experiment 1"))
                        Lessons(icon: icon, chapterTitle: chapterTitle, lessonName: "Experiment 2", lessonView: Learning(chapterTitle: chapterTitle, lessonName: "Experiment 2"))
                        Lessons(icon: icon,chapterTitle: chapterTitle, lessonName: "Experiment 3", lessonView: Learning(chapterTitle: chapterTitle, lessonName: "Experiment 3"))
                        
                    }
                    
                }.scrollIndicators(.visible)
                    .padding([.bottom])
            }
        }
    }
}

struct Lessons: View{
    
    @State private var isShowingAnotherView = false
    var icon: String
    var chapterTitle: String
    var lessonName: String
    var lessonView : any View
    
    var body: some View {
        Button(action: {
            isShowingAnotherView = true
        }) {
            ZStack {
                ZStack (alignment: .bottomLeading) {
                    Rectangle()
                        .foregroundColor(Color("navyBlue"))
                    
                    Rectangle()
                        .fill(Color("lightningYellow"))
                        .frame(minWidth: 165, maxWidth: .infinity, maxHeight: 40, alignment: .top)
                        .overlay{
                            HStack{
                                Image(systemName:"book.closed")
                                    .scaleEffect(1)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color.black)
                                Text(lessonName)
                                    .foregroundColor(.black)
                                    .fontDesign(.rounded)
                                
                            }
                            
                        }
                    
                }
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                
                VStack{
                    HStack{
                        VStack{
                            
                            Image(systemName:icon)
                                .foregroundColor(Color("lightningYellow"))
                                .font(.system(size: 60))
                                .bold()
                            
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            
                        }
                        .padding()
                    }
                }
            }
        }
        NavigationLink(destination: Learning(chapterTitle: chapterTitle, lessonName: lessonName), isActive: $isShowingAnotherView) {
            EmptyView()
        }
    }
}

struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover()
    }
}
