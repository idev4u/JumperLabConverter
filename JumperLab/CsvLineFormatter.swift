//
//  CsvLineFormatter.swift
//  JumperLab
//
//  Created by Norman Sutorius on 11.05.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

import Foundation

class CsvLineFormatter {
    
    struct Mesurement {
        static var zeroOne = "M1_0"
        static var zeroTwo = "M2_0"
        static var thirtyOne = "M1_30"
        static var thirtyTwo = "M2_30"
        static var sixtyOne = "M1_60"
        static var sixtyTwo = "M2_60"
        static var ninetyOne = "M1_90"
        static var ninetyTwo = "M2_90"
        static var oneHundretTwentyOne = "M1_120"
        static var oneHundretTwentyTwo = "M2_120"
//        static var csvDelimiter = ","
        static var csvDelimiter = ";"
    }
    
    func formatListOfValuesInOneLine(valueMap: Array<Dictionary<String, String>>) -> String {
        var  csvLine = String()
        var lineArray = getCleanLine()
        var patientMetadata = Dictionary<String, String>()
        for (index, everyItemInMap) in valueMap.enumerated() {
            for (key, value) in everyItemInMap {
                var lineCompleted = true
                print("\(key) -> \(value)")

                if key == "PatientID" {
                    patientMetadata = splitPatientIdInSeprateValues(patientDict: value)
                    if (lineArray["patientId"]?.isEmpty)!{
                        lineArray.updateValue(patientMetadata["patienid"]!, forKey: "patientId")
                    }
                    if (lineArray["initials"]?.isEmpty)!{
                        lineArray.updateValue(patientMetadata["patientInitials"]!, forKey: "initials")
                    }
                    if (lineArray[Mesurement.zeroOne]?.isEmpty)!{
                        if patientMetadata["mesureBY"] == "0" {
                            lineArray.updateValue(everyItemInMap["Quant_1_Value"]!, forKey: Mesurement.zeroOne)
                            print("zero: \(index)" )
                        }
                    }
                    if (lineArray[Mesurement.zeroTwo]?.isEmpty)! && isOdd(index: index) == true {
                        if patientMetadata["mesureBY"] == "0" {
                            lineArray.updateValue(everyItemInMap["Quant_1_Value"]!, forKey: Mesurement.zeroTwo)
                            print("zero: \(index)" )
                        }
                    }
                    
//                    if (lineArray[Mesurement.thirtyOne]?.isEmpty)!{
//                        if patientMetadata["mesureBY"] == "30" {
//                            lineArray.updateValue(everyItemInMap["Quant_1_Value"]!, forKey: Mesurement.thirtyOne)
//                        }
//                    }
//                    if (lineArray[Mesurement.thirtyTwo]?.isEmpty)! && isOdd(index: index) == true {
//                        if patientMetadata["mesureBY"] == "30" {
//                            lineArray.updateValue(everyItemInMap["Quant_1_Value"]!, forKey: Mesurement.thirtyTwo)
//                        }
//                    }
//
//                    if (lineArray[Mesurement.sixtyOne]?.isEmpty)!{
//                        if patientMetadata["mesureBY"] == "60" {
//                            lineArray.updateValue(everyItemInMap["Quant_1_Value"]!, forKey: Mesurement.sixtyOne)
//                        }
//                    }
//                    if (lineArray[Mesurement.sixtyTwo]?.isEmpty)! && isOdd(index: index) == true {
//                        if patientMetadata["mesureBY"] == "60" {
//                            lineArray.updateValue(everyItemInMap["Quant_1_Value"]!, forKey: Mesurement.sixtyTwo)
//                        }
//                    }
//
//
//                    if (lineArray[Mesurement.ninetyOne]?.isEmpty)!{
//                        if patientMetadata["mesureBY"] == "90" {
//                            lineArray.updateValue(everyItemInMap["Quant_1_Value"]!, forKey: Mesurement.ninetyOne)
//                        }
//                    }
//                    if (lineArray[Mesurement.ninetyTwo]?.isEmpty)! && isOdd(index: index) == true {
//                        if patientMetadata["mesureBY"] == "90" {
//                            lineArray.updateValue(everyItemInMap["Quant_1_Value"]!, forKey: Mesurement.ninetyTwo)
//                        }
//                    }
//
//                    if (lineArray[Mesurement.oneHundretTwentyOne]?.isEmpty)!{
//                        if patientMetadata["mesureBY"] == "120" {
//                            lineArray.updateValue(everyItemInMap["Quant_1_Value"]!, forKey: Mesurement.oneHundretTwentyOne)
//                        }
//                    }
//                    if (lineArray[Mesurement.oneHundretTwentyTwo]?.isEmpty)! && isOdd(index: index) == true {
//                        if patientMetadata["mesureBY"] == "120" {
//                            lineArray.updateValue(everyItemInMap["Quant_1_Value"]!, forKey: Mesurement.oneHundretTwentyTwo)
//                        }
//                    }
                    
                    
//                    let max = ( lineArray.count - 1 )
                    for (index, line) in lineArray.enumerated() {
                        
                        if line.value.isEmpty{
                            lineCompleted = false
                        }
//                        if (index >= max) {
//                            lineCompleted = true
//                        }
                    }
                    
                    if lineCompleted{
                        
                        csvLine.append(lineArray["patientId"]!)
                        csvLine.append(Mesurement.csvDelimiter)
                        csvLine.append(lineArray["initials"]!)
                        csvLine.append(Mesurement.csvDelimiter)
                        csvLine.append(lineArray[Mesurement.zeroOne]!)
                        csvLine.append(Mesurement.csvDelimiter)
                        csvLine.append(lineArray[Mesurement.zeroTwo]!)
                        csvLine.append(Mesurement.csvDelimiter)
//                        csvLine.append(lineArray[Mesurement.thirtyOne]!)
//                        csvLine.append(Mesurement.csvDelimiter)
//                        csvLine.append(lineArray[Mesurement.thirtyTwo]!)
//                        csvLine.append(Mesurement.csvDelimiter)
//                        csvLine.append(lineArray[Mesurement.sixtyOne]!)
//                        csvLine.append(Mesurement.csvDelimiter)
//                        csvLine.append(lineArray[Mesurement.sixtyTwo]!)
//                        csvLine.append(Mesurement.csvDelimiter)
//                        csvLine.append(lineArray[Mesurement.ninetyOne]!)
//                        csvLine.append(Mesurement.csvDelimiter)
//                        csvLine.append(lineArray[Mesurement.ninetyTwo]!)
//                        csvLine.append(Mesurement.csvDelimiter)
//                        csvLine.append(lineArray[Mesurement.oneHundretTwentyOne]!)
//                        csvLine.append(Mesurement.csvDelimiter)
//                        csvLine.append(lineArray[Mesurement.oneHundretTwentyTwo]!)
                        csvLine.append("\n")
                        lineArray = getCleanLine()
                    }
                }
                
                //                   print( patientMetadata.description)
                
                
            }
            print("line: \(csvLine)")
        }
    
        return csvLine
    }
    
    func splitPatientIdInSeprateValues(patientDict: String) -> Dictionary<String, String> {
        let letters = NSCharacterSet.letters
        let numbers = NSCharacterSet.decimalDigits
        print("PatientID: \(patientDict)")
        let patient = patientDict.components(separatedBy: letters)
        let patientInitials = patientDict.components(separatedBy: numbers)
        print("patientId: \(patient[0].trimmingCharacters(in: CharacterSet.punctuationCharacters))")
        let patientId = patient[0].trimmingCharacters(in: CharacterSet.punctuationCharacters)
        
//        print("patientInitials: \(patientInitials[4])")
        let pi = trimEmpty(value: patientInitials)
        print(pi)
        
        print("mesure by: \(patient[2].trimmingCharacters(in: CharacterSet.punctuationCharacters))")
        let mby = patient[2].trimmingCharacters(in: CharacterSet.punctuationCharacters)
        let splittedValues = ["patienid" : patientId, "patientInitials": pi , "mesureBY": mby ]
        return splittedValues
    }
    
    func getCleanLine() -> Dictionary<String, String>{
        return ["patientId" : "", "initials": "" ,
                Mesurement.zeroOne : "",
                Mesurement.zeroTwo : "" //,
//                Mesurement.thirtyOne : "",
//                Mesurement.thirtyTwo : "",
//                Mesurement.sixtyOne : "",
//                Mesurement.sixtyTwo : "",
//                Mesurement.ninetyOne : "",
//                Mesurement.ninetyTwo : "",
//                Mesurement.oneHundretTwentyOne : "",
//                Mesurement.oneHundretTwentyTwo : ""
        ]
    }
    
    func isOdd(index: Int) -> Bool{
        if index % 2 == 0 {
            print("\(index) is even number")
            return false
        } else {
            print("\(index) is odd number")
            return true
        }
    }
    
    func trimEmpty(value: Array<String>) -> String{
        var patientInitials = ""
        for item in value {
            if (!(item >= "a" && item <= "z") && !(item >= "A" && item <= "Z") ) {
                continue
            }else {
                patientInitials = item.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            }
        }
        return patientInitials
    }
}
