// Tollaga © 2020 - Jose Gil <jose.gil@tollaga.com>

final class ParseDelimiters {

    private static let delimiters = ",\n"
    private static let prefix = "//"
    private static let separator = "\n"

    public func parse(_ string: String) -> String {
        var delimters = ParseDelimiters.delimiters
        delimters += obtainDelimiters(string)
        return delimters
    }
    
    // MARK: - Private
        
    private func obtainDelimiters(_ string: String) -> String {
        let components = string.components(separatedBy: ParseDelimiters.separator)
        let expresions = components.filter( { isDelimiterExpresion($0) } )
        let delimiters = expresions.map( { sanitize($0) } )
        return delimiters.reduce("", +)
    }
    
    private func isDelimiterExpresion(_ string: String) -> Bool {
        return string.hasPrefix(ParseDelimiters.prefix)
    }
    
    private func sanitize(_ string: String) -> String {
        return String(string.dropFirst(ParseDelimiters.prefix.count))
    }
}
