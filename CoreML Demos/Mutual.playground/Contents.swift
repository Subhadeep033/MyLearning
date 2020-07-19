import CreateML
import Foundation


let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/dapl-asset-290/Desktop/CoreML Demos/Mutual.json"))
let (trainingData, testingData) = data.randomSplit(by: 0.8, seed: 5)
let spamClassifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "label")
//2
let trainingAccuracy = (1.0 - spamClassifier.trainingMetrics.classificationError) * 100
let validationAccuracy = (1.0 - spamClassifier.validationMetrics.classificationError) * 100
//3
let evaluationMetrics = spamClassifier.evaluation(on: data, textColumn: "text", labelColumn: "label")
let evaluationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100

let metadata = MLModelMetadata(author: "Subhadeep", shortDescription: "A model trained to classify messages", version: "1.0")
try spamClassifier.write(to: URL(fileURLWithPath: "/Users/dapl-asset-290/Desktop/Mutual.mlmodel"), metadata: metadata)

