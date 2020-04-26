// Tollaga © 2020 - Jose Gil <jose.gil@tollaga.com>

final class ParseDelimiters {

    private static let defaults: Set = [Delimiter(value: ","), Delimiter(value: "\n")]
    private static let prefix = "//"
    private static let separator = "\n"

    public func parse(_ string: String) -> [Delimiter] {
        let delimiters = ParseDelimiters.defaults.union(obtainDelimiters(string))
        return Array(delimiters)
    }
    
    // MARK: - Private
        
    private func obtainDelimiters(_ string: String) -> [Delimiter] {
        let components = string.components(separatedBy: ParseDelimiters.separator)
        let expresions = components.filter( { isDelimiterExpresion($0) } )
        let delimiters = expresions.map( { sanitize($0) } )
        return delimiters.map( { Delimiter(value: $0) })
    }
    
    private func isDelimiterExpresion(_ string: String) -> Bool {
        return string.hasPrefix(ParseDelimiters.prefix)
    }
    
    private func sanitize(_ string: String) -> String {
        return String(string.dropFirst(ParseDelimiters.prefix.count))
    }
}
