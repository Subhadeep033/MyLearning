import NaturalLanguage

let str = "Ich liebe Codierung"

//MARK: - Dominant Language Example -----

if let language = NLLanguageRecognizer.dominantLanguage(for: str){
    let local = Locale.current
    let languageName = local.localizedString(forLanguageCode: language.rawValue.uppercased())
    print("Detected \(languageName ?? "") as dominant language of string = \(str)")
}
else{
    print("Could not recognize language for string \(str)")
}

//MARK: - Dominant Language With Posibilities -----
let languageRecogniser = NLLanguageRecognizer()

languageRecogniser.processString(str)
languageRecogniser.languageConstraints = [.english, .german, .slovak]  //Set specific language constraints type.

let languageRecogniserPossibilities = languageRecogniser.languageHypotheses(withMaximum: 3)

for (language, posibilities) in languageRecogniserPossibilities{
    let languageName = Locale.current.localizedString(forLanguageCode: language.rawValue.uppercased())
    print("Detected \(languageName ?? "") with possibilities \(posibilities * 100) %")
}

languageRecogniser.reset()
