import Foundation

public func compare(
    _ other: String,
    options: CompareOptions = [],
    range: Range? = nil,
    locale: Locale? = nil
) {
    
}

compare("A")
compare(locale: nil, "B")
compare(options: [], locale: nil, "B")
compare(options: [], range: nil, locale: nil, "B")

compare("A")
compare("B", locale: nil)
compare("B", options: [], locale: nil)
compare("B", options: [], range: nil, locale: nil)
