//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



/// json keys for lines
struct LinesKey {
    static let lines = "lines"
    static let name = "name"
    static let hexcolor = "hexcolor"
    static let letter = "letter"
    static let desc = "desc"
}

/// model for Lines
struct LineModel {
    
    var name: String
    var hexcolor: String
    var letter: String
    var desc: String
    
    init?(dict: Dictionary<String, AnyObject>?) {
        guard
            let name = dict?[LinesKey.name] as? String,
            let hexcolor = dict?[LinesKey.hexcolor] as? String,
            let letter = dict?[LinesKey.letter] as? String,
            let desc = dict?[LinesKey.desc] as? String
            else {
                return nil
        }
        self.name = name
        self.hexcolor = hexcolor
        self.letter = letter
        self.desc = desc
    }
}





func fetchTestJson(with file: String) -> Array<LineModel>? {
    // get path
    guard let path = Bundle.main.path(forResource: file, ofType: "json") else {
        print("BaseD.C: not such testJson file")
        return nil
    }
    // get data json
    let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
    let json = try! JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves)
    // parse json
    guard let lines = json as? Dictionary<String, Any>,
        let linesData = lines[LinesKey.lines]
        else {
            return nil
    }
    // to models
    var models = Array<LineModel>()
    if let jsonArray = linesData as? Array<Any> {
        for element in jsonArray {
            if let modelDict = element as? Dictionary<String, AnyObject>,
                let model = LineModel(dict: modelDict) {
                models.append(model)
            }
        }
    }
    return models
}

let fileName = "subway-lister"
if let res = fetchTestJson(with: fileName) {
    print(res[0])
}

