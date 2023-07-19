//
//  Lesson.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/14/23.
//

import SwiftUI

struct Lesson: View, Hashable {
    var experimentNumber: String?
    var lessonName: String?
    var paragraphHeader1: String?
    var paragraph1: String?
    var image1: String?
    var paragraphHeader2: String?
    var paragraph2: String?
    var image2: String?
    var paragraphHeader3: String?
    var paragraph3: String?
    var image3: String?
    
    init(experimentNumber: String? = nil, lessonName: String? = nil, paragraphHeader1: String? = nil, paragraph1: String? = nil, image1: String? = nil, paragraphHeader2: String? = nil, paragraph2: String? = nil, image2: String? = nil, paragraphHeader3: String? = nil, paragraph3: String? = nil, image3: String? = nil) {
        self.experimentNumber = experimentNumber
        self.lessonName = lessonName
        self.paragraphHeader1 = paragraphHeader1
        self.paragraph1 = paragraph1
        self.image1 = image1
        self.paragraphHeader2 = paragraphHeader2
        self.paragraph2 = paragraph2
        self.image2 = image2
        self.paragraphHeader3 = paragraphHeader3
        self.paragraph3 = paragraph3
        self.image3 = image3
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                Text(experimentNumber ?? "experiment")
                    .fontDesign(.rounded)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                ZStack(alignment: .leading){
                    ZStack (alignment: .topLeading) {
                        Rectangle()
                            .foregroundColor(Color("navyBlue"))
                        
                        Rectangle()
                            .fill(Color("lightningYellow"))
                            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 40, alignment: .top)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    VStack{
                        Text(lessonName ?? "lessonName")
                            .bold()
                            .fontDesign(.rounded)
                            .foregroundColor(Color.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.horizontal], 15)
                            .padding([.vertical], 7)
                            .font(.title3)
                        VStack{
                            Spacer()
                            Spacer()
                            Image(image1 ?? "Image1")
                                .frame(width: 300, height: 150)
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.7)
                                .padding(.vertical)
                                .clipped()
                            Spacer()
                            Spacer()
                            Text(paragraphHeader1 ?? "paragraphHeader1")
                                .bold()
                                .fontDesign(.rounded)
                                .foregroundColor(Color("lightningYellow"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.horizontal], 15)
                                .padding([.vertical], 7)
                                .font(.title3)
                            Text(paragraph1 ?? "paragraph1")
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                                .fontDesign(.rounded)
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.horizontal], 15)
                                .padding([.vertical], 7)
                                .font(.body)
                        }
                        VStack{
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Image(image2 ?? "Image2")
                                .frame(width: 300, height: 150)
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.7)
                                .padding(.vertical)
                                .clipped()
                            Spacer()
                            Spacer()
                            Text(paragraphHeader2 ?? "paragraphHeader2")
                                .bold()
                                .fontDesign(.rounded)
                                .foregroundColor(Color("lightningYellow"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.horizontal], 15)
                                .padding([.vertical], 7)
                                .font(.title3)
                            Text(paragraph2 ?? "paragraph2")
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                                .fontDesign(.rounded)
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.horizontal], 15)
                                .padding([.vertical], 7)
                                .font(.body)
                        }
                        VStack{
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Image(image3 ?? "Image3")
                                .frame(width: 300, height: 150)
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.7)
                                .padding(.vertical)
                                .clipped()
                            Spacer()
                            Spacer()
                            Text(paragraphHeader3 ?? "paragraphHeader3")
                                .bold()
                                .fontDesign(.rounded)
                                .foregroundColor(Color("lightningYellow"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.horizontal], 15)
                                .padding([.vertical], 7)
                                .font(.title3)
                            Text(paragraph3 ?? "paragraph3")
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                                .fontDesign(.rounded)
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.horizontal], 15)
                                .padding([.vertical], 7)
                                .font(.body)
                            VStack{
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                            }
                        }
                    }
                }
            }
        }
    }

        func hash(into hasher: inout Hasher) {
            hasher.combine(experimentNumber)
            hasher.combine(lessonName)
        }

        static func == (lhs: Lesson, rhs: Lesson) -> Bool {
            return lhs.experimentNumber == rhs.experimentNumber && lhs.lessonName == rhs.lessonName
        }
}

struct Lesson_Previews: PreviewProvider {
    static var previews: some View {
        Lesson().environment(\.colorScheme, .dark)
    }
}
