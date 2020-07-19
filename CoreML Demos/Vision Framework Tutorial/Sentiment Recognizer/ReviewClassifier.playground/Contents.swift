import CreateML
import Cocoa

guard let trainingUrl = Bundle.main.url(forResource: "amazon-reviews", withExtension: "json"), let testingUrl = Bundle.main.url(forResource: "testing-reviews", withExtension: "json") else {
    fatalError("Couldn't load files.")
}

do{
    let trainingDataTable = try MLDataTable(contentsOf: trainingUrl)
    let testingDataTable = try MLDataTable(contentsOf: testingUrl)
    
    let stats = """
    *******************************
    Entries used for Training === \(trainingDataTable.size)
    Entries used for Testing === \(testingDataTable.size)
    """
    print(stats)
    
    let sentimentClassifier = try MLTextClassifier(trainingData: trainingDataTable, textColumn: "text", labelColumn: "label")
    
    let evaluation = sentimentClassifier.evaluation(on: testingDataTable, textColumn: "text", labelColumn: "label")
    
    let trainingAccuracy = (1.0 - sentimentClassifier.trainingMetrics.classificationError) * 100
    let validationAccuracy = (1.0 - sentimentClassifier.validationMetrics.classificationError) * 100
    let evaluationAccuracy = (1.0 - evaluation.classificationError) * 100
    
    let accuracy = """
                   =========================================
    Training Accuracy === \(trainingAccuracy)
    Validation Accuracy === \(validationAccuracy)
    Evaluation Accuracy === \(evaluationAccuracy)
    """
    
    print(accuracy)
    
    //Save as .mlmodel
    let modelUrl = URL(fileURLWithPath: "/Users/dapl-asset-290/Desktop/Review.mlmodel")
    let modelMetaData = MLModelMetadata(author: "Subhadeep", shortDescription: "A model used for review sentiment", version: "1.0")
    try sentimentClassifier.write(to: modelUrl, metadata: modelMetaData)
}
catch{
    print(error.localizedDescription)
}
