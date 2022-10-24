import XCTest
@testable import SGBUtilities

enum TestCaseError: Error {
    case testError(String)
}

final class SGBUtilitiesTests: XCTestCase {
    
    func testHexingOfData() {
        guard let randomData = try? secureRandomData(count: 8) else {
            XCTFail("Unable to generate random data.")
            return
        }
        let hexed = randomData.hexValue
        XCTAssert(hexed.count == 16)
    }
    
    
    // MARK: - Test Case Helpers
    
    /// This code comes from [advancedswift.com](https://www.advancedswift.com/secure-random-number-swift/#secure-random-data).
    func secureRandomData(count: Int) throws -> Data {
        var bytes = [Int8](repeating: 0, count: count)

        // Fill bytes with secure random data
        let status = SecRandomCopyBytes(
            kSecRandomDefault,
            count,
            &bytes
        )
        
        // A status of errSecSuccess indicates success
        if status == errSecSuccess {
            // Convert bytes to Data
            let data = Data(bytes: bytes, count: count)
            return data
        }
        else {
            // Handle error
            throw TestCaseError.testError("Error")
        }
    }
    
}
