import NaturalLanguage

let str = "The Quick Brown Fox Jumps Over A Lazy Dog."

/* NLTagger is a class that supports different language. We can use it to segmented text into units like words, sentences, paragraphs and characters.*/

let tagger = NLTagger(tagSchemes: [.tokenType])
tagger.string = str

tagger.enumerateTags(in: str.startIndex..<str.endIndex, unit: .word, scheme: NLTagScheme.tokenType, options:[.omitPunctuation, .omitWhitespace]) { (tag, range) -> Bool in
    print(str[range])
    return true
}
