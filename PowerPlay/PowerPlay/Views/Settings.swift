//
//  Settings.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/12/23.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Text("Settings")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                        .bold()
                        .padding(.vertical)
                    Spacer()
                    Spacer()
                    Spacer()
                    VStack{
                        Image("personfillyellow")
                            .aspectRatio(contentMode: .fill)
                            .scaleEffect(1.15)
                            .foregroundColor(Color("lightningYellow"))
                        Text(SettingsData().getName())
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.title2)
                            .bold()
                            .padding()
                    }
                }
                        HStack{
                            Text("Account Type")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title2)
                                .foregroundColor(Color("lightningYellow"))
                                .padding()
                            Text(String(SettingsData().getIsParent()))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .font(.title2)
                                .padding()
                        }
                        HStack{
                            Text("Username")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title2)
                                .foregroundColor(Color("lightningYellow"))
                                .padding()
                            Text(SettingsData().getUsername())
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .font(.title2)
                                .padding()
                        }
                        HStack{
                            Text("Park")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title2)
                                .foregroundColor(Color("lightningYellow"))
                                .padding()
                            Text(SettingsData().getPark())
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .font(.title2)
                                .padding()
                        }
                        HStack{
                            Text("Children")
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .font(.title2)
                                .foregroundColor(Color("lightningYellow"))
                                .padding()
                            let children = SettingsData().getChildren()
                            Text(children.joined(separator: ", "))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .font(.title2)
                                .padding()
                                }

                }
                Spacer()
                Spacer()
                Button{

                }label: {
                    Text("Logout")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
        }.padding().preferredColorScheme(.dark)
        }
    }


struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
