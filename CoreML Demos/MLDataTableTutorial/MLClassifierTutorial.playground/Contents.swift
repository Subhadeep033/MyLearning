//------------------- MLClassifier Example --------------------//

//import CreateML
//import Foundation
//
//// data file downloaded from kaggle.com
//// load data from file
//let dataUrl = URL(fileURLWithPath: "/Users/dapl-asset-290/Desktop/CoreML Demos/DataSets/winequality-red.csv")
//
////let dataUrl1 = URL(fileURLWithPath: "/Users/dapl-asset-290/Desktop/CoreML Demos/DataSets/winequality-white.csv")
////dataTable.append(contentsOf: try MLDataTable.init(contentsOf: dataUrl1))
////print(dataTable)
//
//var dataTable = try MLDataTable.init(contentsOf: dataUrl)
//print(dataTable.rows.count)
//dataTable = dataTable.dropDuplicates()
//dataTable = dataTable.dropMissing()
//
//// Data split for training & testing
//let (trainData,testData) = dataTable.randomSplit(by: 0.8, seed: 5)
//
//let classifier = try MLClassifier.init(trainingData: trainData, targetColumn: "quality")
//
//let evaluation = classifier.evaluation(on: testData)
//print(evaluation)


// Different Type of Classifer Example
//------------------------------------- MLDecisionTree Classifier -------------------------------------//

import CreateML
import Foundation

//load data from file
let trainingUrl = URL(fileURLWithPath: "/Users/dapl-asset-290/Desktop/CoreML Demos/DataSets/Titanic/train.csv")
let testUrl = URL(fileURLWithPath: "/Users/dapl-asset-290/Desktop/CoreML Demos/DataSets/Titanic/test.csv")

//creating table from data
var trainingTable = try MLDataTable(contentsOf: trainingUrl)
var testingTable = try MLDataTable(contentsOf: testUrl)

//remove unused column
trainingTable.removeColumn(named: "Ticket")
testingTable.removeColumn(named: "Ticket")

//remove rows where "Age" is missing. We can use dropMissing func but it will remove all rows which contains missing values, but to precisily remove we use map.
let ageColumn = trainingTable["Age", Double.self]!
let ageMask = ageColumn.mapMissing {
    return $0 != nil
}
//Creating Table without missing data value.
let newTrainingTable = trainingTable[ageMask]

//let params = MLDecisionTreeClassifier.ModelParameters(
//Creating Classifier
let titanicDecisionTreeClassifier = try MLDecisionTreeClassifier(trainingData: newTrainingTable, targetColumn: "Survived")

//Prediction
let prediction = try titanicDecisionTreeClassifier.predictions(from: testingTable)

let passengerId = testingTable["PassengerId", Int.self]!
let passengerName = testingTable["Name", String.self]!

var predictionTable = MLDataTable()
predictionTable.addColumn(passengerId, named: "Passenger ID")
predictionTable.addColumn(passengerName, named: "Passenger Name")
predictionTable.addColumn(prediction, named: "Survived")
print("----------------------------------------------------------------------------------------------------------------------")
print("--------------------------------------------- Prediction Table -------------------------------------------------------")
print("----------------------------------------------------------------------------------------------------------------------")
print("Passenger ID \t\t Passenger Name \t\t Status")
print("----------------------------------------------------------------------------------------------------------------------")
predictionTable.rows.forEach { row in
    let survived = row["Survived"]!.intValue! == 1 ? "Survived" : "Didn't Survived"
    print("\(row["Passenger ID"]!.intValue!) \t\t \(row["Passenger Name"]!.stringValue!) \t\t \(survived)")
    print("----------------------------------------------------------------------------------------------------------------------")
}


//------------------------------------- MLLogistic Regression Classifier ---------------------------------------------//

//import CreateML
//import Foundation
//
////load data from file
//let trainingUrl = URL(fileURLWithPath: "/Users/dapl-asset-290/Desktop/CoreML Demos/DataSets/Titanic/train.csv")
//let testUrl = URL(fileURLWithPath: "/Users/dapl-asset-290/Desktop/CoreML Demos/DataSets/Titanic/test.csv")
//
////creating table from data
//var trainingTable = try MLDataTable(contentsOf: trainingUrl)
//var testingTable = try MLDataTable(contentsOf: testUrl)
//
////remove unused column
//trainingTable.removeColumn(named: "Ticket")
//testingTable.removeColumn(named: "Ticket")
//
////Remove Missing Values
//trainingTable = trainingTable.dropMissing()
//testingTable = testingTable.dropMissing()
//
////Set Model Training params
///* NOTE : Initially set TrainingParams with maxIteration : 30, then compilier will show a message (Iteration Limit Reached.) Model may not be Optimal, To improve it, consider increasing "maxIterations" parameters. */
//let trainingParams = MLLogisticRegressionClassifier.ModelParameters(validation: MLLogisticRegressionClassifier.ModelParameters.ValidationData.table(trainingTable), maxIterations: 100, l1Penalty: 8.0, l2Penalty: 0.0, stepSize: 4.0, convergenceThreshold: 0.01, featureRescaling: true)
//
////Create Classifier
//let classifier = try MLLogisticRegressionClassifier.init(trainingData: trainingTable, targetColumn: "Survived", featureColumns: nil, parameters: trainingParams)
//
////Validation Matrics
//let validation = classifier.validationMetrics
//let evaluation = classifier.evaluation(on: testingTable)
//
////Print Matrics and Evaluation Precision Recall
//print("------- Matrics ---------")
//print(validation)
//print("------- Evaluation Precision Recall --------")
//print(evaluation.precisionRecall)


//------------------------------------ MLRandomForest Classifier --------------------------------------//

//import CreateML
//import Foundation
//
//// Data Url
//let dataUrl = URL(fileURLWithPath: "/Users/dapl-asset-290/Desktop/CoreML Demos/DataSets/Mushrooms.csv")
//
////Data table
//let dataTable = try MLDataTable(contentsOf: dataUrl)
//
////Split data
//let (trainingSet,testingSet) = dataTable.randomSplit(by: 0.8)
//
////Classifier
//let classifier = try MLRandomForestClassifier.init(trainingData: trainingSet, targetColumn: "class")
//
////Predictions
//let predictions = try classifier.predictions(from: testingSet)
//
////Create Prediction Table
//var predictionTable = testingSet
//predictionTable.addColumn(predictions, named: "Predicted_Class")
//print("----------------------------------------------------------------------------")
//print("Habitat \t\t Actual_Class \t\t Predicted_Class")
//print("----------------------------------------------------------------------------")
//predictionTable.rows.forEach { row in
//    let habitat = row["habitat",String.self]!
//    let predictedClass = row["Predicted_Class",String.self]!
//    let actualClass = row["class",String.self]!
//    print("\(habitat) \t\t \(actualClass) \t\t \(predictedClass)")
//    print("----------------------------------------------------------------------------")
//}


//------------------------------- MLBoostedTree Classifier ---------------------------------//

//import CreateML
//import Foundation
//
////Create Data URL
//let dataURL = URL(fileURLWithPath: "/Users/dapl-asset-290/Desktop/CoreML Demos/DataSets/iris.csv")
////DataTable From Url
//let dataTable = try MLDataTable(contentsOf: dataURL)
////Split data
//var (trainingSet,testingSet) = dataTable.randomSplit(by: 0.8)
//
////remove duplicates
//trainingSet = trainingSet.dropDuplicates()
//testingSet = testingSet.dropDuplicates()
//
////remove missing
//trainingSet = trainingSet.dropMissing()
//testingSet = testingSet.dropMissing()
//
////classifier
//let boostedTreeClassifier = try MLBoostedTreeClassifier(trainingData: trainingSet, targetColumn: "species")
//
////Evaluate
//let evaluate = boostedTreeClassifier.evaluation(on: testingSet)
////Confusion Matrics
//print(evaluate.confusion)
//
////Prediction
//let prediction = try boostedTreeClassifier.predictions(from: testingSet)
//
////Create Prediction Table
//var predictionTable = testingSet
//predictionTable.addColumn(prediction, named: "Predicted_Species")
//
//predictionTable.rows.forEach { row in
//    row.forEach({ (key, value) in
//       print("Key : \(key) \t\t Values : \(value)")
//       print("--------------------------------------------------")
//    })
//    print("=======================================================")
//}


//------------------------------ MLSupport Vector Classifier -----------------------------//
//import CreateML
//import Foundation
//
////Create Data URL
//let dataURL = URL(fileURLWithPath: "/Users/dapl-asset-290/Desktop/CoreML Demos/DataSets/adult-income.csv")
////DataTable From Url
//let dataTable = try MLDataTable(contentsOf: dataURL)
////Split data
//var (trainingSet,testingSet) = dataTable.randomSplit(by: 0.8)
//
////remove duplicates
//trainingSet = trainingSet.dropDuplicates()
//testingSet = testingSet.dropDuplicates()
//
////remove missing
//trainingSet = trainingSet.dropMissing()
//testingSet = testingSet.dropMissing()
//
////Create model Params
//let trainingParams = MLSupportVectorClassifier.ModelParameters.init(validation: MLSupportVectorClassifier.ModelParameters.ValidationData.table(trainingSet), maxIterations: 150, penalty: 8.0, convergenceThreshold: 0.01, featureRescaling: true)
//
////Create Classifier
//let svmClassifier = try MLSupportVectorClassifier.init(trainingData: trainingSet, targetColumn: "income-level", featureColumns: nil, parameters: trainingParams)
//
////Validation Metrics
//let valdation = svmClassifier.validationMetrics
//print(valdation)
////Evaluation
//let evaluation = svmClassifier.evaluation(on: testingSet)
//print(evaluation.confusion)
//
////Predictions
//let predictions = try svmClassifier.predictions(from: testingSet)
//var predictionTable = testingSet
//predictionTable.addColumn(predictions, named: "Predicted_Income_Level")
//
//predictionTable.rows.forEach { row in
//    row.forEach({ (key, value) in
//       print("Key : \(key) \t\t Values : \(value)")
//       print("--------------------------------------------------")
//    })
//    print("=======================================================")
//}

