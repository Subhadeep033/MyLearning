import CreateML
import Foundation

//Load data from Dictionary
//let data : [String:MLDataValueConvertible] = ["title" : "","price":""]

//Load data from .csv and .json are same. Only extension of the file is different.
let dataUrl = URL(fileURLWithPath:"/Users/dapl-asset-290/Desktop/CoreML Demos/DataSets/iris.csv")
var dataTable = try MLDataTable.init(contentsOf: dataUrl)

//Different propertise of MLDataTable...

//Get Size of Table.
dataTable.size

//Column Names
dataTable.columnNames

//Coulmn Types
dataTable.columnTypes

//Description
dataTable.description

//Description In Playground
dataTable.playgroundDescription

//Get Column by name
dataTable["species"]

//Filter out specific rows
let setosaFilter = dataTable["species",String.self]! != "setosa"
let noSetosaTable = dataTable[setosaFilter]

//Filter type 2
let filter = dataTable["species"]
let onlySetosa = dataTable[filter == "setosa"]
let NoSetosa = dataTable[filter != "setosa"]

//Split Table data randomly
let (training, testing) = dataTable.randomSplit(by: 0.8)
let (train1, test1) = dataTable.randomSplit(by: 0.9, seed: 5)

training.rows.count
testing.rows.count

train1.rows.count
test1.rows.count

//Derived New Column
let columnName = "desc"
let derivedColumn = dataTable.map{
    row -> String in
    return String(format: "%@ %.1f", row["species"]!.stringValue!,row["sepal_length"]!.doubleValue!)
}

dataTable.addColumn(derivedColumn, named: columnName)

//Remove Column
dataTable.removeColumn(named: columnName)

// Get Top Rows
print("------------ Top -----------")
dataTable.rows.prefix(5).forEach{row in
    print(row)
}

// Get Bottom Rows
print("------------ Bottom -----------")
dataTable.rows.suffix(5).forEach{row in
    print(row)
}

//Drop Missing Value
dataTable.dropMissing()

//Drop Duplicate Value
dataTable.dropDuplicates()

//Create Missing Values
var i = 0
let derivedCol = dataTable.map { row -> String? in
    i = i + 1
    if i % 2 == 0{
        return String(format: "%@ %.1f", row["species"]!.stringValue!,row["sepal_length"]!.doubleValue!)
    }
    return nil
}
dataTable.addColumn(derivedCol, named: "desc_missing")

//Fill Missing Values
dataTable.fillMissing(columnNamed: "desc_missing", with: MLDataValue.string("---------"))
