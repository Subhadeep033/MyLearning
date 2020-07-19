import CoreML
import NaturalLanguage

class RestaurantReviewTagger {
  // Custom scheme
  private let scheme = NLTagScheme("RestaurantReview")
  private let options: NLTagger.Options = [.omitPunctuation]
  
  private lazy var tagger: NLTagger? = {
    do {
      let url = Bundle.main.url(forResource: "Sentiment", withExtension: "mlmodelc")!
        print(url)
        let model = try NLModel(contentsOf: url)  // MLModel -> NLModel
      let tagger = NLTagger(tagSchemes: [scheme])
      tagger.setModels([model], forTagScheme: scheme) // Associating custom model with custom scheme
      return tagger
    } catch {
      return nil
    }
  }()
  
  func prediction(for text: String) -> String? {
    tagger?.string = text
    let range = text.startIndex ..< text.endIndex
    tagger?.setLanguage(.english, range: range)
    return tagger?.tags(in: range,
                       unit: .word,
                       scheme: scheme,
                       options: options)
      .compactMap { tag, _ -> String? in
        return tag?.rawValue
      }
      .first
  }
}

let tagger = RestaurantReviewTagger()
let reviews = "Good not much better as expected the heating problem is facing and fingerprint is also not work properly sometimes and...battery also drain fast but it has fast charge so it can be charge fast ..if u buy go for realme mobiles"
var count = 0

let taggered = NLTagger(tagSchemes: [.lexicalClass])
taggered.string = reviews
var wordsOfSting = [String]()
taggered.enumerateTags(in: reviews.startIndex..<reviews.endIndex, unit: .word, scheme: NLTagScheme.lexicalClass, options:[.omitPunctuation, .omitWhitespace]) { (tag, range) -> Bool in
        print(reviews[range],tag?.rawValue ?? "Unknown")
        if ((tag?.rawValue ?? "" == "Adjective") || (tag?.rawValue ?? "" == "Verb")){
            wordsOfSting.append(String(reviews[range]))
        }
        return true
    }
print("Word of String",wordsOfSting)
wordsOfSting.forEach { word in
    guard let prediction = tagger.prediction(for: word) else { return }
    print("\(word): \(prediction)")
}
  

