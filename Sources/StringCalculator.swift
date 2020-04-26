// Tollaga © 2020 - Jose Gil <jose.gil@tollaga.com>

final class StringCalculator {
    
    private static let defaultResult = 0
    private static let limit = 1000
    
    public func add(_ expresion: String) throws -> Int {
        let delimiters = ParseDelimiters().parse(expresion)
        var numbers = try ParseNumbers().parse(expresion, delimiters: delimiters)
        try checkNegatives(numbers)
        numbers = filter(numbers, byLimit: StringCalculator.limit)
        return numbers.reduce(StringCalculator.defaultResult, +)
    }
    
    // MARK: - Private
    
    private func checkNegatives(_ numbers: [Int]) throws {
        let negatives = numbers.filter( { $0 < 0 } )
        if !negatives.isEmpty {
            throw StringCalculatorError.negativesNotAllowed(negatives.description)
        }
    }
    
    private func filter(_ numbers: [Int], byLimit limit: Int) -> [Int] {
        return numbers.filter( { $0 <= limit } )
    }
}
