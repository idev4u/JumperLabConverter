//
//  LineConverter.swift
//  JumperLab
//
//  Created by Norman Sutorius on 10.05.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

import Foundation

class LineConverter {
    
    var values: Array<String> = []
    
    func convertSrtingToArray(withDelimiter delimiter: String, source: String) -> Array<String> {
//        var lines = Array<String>()
        values = source.components(separatedBy: delimiter)
        for (_, line) in values.enumerated() {
            if line.isEmpty {
                values.remove(at: values.index(of: line)!)
            }
        }
        return values
    }
    
    func asValueMap() -> Array<Dictionary<String, String>> {
        var valueMap: [String: String] = [
            "WellLocation" : "",
            "PatientID" : "",
            "Assay" : "",
            "Reader_Value": "",
            "Quant_1_Value": "",
            "Qual_Value": "",
            "Flag" : "",
            "Vorverduennung": ""
        ]
        var listOfValueMap = Array<Dictionary<String, String>>()
        
        for valueInOneline in values {
            print("messwert: \(valueInOneline)")
            var valueList = valueInOneline.components(separatedBy: "|")
            print ("value1")
            print (valueList[1])
            print ("is empty: \(valueList[1].isEmpty)")
            // if condition
            if valueList[1].description.isEmpty || valueList[1] == "\"\"" || valueList[1] == "Patient ID" || valueList[1] == "\"KON‹\"" || valueList[1] == "\"Kontrolle Nü\"" || valueList[1] == "\"KO NÜ\"" || excludeRepeatedPatient(patient: valueList[1])	{
                continue
            }
            valueMap.updateValue(valueList[0], forKey: "WellLocation")
            valueMap.updateValue(valueList[1], forKey: "PatientID")
            valueMap.updateValue(valueList[2], forKey: "Assay")
            valueMap.updateValue(valueList[3], forKey: "Reader_Value")
            valueMap.updateValue(valueList[4], forKey: "Quant_1_Value")
            valueMap.updateValue(valueList[5], forKey: "Qual_Value")
            valueMap.updateValue(valueList[4], forKey: "Flag")
            valueMap.updateValue(valueList[5], forKey: "Vorverduennung")
            
            listOfValueMap.append(valueMap)
        }
        return listOfValueMap
    }
    
    func excludeRepeatedPatient(patient: String) -> Bool{
        var isRepeated = false
        if patient.hasSuffix("WH\"") {
            isRepeated = true
        }
        return isRepeated
    }
}
