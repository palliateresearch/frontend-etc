//
//  childLesson.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/20/23.
//

import SwiftUI

struct childLesson: View {
    
    
    @State var image: String?
    @State var chapter: String?
    @State var lesson: [String]?
    @State var header: [[String]]?
    @State var content: [[String]]?
    @State var frameSize: [CGFloat]?
    @Binding var childModel: CurrentLesson
    @Binding var chapterLabel: String?
    
    var body: some View {
        NavigationStack{
            VStack{
                childCustomNavBar(navTitle: "Discover", color: "darkBlue")
                Spacer()
                Image(image!)
                    .scaleEffect(1.5)
                Spacer()
                childLessonMaterial(chapter: chapter!, lesson: lesson!, header: header!, content: content!, frameSize: frameSize!, childModel:$childModel, chapterLabel: $chapterLabel)
                Spacer()
                
            }
            .background(Color("lightBlue"))
        }
        .background(Color("lightBlue"))
        .navigationBarBackButtonHidden()
    }
}

struct childLesson_Previews: PreviewProvider {
    @State static var childModel = CurrentLesson()
    @State static var chapterLabel: String? = "C1"
    static var previews: some View {
        childLesson(childModel: $childModel, chapterLabel: $chapterLabel)
    }
}
