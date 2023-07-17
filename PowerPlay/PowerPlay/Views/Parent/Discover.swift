//
//  Discover.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/12/23.
//

import SwiftUI

struct Discover: View {
    @State var progress: CGFloat = 0.75
    var body: some View {
        NavigationStack{
            ScrollView{
                
                Text("Discover")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle)
                    .bold()
                    .padding(.vertical)
                
                Chapters(chapterTitle: "Renewable Energy", icon: "lightbulb")
                
                Group{
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                Chapters(chapterTitle: "Generating Electricity", icon: "bolt.fill")
                
                Group{
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                Chapters(chapterTitle: "Going Green", icon: "leaf.arrow.triangle.circlepath")
                    .onTapGesture {
                        
                    }
                
            }.padding()
            .background(Color("darkModeBackground"))
        }.preferredColorScheme(.dark)
        
    }
}

struct Chapters: View{
    
    var chapterTitle: String
    var icon: String
    
    var body: some View {
        VStack{
            Text(chapterTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title3)
                .bold()
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ZStack {
                        ZStack (alignment: .bottomLeading) {
                            Rectangle()
                                .foregroundColor(Color("navyBlue"))
                            
                            Rectangle()
                                .fill(Color("lightningYellow"))
                                .frame(minWidth: 165, maxWidth: .infinity, maxHeight: 40, alignment: .top)
                                .overlay{
                                    HStack{
                                        Image(systemName:"book.closed")
                                            .scaleEffect(1)
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(Color.black)
                                        Text("Experiment 1")
                                            .foregroundColor(.black)
                                        
                                    }
                                    
                                }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        VStack{
                            HStack{
                                VStack{
                                    
                                    Image(systemName:icon)
                                        .foregroundColor(Color("lightningYellow"))
                                        .font(.system(size: 60))
                                        .bold()
                                    
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    
                                }
                                .padding()
                            }
                        }
                    }
                    
                    ZStack {
                        ZStack (alignment: .bottomLeading) {
                            Rectangle()
                                .foregroundColor(Color("navyBlue"))
                            
                            Rectangle()
                                .fill(Color("lightningYellow"))
                                .frame(minWidth: 165, maxWidth: .infinity, maxHeight: 40, alignment: .top)
                                .overlay{
                                    HStack{
                                        Image(systemName:"book.closed")
                                            .scaleEffect(1)
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(Color.black)
                                        Text("Experiment 2")
                                            .foregroundColor(.black)
                                        
                                    }
                                    
                                }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        VStack{
                            HStack{
                                VStack{
                                    
                                    Image(systemName:icon)
                                        .foregroundColor(Color("lightningYellow"))
                                        .font(.system(size: 60))
                                        .bold()
                                    
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    
                                }
                                .padding()
                            }
                        }
                    }
                    
                    ZStack {
                        ZStack (alignment: .bottomLeading) {
                            Rectangle()
                                .foregroundColor(Color("navyBlue"))
                            
                            Rectangle()
                                .fill(Color("lightningYellow"))
                                .frame(minWidth: 165, maxWidth: .infinity, maxHeight: 40, alignment: .top)
                                .overlay{
                                    HStack{
                                        Image(systemName:"book.closed")
                                            .scaleEffect(1)
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(Color.black)
                                        Text("Experiment 3")
                                            .foregroundColor(.black)
                                        
                                    }
                                    
                                }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        VStack{
                            HStack{
                                VStack{
                                    
                                    Image(systemName:icon)
                                        .foregroundColor(Color("lightningYellow"))
                                        .font(.system(size: 60))
                                        .bold()
                                    
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    
                                }
                                .padding()
                            }
                        }
                    }
                    
                }
                
            }.scrollIndicators(.visible)
                .padding([.bottom])
        }
    }
}

struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover()
    }
}
