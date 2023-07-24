//
//  childStartLesson.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/20/23.
//

import SwiftUI

struct childStartLesson: View {
    
    @State var progress: CGFloat?
    @State var background: String?
    @State var text: String?
    @State var progressDone: String?
    @State var shadow: String?
    @State var nextPage: childLesson?
    @State var childModel = currentLesson()
  
    var body: some View {
        ZStack (alignment: .leading){
            ZStack (alignment: .topLeading) {
                Rectangle()
                    .foregroundColor(Color(background!))
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .frame(maxHeight: 250)
            .overlay{
                VStack{
                    Text("The Power of Electricity")
                        .bold()
                        .foregroundColor(Color(text!))
                        .fontDesign(.rounded)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top,80)
                        .padding(.bottom,-10)
                        .font(.title2)
                    HStack(spacing: 0){
                        Text("Lesson 1")
                            .bold()
                            .foregroundColor(Color(text!))
                            .fontDesign(.rounded)
                            .font(.title3)
                        Circle()
                            .scaleEffect(0.4)
                            .foregroundColor(Color(text!))
                        Text("What is it about?")
                            .bold()
                            .foregroundColor(Color(text!))
                            .fontDesign(.rounded)
                            .font(.title3)
                    }
                    .padding()
                    
                    HStack{
                        LineProgress(progress: progress!, progressDone: progressDone!, shadow: shadow!)
                            .padding([.bottom])
                            .padding([.horizontal])
                            .frame(maxWidth: 300)
                        Text("1 / 3")
                            .padding([.vertical])
                            .padding([.trailing])
                            .foregroundColor(Color(text!))
                            .bold()
                    }
                    .padding([.top], -5)
                    
                    Button(action: {
                        
                    }, label: {
                        
                    })
                    
                    NavigationLink(destination: nextPage, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 7)
                                .padding()
                                .frame(minHeight: 80)
                                .foregroundColor(Color(shadow!))
                            RoundedRectangle(cornerRadius: 7)
                                .padding()
                                .padding([.bottom],6)
                                .frame(minHeight: 90)
                                .foregroundColor(Color(text!))
                                .overlay{
                                    Text("START")
                                        .foregroundColor(Color(background!))
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
    }
}

struct childStartLesson_Previews: PreviewProvider {
    static var previews: some View {
        childStartLesson()
    }
}

struct LineProgress: View {
    @State var progress: CGFloat?
    
    @State var progressDone: String?
    @State var shadow: String?
    
    var currentPercentage: Int {
        Int(progress!*100)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .frame(width: geometry.size.width, height: 17)
                    .foregroundColor(Color(shadow!))
                
                Capsule()
                    .frame(width: geometry.size.width * progress!, height: 17)
                    .foregroundColor(Color(progressDone!))
            }
            .frame(alignment: .center)
        }
            
    }
}
