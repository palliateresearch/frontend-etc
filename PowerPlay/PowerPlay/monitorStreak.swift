import Combine
import CoreData

class monitorStreak: ObservableObject {
    var model = TestModel()
    @Published var monitoredValue: Float = 0
    private var timer: AnyCancellable?

    init() {
        timer = Timer.publish(every: 60, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.checkIntegerValue()
            }
    }

    private func checkIntegerValue() {
        guard let coreDataObject = fetchCoreDataObject() else {
            return
        }

        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: date)
        let dayOfMonth = components.day
        
        // Update the monitored value
        monitoredValue = coreDataObject.wattHrsPerDay?[dayOfMonth ?? 0] ?? 0
        
        
        
    }

    private func fetchCoreDataObject() -> Park? {
        guard !model.myParks.isEmpty else {
            return nil
        }

        return model.myParks[0]
    }
}
