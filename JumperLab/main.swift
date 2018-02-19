//
//  main.swift
//  JumperLab
//
//  Created by Norman Sutorius on 24.04.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

import Foundation

var outputForCsvLines = Array<String>()

let directoryPathForExport: String = "/Users/norman/Developer/private/JumperExport/"
let csvWriter = FSWriter(path: directoryPathForExport ,toFile: "testWrite.csv")
let directoryPathForImport: String = "/Users/norman/Developer/private/JumperImport/AC_GHR_test/"

//let directoryPathForImport: String = "/Users/norman/Developer/private/JumperImport/UNAC_GHR/"

//let directoryPathForImport: String = "/Users/norman/Developer/private/JumperImport/UNAC_GHR_test/"

let dicontroller = DirectoryInventoryController()
let listWithFiles:Array<String> = dicontroller.ListOfFilesInTheDirectory(directoryPath: directoryPathForImport)

let myfs = FSReader(path: directoryPathForImport)
for file in listWithFiles {
    
    let stream: String  = myfs.readFile(filename: file)
    let sectionSplitter = SectionSplitter(initWithDelimiter: ["[","]"])
    let splittedStream = sectionSplitter.split(stream: stream)
    
    let lineConverter = LineConverter()
    let converted = lineConverter.convertSrtingToArray(withDelimiter: "\r\n", source: splittedStream[4])

    
    //        let listOfValueMap = lineConverter.asValueMap(values: converted)
    let listOfValueMap = lineConverter.asValueMap()
    
    let csvOneliner = CsvLineFormatter()
    let csvFormattedLine = csvOneliner.formatListOfValuesInOneLine(valueMap: listOfValueMap)
    print ("---- csv line ---")
    print ("\(csvFormattedLine)")
    
    outputForCsvLines.append(csvFormattedLine)
    
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

