//
//  UtilityViews.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/25/23.
//

import SwiftUI

struct ChildLessonBackNextDoneButton: View {
    let title:String
    let titleColor:Color
    let foregroundColor:Color
    let shadowColor:Color
    let action:()->()

    var body: some View {
        Button(action: {
            action()
        }, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 7)
                    .padding()
                    .frame(maxHeight: 80)
                    .foregroundColor(foregroundColor)
                RoundedRectangle(cornerRadius: 7)
                    .padding()
                    .padding([.bottom],10)
                    .frame(maxHeight: 90)
                    .foregroundColor(shadowColor)
                    .overlay{
                        Text(title)
                            .foregroundColor(foregroundColor)
                            .fontWeight(.heavy)
                            .font(.title2)
                            .padding(.bottom, 7)
                    }
                
            }
            .frame(maxWidth: .infinity, alignment: .top)
            
        })
    }
}

//struct ChildLessonBackNextDoneButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ChildLessonBackNextDoneButton(title: "Hello World", foregroundColor: .black, shadow: .black) {
//            // do nothing!
//        }
//    }
//}

//struct UtilityViews: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct UtilityViews_Previews: PreviewProvider {
//    static var previews: some View {
//        UtilityViews()
//    }
//}
