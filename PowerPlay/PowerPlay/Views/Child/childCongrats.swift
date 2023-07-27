//
//  childCongrats.swift
//  PowerPlay
//
//  Created by Valerie Kwan on 7/21/23.
//

import SwiftUI

struct childCongrats: View {
    @State private var achievementsViewActive = false
    @State private var finished = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    Spacer()
//                    Image("Sparky")
//                        .scaleEffect(0.2)
//                        .frame(width: 200, height: 300)
//                        .aspectRatio(contentMode: .fit)
//                        .padding()
                    ChildMascot(emotion: "", size: 0.2)
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color("aliceBlue"))
                            .frame(maxWidth: .infinity, maxHeight: 85)
                        Text("CONGRATS!")
                            .foregroundColor(Color("darkBlue"))
                            .font(.system(size: 50))
                            .fontWeight(.heavy)
                            .fontDesign(.rounded)
                    }.padding()
                    Text("You have completed")
                        .foregroundColor(Color("darkBlue"))
                        .font(.system(size: 30))
                        .fontWeight(.heavy)
                        .fontDesign(.rounded)
                        .multilineTextAlignment(.center)
                    Text("a lesson!")
                        .foregroundColor(Color("darkBlue"))
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .fontDesign(.rounded)
                        .multilineTextAlignment(.center)
                    Spacer()
                    Button(action: {
                        achievementsViewActive = true
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 7)
                                .padding()
                                .frame(minHeight: 80)
                                .foregroundColor(Color("dropShadowBlue"))
                            RoundedRectangle(cornerRadius: 7)
                                .padding()
                                .padding([.bottom],6)
                                .frame(minHeight: 90)
                                .foregroundColor(Color("darkBlue"))
                                .overlay{
                                    Text("FINISHED")
                                        .foregroundColor(Color.white)
                                        .fontWeight(.heavy)
                                        .font(.title2)
                                        .fontDesign(.rounded)
                                }
                            
                        }
                    }).frame(maxHeight: 75)
                }.padding()
                
                EmitterView()
                .scaleEffect(anchor: .top)
                .ignoresSafeArea()
                .opacity(finished ? 0 : 1)
            }.background(Color("lightBlue"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
            .fullScreenCover(isPresented: $achievementsViewActive) {
                    childContentView()
            }
        .onAppear(perform:doAnimation)
    }
    
    func doAnimation(){
        finished = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            withAnimation(.easeInOut(duration: 1.5)){
                finished = true
            }
        }
    }
}

struct childCongrats_Previews: PreviewProvider {
    static var previews: some View {
//        childHome()
        childCongrats()
    }
}

func getRect() -> CGRect{
    return UIScreen.main.bounds
}

struct EmitterView: UIViewRepresentable{
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    func makeUIView(context: Context) -> UIView{
        let view = UIView()
        view.backgroundColor = .clear
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterShape = .line
        emitterLayer.emitterCells = createEmitterCells()
        
        emitterLayer.emitterSize = CGSize(width: getRect().width, height: 1)
        emitterLayer.emitterPosition = CGPoint(x: getRect().width / 2, y: 0)
        
        view.layer.addSublayer(emitterLayer)
        return view
    }
    
    func createEmitterCells() -> [CAEmitterCell]{
        var emitterCells: [CAEmitterCell] = []
        for index in 1...12{
            let cell = CAEmitterCell()
            
            cell.contents = UIImage(named: getImage(index: index))?.cgImage
            cell.color = getColor().cgColor
            
            cell.birthRate = 4.5
            cell.lifetime = 20
            cell.velocity = 120
            cell.scale = 0.01
            cell.scaleRange = 0.05
            cell.emissionLongitude = .pi
            cell.emissionRange = 0.5
            cell.spin = 3.5
            cell.spinRange = 1
            
            cell.yAcceleration = 40
            
            emitterCells.append(cell)
        }
        
        return emitterCells
    }
    
    func getColor()-> UIColor{
        let colors: [UIColor] = [UIColor(Color("aliceBlue")), UIColor(Color("lightningYellow")), UIColor(Color("darkBlue")), UIColor(Color("lightBlue"))]
        return colors.randomElement()!
    }
    
    func getImage(index: Int) -> String{
        if index < 6{
            return "Sparkybolt"
        }
        else if index > 7 && index <= 8{
            return "SparkyeyebrowL"
        }
        else{
            return "Sparkymouth"
        }
    }
    
}
