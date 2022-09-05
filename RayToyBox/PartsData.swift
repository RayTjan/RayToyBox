//
//  CarData.swift
//  RayToyBox
//
//  Created by Ray on 30/08/22.
//

import Foundation

struct Part: Hashable{
    var partCategory: String = ""
    var nameBrand: String = ""
    var namePart: String = ""
    var history: String = ""
    var imageURL:String = ""
    var lugHoles: String = ""
    var estimatedPrice: String = ""
        
    init(raw:[String]){
        partCategory = raw[0]
        nameBrand = raw[1]
        namePart = raw[2]
        history = raw[3]
        imageURL = raw[4]
        lugHoles = raw[5]
        estimatedPrice = raw[6]

    }
}

func loadCSV(from csvName: String)-> [Part]{
    print("make array")
    var csvToStruct = [Part]()
    
    print("before filePath")
    guard let filePath = Bundle.main.url(forResource: csvName, withExtension: "csv") else{
        return []
    }
    print("filepath: ")
    print(filePath)
    var data = ""
    do{
        data = try String(contentsOf: filePath)
    }
    catch{
        print(error)
        return[]
    }
    
    var rows = data.components(separatedBy: "\n")
    let columnCount = rows.first?.components(separatedBy: ";").count
    rows.removeFirst()
    print("array : ")
    print(rows)
    print("Count : ")
    print(rows.count)
    for row in rows {
        let csvColumns = row.components(separatedBy: ";")
        
        print("Data:")
        print(csvColumns)
        print("Components")
        //so empty arrays wont be counted and cause an error
        if(csvColumns.count != 1){
            let velgStruct = Part.init(raw: csvColumns)
            csvToStruct.append(velgStruct)
        }
        
    }
    print("done makinng Array")
    print(csvToStruct)
    return csvToStruct
}
