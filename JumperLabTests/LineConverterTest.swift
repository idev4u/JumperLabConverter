//
//  LineConverterTest.swift
//  JumperLab
//
//  Created by Norman Sutorius on 10.05.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

import XCTest
@testable import JumperLab

class LineConverterTest: XCTestCase {
    
    let fm = FileManager.default.homeDirectoryForCurrentUser
    
    func testLineConverter() {
        let compareString = "\"A1\"|\"\"|\"Fasten_Zeit\"|\"B1\"|\"*****\"|\"\"|\"IncKO\"|\"\""
        let myfs = FSReader(path: fm.appendingPathComponent("/Developer/private/JumperLab/JumperLabTests/").absoluteString)
        let stream: String  = myfs.readFile(filename: "test.txt")
        
        let sectionSplitter = SectionSplitter(initWithDelimiter: ["[","]"])
        let splittedStream = sectionSplitter.split(stream: stream)
        
        let lineConverter = LineConverter()

        let converted = lineConverter.convertSrtingToArray(withDelimiter: "\r\n", source: splittedStream[4])
        XCTAssertFalse(converted[0].isEmpty)
        XCTAssertEqual(compareString, converted[1])
        
        let listOfValueMap = lineConverter.asValueMap()
        
        print("---- list of values ----")
        for item in listOfValueMap {
            print(item.description)
        }
        
        var oneValue = listOfValueMap[0]
//        print("---- csv ----")
        let csvResult = ("\(oneValue["WellLocation"]!),\(oneValue["PatientID"]!),\(oneValue["Assay"]!),\(oneValue["Reader_Value"]!), \(oneValue["Quant_1_Value"]!), \(oneValue["Qual_Value"]!), \(oneValue["Flag"]!), \(oneValue["Vorverduennung"]!)")
        let csvOutput = "\"A4\",\"2325JW0\",\"Fasten_Zeit\",\"0.200\", \"296.950\", \"\", \"296.950\", \"\""
                        
        XCTAssertEqual(csvOutput, csvResult)
    }

}
