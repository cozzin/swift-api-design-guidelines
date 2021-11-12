import Foundation

struct Box {
    
    private let rawValue: Int
    
    init(_ rawValue: Int) {
        self.rawValue = rawValue
    }
    
    func value() -> Int? {
        rawValue
    }
    
    func value() -> String? {
        "\(rawValue)"
    }
}

let myBox = Box(100)

myBox.value() as Int?
myBox.value() as String?

let intBoxValue: Int? = myBox.value()
