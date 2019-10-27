import XCTest
@testable import Rotoscope

final class WeakObjectTests: XCTestCase {
    func testExample() {
        let obj = Object()
        let obj2 = Object()
        let set = WeakObjectSet<Object>([])
        set.add(obj)
        print(set.map({ $0 }))
        set.add(obj2)
        print(set.map({ $0 }))
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

class Object: Hashable {
    static func == (lhs: Object, rhs: Object) -> Bool {
        lhs.value == rhs.value
    }
    
    var value: Int = 0
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}
