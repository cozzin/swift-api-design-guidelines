import Foundation

struct Storage {
    
    func doSomething() -> (reallocated: Bool, capacityChanged: Bool) {
        return (true, false)
    }
    
}

let storage = Storage()
let result = storage.doSomething()

result.reallocated
result.capacityChanged

var values: [Any] = [1, "a"]
values.append(contentsOf: [2, 3, 4])
