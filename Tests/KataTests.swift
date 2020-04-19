// Tollaga © 2020 - Jose Gil <jose.gil@tollaga.com>

import XCTest
import Nimble
import Fakery

@testable import Kata

class KataTests: XCTestCase {
    let sut = StringCalculator()
    let faker = Faker()
      
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
    
    func test_add_givenRadomNumbers_shouldReturnCorrectResult () throws {
        let numbers = givenRandomNumbers()
        let sum = numbers.reduce(0, +)
        let expresion = givenExpresion(numbers: numbers)

        let result = sut.add(expresion)
        
        expect(sum).to(equal(result))
    }
    
    private func givenRandomNumbers(limit: Int = 100) -> [Int] {
        let result = Array(repeating: 0, count: limit)
        return result.map({ _ in faker.number.randomInt(min: 0, max: limit) })
    }
    
    private func givenExpresion(numbers: [Int]) -> String {
        return numbers.map({ String($0) }).joined(separator: ",")
    }
}
