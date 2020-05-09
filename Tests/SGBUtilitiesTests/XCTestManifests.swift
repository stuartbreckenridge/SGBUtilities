
#if  !os(watchOS) && !canImport(ObjectiveC)
import XCTest


public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SGBUtilitiesTests.allTests),
    ]
}
#endif
