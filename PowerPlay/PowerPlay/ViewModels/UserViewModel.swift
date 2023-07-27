//
//  AchievementsViewModel.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/13/23.
//

import Foundation

class UserViewData: ObservableObject {
    @Published var id = UUID()
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var park: String = ""
    @Published var children: [String] = []
    @Published var isParent: Bool = false
    @Published var jsonData = ArduinoData()
    @Published var data: Float = 0.0
    var timer: Timer?

    
    func loadData(){
        
        guard let url = URL(string: "http://172.20.10.10:5000/get") else {return}
        
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            do{
                if let data = data {
                    let result = try JSONDecoder().decode(ArduinoData.self, from: data)
                    DispatchQueue.main.async{
                        self.jsonData = result
                        
                    }
                } else {
                    print("No Data")
                }
            } catch (let error) {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

