import SwiftUI
import ConfettiSwiftUI

@main
struct PowerPlayApp: App {
    @StateObject private var pv = PV()
    var model = TestModel()
    var body: some Scene {
        WindowGroup {
            childContentView()
//            if let choose = model.myUsers.last?.isParent {
//                if (choose) {
//                    StartView().environmentObject(pv)
//                } else {
//                    childStartView().environmentObject(pv)
//                }
//
//            } else {
//                childStartView().environmentObject(pv)
//            }
        }
    }
}

