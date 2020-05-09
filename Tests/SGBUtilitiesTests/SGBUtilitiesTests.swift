
#if !os(watchOS)
import XCTest
@testable import SGBUtilities

final class SGBUtilitiesTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let deviceDescription = CurrentDevice.default.description()
        print(deviceDescription)
        XCTAssert(deviceDescription != "")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
#endif
