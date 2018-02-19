//
//  SectionSplitterTest.swift
//  JumperLab
//
//  Created by Norman Sutorius on 08.05.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

import XCTest


class SectionSplitterTest: XCTestCase {
    
    let fm = FileManager.default.homeDirectoryForCurrentUser

    
    func testSectionSplit() {
        
        let myfs = FSReader(path: fm.appendingPathComponent("/Developer/private/JumperLab/JumperLabTests/").absoluteString)
        let stream: String  = myfs.readFile(filename: "test.txt")

        let sectionSplitter = SectionSplitter(initWithDelimiter: ["[","]"])
        let splittedStream = sectionSplitter.split(stream: stream)
        
        let flat = splittedStream[2].description.trimmingCharacters(in: NSCharacterSet.newlines)
        XCTAssertTrue(flat.contains("Zeit:|"))
        
        let measurementCompareString = "A1\"|\"\"|\"Fasten_Zeit\"|\"B1\"|\"*****\"|\"\"|\"IncKO\"|\""
        XCTAssert(splittedStream[4].description.contains(measurementCompareString))
   
    }
    
    
}
