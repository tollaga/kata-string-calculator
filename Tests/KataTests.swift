// Tollaga © 2020 - Jose Gil <jose.gil@tollaga.com>

import XCTest
import Nimble
import Fakery

@testable import Kata

class KataTests: XCTestCase {
    let sut = StringCalculator()
    let faker = Faker()
      
    func test_add_givenEmpty_shouldReturnZero () throws {
        let result = try sut.add("")
        
        expect(0).to(equal(result))
    }
    
    func test_add_givenZero_shouldReturnZero () throws {
        let result = try sut.add("0")
        
        expect(0).to(equal(result))
    }
    
    func test_add_givenOne_shouldReturnOne () throws {
        let result = try sut.add("1")
        
        expect(1).to(equal(result))
    }
    
    func test_add_givenOneAndTwo_shouldReturnThree () throws {
        let result = try sut.add("1,2")
        
        expect(3).to(equal(result))
    }
    
    func test_add_givenRadomNumbers_shouldReturnCorrectResult () throws {
        let numbers = givenRandomNumbers()
        let sum = numbers.reduce(0, +)
        let expresion = givenExpresion(numbers: numbers)

        let result = try sut.add(expresion)
        
        expect(sum).to(equal(result))
    }
    
    func test_add_givenNewlineDelimiter_shouldReturnCorrectResult () throws {
        let result = try sut.add("1\n2,3")
        expect(6).to(equal(result))
    }
    
    func test_add_givenSumWithDelimitierExpresion_shouldReturnCorrectResult () throws {
        let result = try sut.add("//;\n1;2")
        expect(3).to(equal(result))
    }
    
    func test_add_givenNegative_shouldReturnException () throws {
        expect {
            _ = try self.sut.add("-1")
        }.to(throwError { error in
            if case let StringCalculatorError.negativesNotAllowed(value) = error {
                expect("[-1]").to(equal(value))
            } else {
                fail()
            }
        })
    }
       
    func test_add_givenNegatives_shouldReturnException () throws {
        expect {
            _ = try self.sut.add("-1,2,-2")
        }.to(throwError { error in
            if case let StringCalculatorError.negativesNotAllowed(value) = error{
                expect("[-1, -2]").to(equal(value))
            } else {
                fail()
            }
        })
    }
    
    func test_add_givenBiggerNumber_shouldReturnCorrectResultIngnoringThatValue () throws {
        let result = try sut.add("2,1001")
        expect(2).to(equal(result))
    }
    
    func test_add_givenSumWithLongDelimitierExpresion_shouldReturnCorrectResult () throws {
        let result = try sut.add("//[***]\n1***2***3")
        expect(6).to(equal(result))
    }
    
    func test_add_givenSumWithLMultiDelimitierExpresion_shouldReturnCorrectResult () throws {
        let result = try sut.add("//[*][%]\n1*2%3")
        expect(6).to(equal(result))
    }
    
    // MARK: - Private
    
    private func givenRandomNumbers(limit: Int = 100) -> [Int] {
        let result = Array(repeating: 0, count: limit)
        return result.map({ _ in faker.number.randomInt(min: 0, max: limit) })
    }
    
    private func givenExpresion(numbers: [Int]) -> String {
        return numbers.map({ String($0) }).joined(separator: ",")
    }
}
