//
//  childStartLesson.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/20/23.
//

import SwiftUI
import AVFoundation

struct childStartLesson: View {
    
    @Binding var progress: CGFloat
    @Binding var childModel: CurrentLesson
    @Binding var chapterLabel: String?
    @State var background: String = "aliceBlue"
    @State var text: String = "black"
    @State var progressDone: String = "lightningYellow"
    @State var shadow: String = "dropShadowBlue"
    @State var nextPage: childLesson?
    @State var chapter: String?
    @Binding var lesson: [String]?
    @Binding var lessonNumber: [String]?
    @Binding var lessonName: [String]?
    @Binding var content: [[String]]?
    @State var audioPlayer: AVAudioPlayer?
  
    var body: some View {
        ZStack (alignment: .leading){
            ZStack (alignment: .topLeading) {
                Rectangle()
                    .foregroundColor(Color(background))
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .frame(maxHeight: 250)
            .overlay{
                VStack{
                    Text(chapter!)
                        .bold()
                        .foregroundColor(Color(text))
                        .fontDesign(.rounded)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top,80)
                        .padding(.bottom,-10)
                        .font(.title2)
                    if (chapterLabel == "C1"){
                        HStack(spacing: 0){
                            Text(lessonNumber![childModel.currentLessonCh1])
                                .bold()
                                .foregroundColor(Color(text))
                                .fontDesign(.rounded)
                                .font(.title3)
                            Circle()
                                .scaleEffect(0.4)
                                .foregroundColor(Color(text))
                            Text(lessonName![childModel.currentLessonCh1])
                                .bold()
                                .foregroundColor(Color(text))
                                .fontDesign(.rounded)
                                .font(.title3)
                        }
                        .padding()
                    
                    }
                    if (chapterLabel == "C2"){
                        HStack(spacing: 0){
                            Text(lessonNumber![childModel.currentLessonCh2])
                                .bold()
                                .foregroundColor(Color(text))
                                .fontDesign(.rounded)
                                .font(.title3)
                            Circle()
                                .scaleEffect(0.4)
                                .foregroundColor(Color(text))
                            Text(lessonName![childModel.currentLessonCh2])
                                .bold()
                                .foregroundColor(Color(text))
                                .fontDesign(.rounded)
                                .font(.title3)
                        }
                        .padding()
                    }
                    if (chapterLabel == "C3"){
                        HStack(spacing: 0){
                            Text(lessonNumber![childModel.currentLessonCh3])
                                .bold()
                                .foregroundColor(Color(text))
                                .fontDesign(.rounded)
                                .font(.title3)
                            Circle()
                                .scaleEffect(0.4)
                                .foregroundColor(Color(text))
                            Text(lessonName![childModel.currentLessonCh3])
                                .bold()
                                .foregroundColor(Color(text))
                                .fontDesign(.rounded)
                                .font(.title3)
                        }
                        .padding()
                    }
                    
                    HStack{
                        LineProgress(progress: $progress, progressDone: progressDone, shadow: shadow)
                            .padding([.bottom])
                            .padding([.horizontal])
                            .frame(maxWidth: 300)
                        if (chapterLabel == "C1"){
                            if (childModel.progressC1 == 0.33333333333){
                                Text("1 / 3")
                                    .padding([.vertical])
                                    .padding([.trailing])
                                    .foregroundColor(Color(text))
                                .bold()
                            }
                            else if (childModel.progressC1 == 0.66666666666){
                                Text("2 / 3")
                                    .padding([.vertical])
                                    .padding([.trailing])
                                    .foregroundColor(Color(text))
                                .bold()
                            }
                            else if (childModel.progressC1 == 1.0){
                                Text("3 / 3")
                                    .padding([.vertical])
                                    .padding([.trailing])
                                    .foregroundColor(Color(text))
                                .bold()
                            }
                            else {
                                Text("0 / 3")
                                    .padding([.vertical])
                                    .padding([.trailing])
                                    .foregroundColor(Color(text))
                                .bold()
                            }
                        }
                        if (chapterLabel == "C2"){
                            if (childModel.progressC2 == 0.33333333333){
                                Text("1 / 3")
                                    .padding([.vertical])
                                    .padding([.trailing])
                                    .foregroundColor(Color(text))
                                .bold()
                            }
                            else if (childModel.progressC2 == 0.66666666666){
                                Text("2 / 3")
                                    .padding([.vertical])
                                    .padding([.trailing])
                                    .foregroundColor(Color(text))
                                .bold()
                            }
                            else if (childModel.progressC2 == 1.0){
                                Text("3 / 3")
                                    .padding([.vertical])
                                    .padding([.trailing])
                                    .foregroundColor(Color(text))
                                .bold()
                            }
                            else {
                                Text("0 / 3")
                                    .padding([.vertical])
                                    .padding([.trailing])
                                    .foregroundColor(Color(text))
                                .bold()
                            }
                        }
                        if (chapterLabel == "C3"){
                            if (childModel.progressC3 == 0.33333333333){
                                Text("1 / 3")
                                    .padding([.vertical])
                                    .padding([.trailing])
                                    .foregroundColor(Color(text))
                                .bold()
                            }
                            else if (childModel.progressC3 == 0.66666666666){
                                Text("2 / 3")
                                    .padding([.vertical])
                                    .padding([.trailing])
                                    .foregroundColor(Color(text))
                                .bold()
                            }
                            else if (childModel.progressC3 == 1.0){
                                Text("3 / 3")
                                    .padding([.vertical])
                                    .padding([.trailing])
                                    .foregroundColor(Color(text))
                                .bold()
                            }
                            else {
                                Text("0 / 3")
                                    .padding([.vertical])
                                    .padding([.trailing])
                                    .foregroundColor(Color(text))
                                .bold()
                            }
                        }
                    }
                    .padding([.top], -5)
                    
//                    Button(action: {
//                        let apiKey = "56140ffb2cece3bdbe401f4ac3b2214c"
//
//                        let data = convertTextToSpeechStream(text: content![childModel.currentLessonCh1][0], apiKey: apiKey)
//
//                        do {
//                            if (data != nil){
//                                audioPlayer = try AVAudioPlayer(data: data!, fileTypeHint: "mp3")
//                                audioPlayer?.prepareToPlay()
//                                audioPlayer?.play()
//                            }
//                        } catch {
//                            print("Error playing audio: \(error.localizedDescription)")
//                        }
//                    }, label: {
                        NavigationLink(destination: nextPage, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 7)
                                    .padding()
                                    .frame(minHeight: 80)
                                    .foregroundColor(Color(shadow))
                                RoundedRectangle(cornerRadius: 7)
                                    .padding()
                                    .padding([.bottom],6)
                                    .frame(minHeight: 90)
                                    .foregroundColor(Color(text))
                                    .overlay{
                                        Text("START")
                                            .foregroundColor(Color(background))
                                            .fontWeight(.heavy)
                                            .font(.title2)
                                    }
                            }
                            .padding([.bottom], 70)
//                    })
                    
                    
//                        .onTapGesture{
//                            let apiKey = "56140ffb2cece3bdbe401f4ac3b2214c"
//                            convertTextToSpeechStream(text: content![childModel.currentLessonCh1][0], apiKey: apiKey)
//                        }
                    })
                }
            }
            
            
            
        }
        .padding([.horizontal], 25)
    }
}

struct childStartLesson_Previews: PreviewProvider {
    @State static var progress: CGFloat = 0.5
    @State static var childModel = CurrentLesson()
    @State static var chapterLabel: String? = "C1"
    @State static var lesson: [String]? = ["a", "b", "c"]
    @State static var lessonNumber: [String]? = ["a", "b", "c"]
    @State static var lessonName: [String]? = ["a", "b", "c"]
    @State static var content: [[String]]? = [["a", "b", "c"],["a", "b", "c"],["a", "b", "c"]]
    static var previews: some View {
        childStartLesson(progress: $progress, childModel: $childModel, chapterLabel: $chapterLabel, lesson: $lesson, lessonNumber: $lessonNumber, lessonName: $lessonName, content: $content)
    }
}

struct LineProgress: View {
    @Binding var progress: CGFloat
    
    @State var progressDone: String?
    @State var shadow: String?
    
    var currentPercentage: Int {
        Int(progress * 100)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .frame(width: geometry.size.width, height: 17)
                    .foregroundColor(Color(shadow!))
                
                Capsule()
                    .frame(width: geometry.size.width * progress, height: 17)
                    .foregroundColor(Color(progressDone!))
            }
            .frame(alignment: .center)
        }
            
    }
}
