//
//  Learning.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/17/23.
//

import SwiftUI

struct Learning: View {
    var chapterTitle : String
    var lessonName : String
    
    var body: some View {
        NavigationStack{
            if(chapterTitle == "Renewable Energy"){
                Lesson(experimentNumber: lessonName, lessonName: chapterTitle, paragraphHeader1: "What is Renewable Energy?", paragraph1: "Renewable energy is energy produced by sources that can be naturally restored in a human .", image1: "Image1", paragraphHeader2: "Types of Renewable Energy", paragraph2: "There are several types of renewable energy. Wind power, solar power,  and hydroelectric(water) power are all common forms.", image2: "Image2", paragraphHeader3: "Why Renewable Energy", paragraph3: "Unrenewable energy sources are unsustainable and will run out. They also produce most of the carbon emissions in this world.", image3: "Image3")
            }
            else if(chapterTitle == "Generating Electricity"){
                Lesson(experimentNumber: lessonName, lessonName: chapterTitle, paragraphHeader1: "What is Electricity?", paragraph1: "Electricity is the flow of tiny particles called electrons. These electrons carry energy.", image1: "Image1", paragraphHeader2: "Electrons", paragraph2: "Electron are the parts of an atom. Atoms are the tiny particles that make up everything. The movement of electrons from atom to atom is what creates energy.", image2: "Image2", paragraphHeader3: "Energy", paragraph3: "Electricity is a form of energy. Like light and heat, it can power things.", image3: "Image3")
            }
            else if(chapterTitle == "Going Green"){
                Lesson(experimentNumber: lessonName, lessonName: chapterTitle, paragraphHeader1: "Reduce, Reuse, Recycle", paragraph1: "Recycling is the process of using waste, old items, to create new ones.", image1: "Image1", paragraphHeader2: "Conserving Water", paragraph2: "Saving water is a huge part of going green. Common practices of doing so include turning off the tap when brushing teeth, taking shorter showers, and collecting rainwater.", image2: "Image2", paragraphHeader3: "Why Reuse?", paragraph3: "A lot of materials in the world are unsustainable.", image3: "Image3")
            }
        }
        }
    }
struct Learning_Previews: PreviewProvider {
    static var previews: some View {
        Learning(chapterTitle: "Renewable Energy", lessonName: "Experiment 1").environment(\.colorScheme, .dark)
    }
}
