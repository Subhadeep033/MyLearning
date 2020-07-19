//------------------------------- MLRegressorExample ------------------------------//
//import CreateML
//import Foundation
//
////Data from url ---
//let data = URL(fileURLWithPath: "/Users/dapl-asset-290/Desktop/CoreML Demos/DataSets/boston.csv")
//
////Create DataTable ---
//var dataTable = try MLDataTable(contentsOf: data)
//dataTable = dataTable.dropMissing()
//dataTable = dataTable.dropDuplicates()
//print(dataTable.rows.count)
////Create Training and Test Data
//let (trainingSet,testSet) = dataTable.randomSplit(by: 0.8)
//
////Create Regressor
//let regressor = try MLRegressor(trainingData: trainingSet, targetColumn: "PRICE")
//
////Evaluation
//let evaluation = regressor.evaluation(on: testSet)
//
////print root mean square error RMSE, the ideal value expected is 0, but in real world it is not the case. The lower it's value prediction will be better.
//print(evaluation.rootMeanSquaredError)

//-------------------------------- MLBoostedTreeRegressor ---------------------------------//

//import CreateML
//import Foundation
//
////get data from url
//let dataURL = URL(fileURLWithPath: "/Users/dapl-asset-290/Desktop/CoreML Demos/DataSets/bike_sharing_day.csv")
////create dataTable
//var dataTable = try MLDataTable(contentsOf: dataURL)
//print("Before Drop :",dataTable.rows.count)
////Remove missing and duplicates values
//dataTable = dataTable.dropMissing()
//dataTable = dataTable.dropDuplicates()
//print("After Drop :",dataTable.rows.count)
//
////Create Training and Test datasets
//let (trainingSet,testSet) = dataTable.randomSplit(by: 0.8)
////Create Params for Regressor
///* maxDepth : defines the depth of the tree, the maximum it's value the complex your model is. To increase the value much higher causes overfitting problem.
//   The default value is 6. 0 indicates no limit. For a 32bit machine you can go upto 30 and for 64bit machine you can go upto 62.
//
//   maxIterations : Maximum Iteration is number of iteration is going to take to train a model. Default is 10.
//
//   minLossReduction : The minimum amount of reduction in the loss function that is required to make another split to the data. Larger values help prevent overfitting. The default value is 0.
//
//   minChildWeight : Determines the minimum weight of each leaf node of the tree. Larger values help prevent overfitting. The default value is 0.1.
//
//   randomSeed : A seed for internal random operations. Set this value to ensure reproducible results. The default value is 42.
//
//   stepSize : The size used to decrease the prediction weight of each learner. The smaller the step size the more conservative the boosting process will be. The default value is 0.3.
//
//   earlyStoppingRounds : If the validation accuracy does not improve after the specified number of rounds training will stop.
//
//   rowSubsample : Select the specified ratio from the training set to grow each tree. For example, a value of 0.5 means each tree is trained on half the data. This technique is known as bagging. The default value is 1.0.
//
//   columnSubsample : Select the specified ratio of columns from the training set to use when growing each tree. Similar to row subsampling, this can be used to prevent overfitting. The default value is 1.0.
//*/
//let params = MLBoostedTreeRegressor.ModelParameters(validationData: trainingSet, maxDepth: 6, maxIterations: 100, minLossReduction: 0, minChildWeight: 1, randomSeed: 0, stepSize: 0.3, earlyStoppingRounds: 50, rowSubsample: 0.5, columnSubsample: 1)
//
//let boostedTreeRegressor = try MLBoostedTreeRegressor(trainingData: trainingSet, targetColumn: "cnt", featureColumns: nil, parameters: params)
//
////Evaluation
//let evaluation = boostedTreeRegressor.evaluation(on: testSet)
//print("RMSE :", evaluation.rootMeanSquaredError)
//print("Max Error :",evaluation.maximumError)
//
////Prediction
//let prediction = try boostedTreeRegressor.predictions(from: testSet)
//var predictionTable = testSet
//predictionTable.addColumn(prediction, named: "predicted_count_per_day")
//
//predictionTable.rows.forEach { row in
//    row.forEach ({ (key, value) in
//        print("Key : \(key) Values : \(value)")
//    })
//    print("================================================================")
//}



//----------------------------------- MLLinearRegressor ------------------------------------//

//import CreateML
//import Foundation
//
////get data from url
//let dataURL = URL(fileURLWithPath: "/Users/dapl-asset-290/Desktop/CoreML Demos/DataSets/sat.csv")
////create dataTable
//var dataTable = try MLDataTable(contentsOf: dataURL)
//print("Before Drop :",dataTable.rows.count)
////Remove missing and duplicates values
//dataTable = dataTable.dropMissing()
//dataTable = dataTable.dropDuplicates()
//print("After Drop :",dataTable.rows.count)
//
////Create Training and Test datasets
//let (trainingSet,testSet) = dataTable.randomSplit(by: 0.8)
//
////Parameters For Linear Regressor
//let params = MLLinearRegressor.ModelParameters(validationData: trainingSet, maxIterations: 100, l1Penalty: 8.0, l2Penalty: 0.0, stepSize: 4, convergenceThreshold: 0.01, featureRescaling: true)
//
//let linearRegressor = try MLLinearRegressor(trainingData: trainingSet, targetColumn: "univ_GPA", featureColumns: nil, parameters: params)
//
////Evaluation
//let evaluation = linearRegressor.evaluation(on: testSet)
//print("RMSE :", evaluation.rootMeanSquaredError)
//print("Max Error :",evaluation.maximumError)
//
////Prediction
//let prediction = try linearRegressor.predictions(from: testSet)
//var predictionTable = testSet
//predictionTable.addColumn(prediction, named: "predicted_GPA")
//
//predictionTable.rows.forEach { row in
//    row.forEach ({ (key, value) in
//        print("Key : \(key) Values : \(value)")
//    })
//    print("================================================================")
//}


//--------------------------- MLDecisionTreeRegressor -------------------------------//
//import CreateML
//import Foundation
//
////get data from url
//let dataURL = URL(fileURLWithPath: "/Users/dapl-asset-290/Desktop/CoreML Demos/DataSets/sat.csv")
////create dataTable
//var dataTable = try MLDataTable(contentsOf: dataURL)
//print("Before Drop :",dataTable.rows.count)
////Remove missing and duplicates values
//dataTable = dataTable.dropMissing()
//dataTable = dataTable.dropDuplicates()
//print("After Drop :",dataTable.rows.count)
//
////Create Training and Test datasets
//let (trainingSet,testSet) = dataTable.randomSplit(by: 0.8)
//
////Params For DecisionTreeRegressor
//let params = MLDecisionTreeRegressor.ModelParameters(validationData: trainingSet, maxDepth: 6, minLossReduction: 0, minChildWeight: 10, randomSeed: 0)
//
//let decisionTreeRegressor = try MLDecisionTreeRegressor(trainingData: trainingSet, targetColumn: "univ_GPA", featureColumns: nil, parameters: params)
//
////Evaluation
//let evaluation = decisionTreeRegressor.evaluation(on: testSet)
//print("RMSE :", evaluation.rootMeanSquaredError)
//print("Max Error :",evaluation.maximumError)
//
////Prediction
//let prediction = try decisionTreeRegressor.predictions(from: testSet)
//var predictionTable = testSet
//predictionTable.addColumn(prediction, named: "predicted_GPA")
//
//predictionTable.rows.forEach { row in
//    row.forEach ({ (key, value) in
//        print("Key : \(key) Values : \(value)")
//    })
//    print("================================================================")
//}


//------------------------------- MLRandomForestRegressor -----------------------------------//

import CreateML
import Foundation

//get data from url
let dataURL = URL(fileURLWithPath: "/Users/dapl-asset-290/Desktop/CoreML Demos/DataSets/bike_sharing_hour.csv")
//create dataTable
var dataTable = try MLDataTable(contentsOf: dataURL)
print("Before Drop :",dataTable.rows.count)
//Remove missing and duplicates values
dataTable = dataTable.dropMissing()
dataTable = dataTable.dropDuplicates()
print("After Drop :",dataTable.rows.count)

//Create Training and Test datasets
let (trainingSet,testSet) = dataTable.randomSplit(by: 0.8)

//Params For RandomForestRegressor
//let params = MLRandomForestRegressor.ModelParameters(validationData: trainingSet, maxDepth: 6, maxIterations: 10, minLossReduction: 0, minChildWeight: 1, randomSeed: 0, rowSubsample: 0.5, columnSubsample: 1)

let randomForestRegressor = try MLRandomForestRegressor(trainingData: trainingSet, targetColumn: "cnt")

//Evaluation
let evaluation = randomForestRegressor.evaluation(on: testSet)
print("RMSE :", evaluation.rootMeanSquaredError)
print("Max Error :",evaluation.maximumError)

//Prediction
let prediction = try randomForestRegressor.predictions(from: testSet)
var predictionTable = testSet
predictionTable.addColumn(prediction, named: "Predicted_Count")

predictionTable.rows.forEach { row in
    row.forEach ({ (key, value) in
        print("Key : \(key) Values : \(value)")
    })
    print("================================================================")
}
