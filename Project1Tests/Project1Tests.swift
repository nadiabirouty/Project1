import XCTest
@testable import Project1

class GOLTests: XCTestCase {
    
    var states: [[Bool]] = [
        [false, false, true],
        [true, true, true],
        [false, true, true]
    ]

    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testGOL() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let nextStates: [[Bool]] = nextCellStates(self.states)
        let expected: [[Bool]] = [
            [false, false, true],
            [true, false, false],
            [true, false, true]
        ]
        XCTAssertEqual(expected, nextStates)
    }
    
    func testFluctuating(){
        var horizontal: [[Bool]] = [
            [false, true, false],
            [false, true, false],
            [false, true, false]
        ]
        let nextStates: [[Bool]] = nextCellStates(horizontal)
        let expected: [[Bool]] = [
            [false, false, false],
            [true, true, true],
            [false, false, false]
        ]
        XCTAssertEqual(expected, nextStates)
    }
    
    func testDiamond(){
        var diamond: [[Bool]] = [
            [false, true, false],
            [true, false, true],
            [false, true, false]
        ]
        let nextStates: [[Bool]] = nextCellStates(diamond)
        XCTAssertEqual(diamond, nextStates)
    }
    func testChecker(){
        var checker: [[Bool]] = [
            [true, true, false, false],
            [true, true, false, false],
            [false, false, true, true],
            [false, false, true, true]
        ]
        let nextStates: [[Bool]] = nextCellStates(checker)
        let expected: [[Bool]] = [
            [true, true, false, false],
            [true, false, false, false],
            [false, false, false, true],
            [false, false, true, true]
        ]
        XCTAssertEqual(expected, nextStates)
    }
}

class LRUCacheTests: XCTestCase {

    func testBasic() {
        let cache = LRUCache<Int, String>(capacity: 2)
        XCTAssertNil(cache.get(3))

        cache.set(3, v: "Hello")
        let s = cache.get(3)
        XCTAssertNotNil(s)
        XCTAssertEqual(s!, "Hello")
    }

    func testMiss() {
        let cache = LRUCache<Int, String>(capacity: 2)
        cache.set(3, v: "Hello")
        cache.set(2, v: "World!")
        cache.set(4, v: "Swift")
        XCTAssertNil(cache.get(3))
        XCTAssertEqual(cache.get(2)!, "World!")
    }
    
    func testNoCapacity() {
        let cache = LRUCache<Int, String>(capacity: 0)
        cache.set(3, v: "Hello")
        XCTAssertNil(cache.get(3))
    }
    
    func testGetNonExistentKey(){
        let cache = LRUCache<Int, String>(capacity: 2)
        cache.set(3, v: "Hello")
        cache.set(2, v: "World")
        XCTAssertNil(cache.get(20))
    }
}
