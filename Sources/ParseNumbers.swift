// Tollaga © 2020 - Jose Gil <jose.gil@tollaga.com>

final class ParseNumbers {
    
    private static let delimiters = ",\n"
    
    public func parse(_ string: String) -> [Int] {
        let delimiters = CharacterSet(charactersIn: ParseNumbers.delimiters)
        let components = string.components(separatedBy: delimiters)
        return components.map( { ParseNumber().parse($0) })
    }
}
