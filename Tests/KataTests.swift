// Tollaga © 2020 - Jose Gil <jose.gil@tollaga.com>

import XCTest
import Nimble

@testable import Kata

class KataTests: XCTestCase {
    let sut = StringCalculator()
      
    func test_add_givenEmpty_shouldReturnZero () throws {
        let result = sut.add("")
        expect(0).to(equal(result))
    }
    
    func test_add_givenZero_shouldReturnZero () throws {
        let result = sut.add("0")
        expect(0).to(equal(result))
    }
    
    func test_add_givenOne_shouldReturnOne () throws {
        let result = sut.add("1")
        expect(1).to(equal(result))
    }
    
    func test_add_givenOneAndTwo_shouldReturnThree () throws {
        let result = sut.add("1,2")
        expect(3).to(equal(result))
    }
    
    
}
