import NaturalLanguage

let str = "Steve Jobs lived at Los Angles. He was CEO in Apple Inc."

/* NLTagger is a class that supports different language. We can use it to segmented text into units like words, sentences, paragraphs and characters.*/

let tagger = NLTagger(tagSchemes: [.nameType])
tagger.string = str

tagger.enumerateTags(in: str.startIndex..<str.endIndex, unit: .word, scheme: NLTagScheme.nameType, options:[.omitPunctuation, .omitWhitespace]) { (tag, range) -> Bool in
    print("\(str[range]) is \(tag?.rawValue ?? "Unknown")")
    return true
}
