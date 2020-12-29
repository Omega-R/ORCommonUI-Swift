import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ORCommonUI_SwiftTests.allTests),
    ]
}
#endif
