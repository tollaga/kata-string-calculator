// Tollaga © 2020 - Jose Gil <jose.gil@tollaga.com>

final class ParseNumber {
    
    private static let defaultResult = 0
    
    public func parse(_ string: String) -> Int {
        return Int(string) ?? ParseNumber.defaultResult
    }
}
