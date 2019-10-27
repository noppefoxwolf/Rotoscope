import XCTest
@testable import Rotoscope

final class WeakObjectTests: XCTestCase {
    func testExample() {
        let obj = Object()
        let set = WeakObjectSet<Object>([])
        set.add(obj)
        set.add(obj)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

class Object {
    
}
