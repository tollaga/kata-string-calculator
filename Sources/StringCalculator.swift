// Tollaga © 2020 - Jose Gil <jose.gil@tollaga.com>

final class StringCalculator {
    
    private static let defaultResult = 0
    
    public func add(_ expresion: String) throws -> Int {
        let delimiters = ParseDelimiters().parse(expresion)
        let numbers = ParseNumbers().parse(expresion, delimiters: delimiters)
        try checkNegatives(numbers)
        return numbers.reduce(StringCalculator.defaultResult, +)
    }
    
    // MARK: - Private
    
    private func checkNegatives(_ numbers: [Int]) throws {
        let negatives = numbers.filter( {$0 < 0} )
        if !negatives.isEmpty {
            throw StringCalculatorError.negativesNotAllowed(negatives.description)
        }
    }
}
