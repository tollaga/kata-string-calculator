// Tollaga © 2020 - Jose Gil <jose.gil@tollaga.com>

final class ParseNumbers {
    
    private static let pattern = "[%@]"
    private static let or = "|"
    private static let separator = "\n"

    public func parse(_ string: String, delimiters: [Delimiter]) throws -> [Int] {
        let components = try obtainComponents(string, delimiters: delimiters)
        return components.map( { ParseNumber().parse($0) } )
    }
    
    private func obtainComponents(_ string: String, delimiters: [Delimiter]) throws -> [String] {
        let regex = try obtainRegex(delimiters: delimiters)
        let range = NSRange(location: 0, length: string.count)
        let expresion = regex.stringByReplacingMatches(in: string,
                                              options: [],
                                              range: range,
                                              withTemplate: ParseNumbers.separator)
        return expresion.components(separatedBy: ParseNumbers.separator)
    }
    
    private func obtainRegex(delimiters: [Delimiter]) throws -> NSRegularExpression {
        let separators: [String] = delimiters.map( { $0.value } )
        let pattern = String(format: ParseNumbers.pattern, separators.joined(separator: ParseNumbers.or))
        return try NSRegularExpression(pattern: pattern, options: [])
    }
}
