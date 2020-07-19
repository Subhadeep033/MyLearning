import Foundation
import CreateML
import NaturalLanguage

let sentimentData = ["Positive" : ["affirmative","favourable","good","approving","in the affirmative","constructive","enthusiastic","supportive","reassuring","encouraging","corroborative","practical","useful","pragmatic","productive","helpful","worthwhile","beneficial","effective","efficacious","hopeful","optimistic","confident","forward-looking","cheerful","sanguine","assured","upbeat","buoyant","pleasing","welcome","promising","definite","certain","conclusive","categorical","unequivocal","sure","convinced","satisfied","utter","complete","sheer","absolute","real","total","perfect","fine","quality","high quality","superior","standard","high standard","better","best","capable","able","proficient","adept","adroit","accomplished","healthy","sound","tip-top","hale","nourishing","worthy","fit","suited","appropriate","suitable","convenient","well","considerable","at least","whole","full","complete","solid","admire","substantial","considerable","appreciable","significant","advantage","comfort","benefit","avail","comfort","help","new","newest","nice","smart","smartest","nicest","finest","interest","service","morality","par","advantage","valid","yes","successful"],
                     
    "Negative" : ["bad","worse","worst","poor","substandard","inferior","second-rate","second-class","unsatisfactory","inadequate","unacceptable","not up to par","deficient","imperfect","defective","faulty","awful","terrible","shoddy","careless","negligent","dreadful","hopeless","worthless","sorry","miserable","third-class","third-rate","ineffectual","inept","woeful","inexpert","crap","shit","rubbish","abysmal","pitiful","disadvantage","adverse","inappropiate","unpleasant","harmful","harm","damage","damaged","corrupt","worthless","invalid","counterfeit","fake","false","spurious","uncertain","ineffective","destructive","discouraging","hopeless","below standard","pessimistic","no","defeatist","gloomy","cynical","bleak","refuse","rejection","unenthusiastic","unresponsive","adverse","denial","unfortunate","anti","fatal","apathetic","obstructive","disgusting","shocking","shameful","horrifying","nasty","unacceptable","insupportable","impermissible","objectionable","offensive","unsuitable","improper","unseemly","despairing","atrocious","useless","incompetent","dire","regrettable","grim","unlucky","nasty","feeble","unfit","inutile","unsuccessful","malfunctioning","incomplete","scratched","deficient","unsound","overheated","hanged","off"],

    "Other" : ["is","was","were","use","using","become","became","record","recording"]]

let classifier = try MLTextClassifier(trainingData: sentimentData)
//let sentimentClassifier = try NLModel(mlModel: classifier.model)
//
//var count = 0
//let sentimentStr =
//var wordsOfSting = [String]()
//
//if sentimentStr != ""{
//    let tagger = NLTagger(tagSchemes: [.lexicalClass])
//    tagger.string = sentimentStr
//    wordsOfSting.removeAll()
//    tagger.enumerateTags(in: sentimentStr.startIndex..<sentimentStr.endIndex, unit: .word, scheme: NLTagScheme.lexicalClass, options:[.omitPunctuation, .omitWhitespace]) { (tag, range) -> Bool in
//        print(sentimentStr[range],tag?.rawValue ?? "Unknown")
//        if ((tag?.rawValue ?? "" == "Adjective") || (tag?.rawValue ?? "" == "Verb")){
//            wordsOfSting.append(String(sentimentStr[range]))
//        }
//        return true
//    }
//    
//    print("Word of String",wordsOfSting)
//    
//    for word in wordsOfSting{
//        let predictions = sentimentClassifier.predictedLabel(for: word)
//        print(predictions ?? "")
//        switch predictions {
//            case "Positive":
//                  count += 1
//            case "Negative":
//                  count -= 1
//            default:
//                  count += 0
//        }
//    }
//    
//    if count > 0{
//        print("Sentiment is Positive with count = \(count)")
//    }
//    else if count < 0{
//        print("Sentiment is Negative with count = \(-1 * count)")
//    }
//    else{
//        print("Sentiment is Neutral")
//    }
//}
//else{
//    print("Input string is blank.")
//}

let metadata = MLModelMetadata(author: "Subhadeep", shortDescription: "A model trained to classify messages", version: "1.0")
try classifier.write(to: URL(fileURLWithPath: "/Users/dapl-asset-290/Desktop/Sentiment.mlmodel"), metadata: metadata)
