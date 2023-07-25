//
//  childDiscoverActive.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/20/23.
//

import SwiftUI

struct childDiscoverActive: View {
    
    @Binding var progress: CGFloat
    @Binding var childModel: CurrentLesson
    @State var chapterLabel: String?
    @State var image: String?
    @State var chapter: String?
    @State var lesson: [String]?
    @State var header: [[String]]?
    @State var content: [[String]]?
    @State var frameSize: [CGFloat]?
    @State var lessonNumber: [String]?
    @State var lessonName: [String]?
    
    var body: some View {
        NavigationStack{
            
            VStack{
                childCustomNavBar(navTitle: "Discover", color: "darkBlue")
                Spacer()
                Image("sparkyWithClouds")
                    .scaleEffect(2)
                    .padding()
                    .padding()
                    .padding()
                Spacer()
//                if childModel.lessonStatus.first == "C1L1"{
                    childStartLesson(
                        progress: $progress,
                        childModel: $childModel,
                        chapterLabel: $chapterLabel,
                        background: "darkBlue",
                        text: "aliceBlue",
                        progressDone: "lightningYellow",
                        shadow: "dropShadowBlue",
                        nextPage: childLesson(
                            image: image,
                            chapter: chapter,
                            lesson: lesson,
                            header: header,
                            content: content,
                            frameSize: frameSize,
                            childModel: $childModel,
                            chapterLabel: $chapterLabel
                        ),
                        chapter: chapter,
                        lesson: $lesson,
                        lessonNumber: $lessonNumber,
                        lessonName: $lessonName
                    )
//                } else if childModel.lessonStatus.first == "C1L2"{
//                    childStartLesson(
//                        progress: $progress,
//                        background: "darkBlue",
//                        text: "aliceBlue",
//                        progressDone: "lightningYellow",
//                        shadow: "dropShadowBlue",
//                        nextPage: childLesson(
//                            image: "sparkyWithClouds",
//                            chapter: "The Power of Electricity",
//                            lesson: "Lesson 1: What is it about?",
//                            header: ["hello2", "this2", "is2", "a2", "test2"],
//                            content: ["hello2", "this2", "is2", "a2", "test2"],
//                            frameSize: [375,375,375,375,375],
//                            childModel: $childModel
//                        )
//                    )
//                } else if childModel.lessonStatus.first == "C1L3"{
//                    childStartLesson(
//                        progress: $progress,
//                        background: "darkBlue",
//                        text: "aliceBlue",
//                        progressDone: "lightningYellow",
//                        shadow: "dropShadowBlue",
//                        nextPage: childLesson(
//                            image: "sparkyWithClouds",
//                            chapter: "The Power of Electricity",
//                            lesson: "Lesson 1: What is it about?",
//                            header: ["hello3", "this3", "is3", "a3", "test3"],
//                            content: ["hello3", "this3", "is3", "a3", "test3"],
//                            frameSize: [375,375,375,375,375],
//                            childModel: $childModel
//                        )
//                    )
//                } else if ((childModel.lessonStatus.first == "C2L1")){
//                    childStartLesson(
//                        progress: $progress,
//                        background: "darkBlue",
//                        text: "aliceBlue",
//                        progressDone: "lightningYellow",
//                        shadow: "dropShadowBlue",
//                        nextPage: childLesson(
//                            image: "sparkyWithClouds",
//                            chapter: "The Power of Electricity",
//                            lesson: "Lesson 1: What is it about?",
//                            header: ["hello4", "this4", "is4", "a4", "test4"],
//                            content: ["hello4", "this4", "is4", "a4", "test4"],
//                            frameSize: [375,375,375,375,375],
//                            childModel: $childModel
//                        )
//                    )
//                } else if childModel.lessonStatus.first == "C2L2"{
//                    childStartLesson(
//                        progress: $progress,
//                        background: "darkBlue",
//                        text: "aliceBlue",
//                        progressDone: "lightningYellow",
//                        shadow: "dropShadowBlue",
//                        nextPage: childLesson(
//                            image: "sparkyWithClouds",
//                            chapter: "The Power of Electricity",
//                            lesson: "Lesson 1: What is it about?",
//                            header: ["hello5", "this5", "is5", "a5", "test5"],
//                            content: ["hello5", "this5", "is5", "a5", "test5"],
//                            frameSize: [375,375,375,375,375],
//                            childModel: $childModel
//                        )
//                    )
//                }else {
//                    Text("Done!")
//                }
//
                Spacer()
              
            }
            .background(Color("lightBlue"))

        }
        .background(Color("lightBlue"))
    }
}

struct childDiscoverActive_Previews: PreviewProvider {
    @State static var progress: CGFloat = 0.5
    @State static var childModel = CurrentLesson()
    static var previews: some View {
        childDiscoverActive(progress: $progress, childModel: $childModel)
    }
}




