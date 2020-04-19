// Tollaga © 2020 - Jose Gil <jose.gil@tollaga.com>

final class StringCalculator {
    
    private static let delimiter = ","
    private static let defaultResult = 0
    
    public func add(_ expresion: String) -> Int {
        let numbers = obtainNumbers(expresion)
        return numbers.reduce(StringCalculator.defaultResult, +)
    }
    
    private func obtainNumbers(_ string: String) -> [Int] {
        let components = string.components(separatedBy: StringCalculator.delimiter)
        return components.map({ parseInt($0) })
    }
    
    private func parseInt(_ string: String) -> Int {
        return Int(string) ?? StringCalculator.defaultResult
    }
}
