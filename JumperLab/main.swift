//
//  main.swift
//  JumperLab
//
//  Created by Norman Sutorius on 24.04.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

import Foundation

var outputForCsvLines = Array<String>()

let directoryPathForExport: String = "/Users/norman/Developer/workspace/JumperExport/"
let csvWriter = FSWriter(path: directoryPathForExport ,toFile: "ac_ghr_v1_test-1.csv")
//let csvWriter = FSWriter(path: directoryPathForExport ,toFile: "unac_ghr_v1_test-1.csv")
//let directoryPathForImport: String = "/Users/norman/Developer/workspace/JumperImport/test/"
let directoryPathForImport: String = "/Users/norman/Developer/workspace/JumperImport/AC.GHR/"
//let directoryPathForImport: String = "/Users/norman/Developer/workspace/JumperImport/UNAC.GHR/"


//let directoryPathForImport: String = "/Users/norman/Developer/private/JumperImport/UNAC_GHR_test/"

let dicontroller = DirectoryInventoryController()
let listWithFiles:Array<String> = dicontroller.ListOfFilesInTheDirectory(directoryPath: directoryPathForImport)

let myfs = FSReader(path: directoryPathForImport)
for file in listWithFiles {
    
    let stream: String  = myfs.readFile(filename: file)
    let sectionSplitter = SectionSplitter(initWithDelimiter: ["[","]"])
    let splittedStream = sectionSplitter.split(stream: stream)
    
    print(splittedStream[4])
    
    let lineConverter = LineConverter()
    let converted = lineConverter.convertSrtingToArray(withDelimiter: "\r\n", source: splittedStream[4])
    print("converted: \(converted)")
    //        let listOfValueMap = lineConverter.asValueMap(values: converted)
    let listOfValueMap = lineConverter.asValueMap()
    
    let csvOneliner = CsvLineFormatter()
//    sort for PatientID
    let csvFormattedLine = csvOneliner.formatListOfValuesInOneLine(valueMap: listOfValueMap, filename: file)
    print ("---- csv line ---")
    print ("\(csvFormattedLine)")
    
    
    outputForCsvLines.append(csvFormattedLine)
    outputForCsvLines.sort()
}

print("################# ----- csv output ---- ####################")
for line in outputForCsvLines {
    print(line)
    
    let result = csvWriter.write(output: line)
    if result {
        print("write to file ok ")
    } else {
        print("write to file NOT ok")
    }
}

