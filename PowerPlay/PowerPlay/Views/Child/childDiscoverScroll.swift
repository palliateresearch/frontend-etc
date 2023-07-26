//
//  childDiscoverScroll.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/20/23.
//

import SwiftUI

struct childDiscoverScroll: View {
    
    @State private var selectedTab: Int = 0
    @State private var color: String?
    @State var childModel = CurrentLesson()
    @State var chapterLabel: String? = "C1"
    @ObservedObject var childData: ChildViewData
    
    
    var body: some View {
        NavigationStack{
            TabView(selection: $selectedTab){
                childDiscoverActive(
                    progress: $childModel.progressC1,
                    childModel: $childModel,
                    childData: childData,
                    chapterLabel: "C1",
                    image: "sparkyWithClouds",
                    chapter: "The Power of Electricity",
                    lesson: ["Lesson 1: What is it about?","Lesson 2: What is it about?","Lesson 3: What is it about?"],
                    header: [["hello", "this", "is", "a", "test"], ["hello2", "this2", "is2", "a2", "test2"], ["hello3", "this3", "is3", "a3", "test3"]],
                    content: [["Electricity is a form of energy that flows through wires and makes things like lights, computers, and TVs work. It is like magic power that helps us do many things!", "Electricity is made in power plants using different sources like coal, water, or the sun. When we turn on a switch at home, it sends electricity through wires to our devices.", "Electricity powers our homes, schools, and cities, allowing us to use gadgets and appliances like phones, refrigerators, and microwaves. It also helps us see in the dark with bright lights!","While electricity is useful, we need to be careful. Always ask an adult for help when plugging or unplugging things and never touch electrical outlets or wires.", "We can help our planet by saving electricity. Remember to turn off lights and devices when not using them and use energy-efficient bulbs to save energy and protect the environment."], ["hello2", "this2", "is2", "a2", "test2"], ["hello3", "this3", "is3", "a3", "test3"]],
                    frameSize: [375,375,375,375,375],
                    lessonNumber: ["Lesson 1", "Lesson 2", "Lesson 3"],
                    lessonName: ["What is it about?", "What is it used for", "Why is it important"]
                ).tag(0)
                
                if (childModel.Ch1Done == true){
                    childDiscoverActive(
                        progress: $childModel.progressC2,
                        childModel: $childModel,
                        childData: childData,
                        chapterLabel: "C2",
                        image: "sparkyWithClouds",
                        chapter: "Generating Energy",
                        lesson: ["Lesson 1: What is it about?","Lesson 2: What is it about?","Lesson 3: What is it about?"],
                        header: [["hello4", "this4", "is4", "a4", "test4"], ["hello5", "this5", "is5", "a5", "test5"], ["hello6", "this6", "is6", "a6", "test6"]],
                        content: [["hello4", "this4", "is4", "a4", "test4"], ["hello5", "this5", "is5", "a5", "test5"], ["hello6", "this6", "is6", "a6", "test6"]],
                        frameSize: [400,400,400,400,400],
                        lessonNumber: ["Lesson 1", "Lesson 2", "Lesson 3"],
                        lessonName: ["What is it about?", "What is it used for", "Why is it important"]
                    ).tag(0)
                } else {
                    childDiscoverUnactive().tag(1)
                }

                if (childModel.Ch2Done == true){
                    childDiscoverActive(
                        progress: $childModel.progressC3,
                        childModel: $childModel,
                        childData: childData,
                        chapterLabel: "C3",
                        image: "sparkyWithClouds",
                        chapter: "Going Green",
                        lesson: ["Lesson 1: What is it about?","Lesson 2: What is it about?","Lesson 3: What is it about?"],
                        header: [["hello7", "this7", "is7", "a7", "test7"], ["hello8", "this8", "is8", "a8", "test8"], ["hello9", "this9", "is9", "a9", "test9"]],
                        content: [["hello7", "this7", "is7", "a7", "test7"], ["hello8", "this8", "is8", "a8", "test8"], ["hello9", "this9", "is9", "a9", "test9"]],
                        frameSize: [375,375,375,375,375],
                        lessonNumber: ["Lesson 1", "Lesson 2", "Lesson 3"],
                        lessonName: ["What is it about?", "What is it used for", "Why is it important"]
                    ).tag(0)
                } else {
                    childDiscoverUnactive().tag(1)
                }
                
            }
            .background((selectedTab == 0) ? Color("lightBlue") : Color("lightGray"))
            .tabViewStyle(PageTabViewStyle())
        }
        
        
        
    }
}

//struct childDiscoverScroll_Previews: PreviewProvider {
//    static var previews: some View {
//        childDiscoverScroll()
//    }
//}
