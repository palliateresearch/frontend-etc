//
//  Learning.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/17/23.
//

import SwiftUI

struct Learning: View {
//    var experimentNumber : String
//    var lessonName : String
    
    var body: some View {
        NavigationStack{
           // if(lessonName == "The Power of Electricity"){
                Lesson(experimentNumber: "Experiment 1", lessonName: "The Power of Electricity", paragraphHeader1: "What is Electricity?", paragraph1: "Electricity is the flow of tiny particles called electrons. These electrons carry energy.", image1: "Image1", paragraphHeader2: "Electrons", paragraph2: "Electron are the parts of an atom. Atoms are the tiny particles that make up everything. The movement of electrons from atom to atom is what creates energy.", image2: "Image2", paragraphHeader3: "Energy", paragraph3: "Electricity is a form of energy. Like light and heat, it can power things.", image3: "Image3")
            //}
        }
        }
    }
struct Learning_Previews: PreviewProvider {
    static var previews: some View {
        Learning().environment(\.colorScheme, .dark)
    }
}
