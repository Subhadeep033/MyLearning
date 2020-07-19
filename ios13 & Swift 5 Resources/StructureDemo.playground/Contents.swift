class StoredData {
    static let sharedData = StoredData()
    var userName = "Subha"
    
    func updateUserName(_ name: String ){
        self.userName = name
    }
}

var data = StoredData()
StoredData.sharedData.userName = "Prabir"
print(StoredData.sharedData.userName)
