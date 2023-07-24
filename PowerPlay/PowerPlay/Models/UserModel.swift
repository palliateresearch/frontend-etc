import Foundation

struct userInfo: Identifiable {
    let id = UUID()
    let username: String
    let password: String
    let park: String
}

struct ArduinoData: Decodable {
    //let unix_timestamp: Int
    let totalEnergy: Float
    //let unique_id: String
    
    init() {
        //self.unix_timestamp = 200
        self.totalEnergy = 200
        //self.unique_id = "uniqe id"
    }
    
}







