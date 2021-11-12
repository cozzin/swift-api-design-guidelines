import Foundation

final class MyNotificationCenter {
    
    private var observers: [String: NSObject] = [:]
    
    func add(_ observer: NSObject, forKeyPath keyPath: String) {
        observers[keyPath] = observer
    }
    
}

let center = MyNotificationCenter()
center.add(self, forKeyPath: "myKey")
