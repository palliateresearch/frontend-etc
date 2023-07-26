//
//  childModel.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/21/23.
//

import Foundation

struct CurrentLesson {
    var lessonStatus: [String] = ["C1L1", "C1L2", "C1L3", "C2L1", "C2L2", "C2L3", "C3L1", "C3L2", "C3L3"]
    var progressC1: CGFloat = 0.0
    var progressC2: CGFloat = 0.0
    var progressC3: CGFloat = 0.0
    var currentLessonCh1: Int = 0
    var currentLessonCh2: Int = 0
    var currentLessonCh3: Int = 0
    var Ch1Done: Bool = false
    var Ch2Done: Bool = false
    var Ch3Done: Bool = false
    var isToggleOn: Bool = false
}

struct LessonQuestion {
    let header:String
    let content:String
}

struct LessonModel {
    let questions:[LessonQuestion]
}

struct ChapterModel {
    var lessons:[LessonModel]
}

var lessonOneQuestions = [
    LessonQuestion(header: "this", content: "this"),
    LessonQuestion(header: "is", content: "this"),
    LessonQuestion(header: "a", content: "this"),
    LessonQuestion(header: "test", content: "this")
]

var lessonTwoQuestions = [
    LessonQuestion(header: "this2", content: "this2"),
    LessonQuestion(header: "is2", content: "this2"),
    LessonQuestion(header: "a2", content: "this2"),
    LessonQuestion(header: "test2", content: "this2")
]

var lessonThreeQuestions = [
    LessonQuestion(header: "this3", content: "this3"),
    LessonQuestion(header: "is3", content: "this3"),
    LessonQuestion(header: "a3", content: "this3"),
    LessonQuestion(header: "test3", content: "this3")
]

var lessonOne = LessonModel(questions:lessonOneQuestions)
var lessonTwo = LessonModel(questions:lessonOneQuestions)
var lessonThree = LessonModel(questions:lessonOneQuestions)

var myModel = ChapterModel(lessons: [
    lessonOne,
    lessonTwo,
    lessonThree
])
