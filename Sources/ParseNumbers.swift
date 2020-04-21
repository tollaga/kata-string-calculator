// Tollaga © 2020 - Jose Gil <jose.gil@tollaga.com>

final class ParseNumbers {

    public func parse(_ string: String, delimiters: String) -> [Int] {
        let delimiters = CharacterSet(charactersIn: delimiters)
        let components = string.components(separatedBy: delimiters)
        return components.map( { ParseNumber().parse($0) } )
    }
}
