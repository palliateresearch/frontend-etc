//
//  childMascot.swift
//  PowerPlay
//
//  Created by Valerie Kwan on 7/26/23.
//

import SwiftUI

struct ChildMascotFace: View{
//    let isBlinking : Bool
    let isEyebrows : Bool
    let isSad: Bool
    let isAngry: Bool
    let size : Double

    var body: some View{
        VStack(spacing: 0){
            HStack(spacing:0){
                Spacer()
                Spacer()
                Image("SparkyeyebrowL")
                    .rotationEffect(.degrees(isSad ? -10 : 0))
                    .rotationEffect(.degrees(isAngry ? 30 : 0))
                Spacer()
                Image("SparkyeyebrowR")
                    .rotationEffect(.degrees(isSad ? 10 : 0))
                    .rotationEffect(.degrees(isAngry ? -30 : 0))
                Spacer()
                Spacer()
            }.offset(y: isEyebrows ? size * -300: 0)
            Image("Sparkyeyes")
//                .scaleEffect(isBlinking ? 1: size * 300)
//                .opacity(isBlinking ? 1 : 0)
            Image("Sparkymouth")
                .padding(EdgeInsets(top: -size * 300, leading: 0, bottom: 0, trailing: size * 100))
                .scaleEffect(y: (isSad || isAngry) ? -1 : 1)
                .offset(y: (isSad || isAngry) ? (-size * 300) : 0)
        }.scaleEffect(size)
        }
    }

struct ChildMascot: View {
    @State private var isBlinking: Bool = false
    @State private var isEyebrows: Bool = false
    @State private var isSad: Bool = false
    @State private var isAngry: Bool = false
    @State private var isTilting : Bool = false
    @State var emotion: String

    let size : Double
        
        var body: some View {
            GeometryReader { geometry in
                ZStack(alignment: .center){
                    Image("Sparkybolt")
                        .scaleEffect(size)
                        .rotationEffect(.degrees(isTilting ? 5 : 0))
                    ChildMascotFace(
//                        isBlinking: isBlinking,
                        isEyebrows: isEyebrows,
                        isSad: isSad,
                        isAngry: isAngry,
                        size: size)
                        .offset(x: size * 40, y: -size * 200)
                }.frame(width: geometry.size.width, height: geometry.size.height)
                    .aspectRatio(contentMode: .fill)
                    .onAppear{
//                        withAnimation(.easeOut(duration: 0.05).delay(0.25).repeatCount(10)){
//                            isBlinking.toggle()
//                        }
                    }
                    .onAppear(perform: updateVariables)
                    .onAppear(perform: eyebrowToggle)
                    .onAppear(perform: tilt)
            }
        }
    
    func updateVariables(){
        if(emotion == "sad"){
                isSad = true
            }
        else if (emotion == "angry"){
            isAngry = true
        }
        }
    func eyebrowToggle() {
        isEyebrows = true
        
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            withAnimation(.easeOut(duration: 0.2).delay(0.25).repeatCount(5, autoreverses: true)){
                  isEyebrows.toggle()
              }
        }
    }
    func tilt() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            withAnimation(.easeOut(duration: 0.1).delay(0.25).repeatCount(5, autoreverses: true)){
                  isTilting.toggle()
              }
        }
    }
}

struct childMascot_Previews: PreviewProvider {
    static var previews: some View {
        ChildMascot(emotion: "sad", size: 0.2)
    }
}


