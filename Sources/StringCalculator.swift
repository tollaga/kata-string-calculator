// Tollaga © 2020 - Jose Gil <jose.gil@tollaga.com>

final class StringCalculator {
    
    private static let defaultResult = 0
    
    public func add(_ expresion: String) -> Int {
        let numbers = ParseNumbers().parse(expresion)
        return numbers.reduce(StringCalculator.defaultResult, +)
    }
}
