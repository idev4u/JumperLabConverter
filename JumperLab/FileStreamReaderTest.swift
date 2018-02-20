//
//  FileStreamReaderTest.swift
//  JumperLab
//
//  Created by Norman Sutorius on 24.04.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

import XCTest
@testable import JumperLab

class FileStreamReaderTest: XCTestCase {
    
    let compare = "[Fasten_Zeit]"
    let fm = FileManager.default.homeDirectoryForCurrentUser
    
    override class func setUp() { // 1.
        super.setUp()
        // This is the setUp() class method.
        // It is called before the first test method begins.
        // Set up any overall initial state here.
        let testFile = "./JumperLabConverter/JumperLabTests/testWrite.txt"
        let setupfm = FileManager.default
        do {
            try setupfm.removeItem(atPath: testFile) }
        catch {
            print(error.localizedDescription)
        }
    }

    func testReadFile(){
        let myfs = FSReader(path: fm.appendingPathComponent("Developer/workspace/JumperLabConverter/JumperLabTests/").absoluteString)
        let stream: String  = myfs.readFile(filename: "test.txt")
        
        XCTAssertNotNil(stream)
        print("stream:\(stream)")
        let index = stream.index(stream.startIndex, offsetBy: 13)
        XCTAssertEqual(stream.substring(to: index), self.compare)
    }
    
    func testFileEncoding(){
        let myfs = FSReader(path: fm.appendingPathComponent("Developer/workspace/JumperLabConverter/JumperLabTests/").absoluteString)
        let stream: String  = myfs.readFile(filename: "test_utf8.txt")
        
        XCTAssertNotNil(stream)
        print("stream:\(stream)")
        let index = stream.index(stream.startIndex, offsetBy: 13)
        XCTAssertEqual(stream.substring(to: index), self.compare)
    }
    
    func testFileForCRLF(){
        let testCR = "\r\n"
        let testNOTCR = "\n"
        
        let myfs = FSReader(path: fm.appendingPathComponent("Developer/workspace/JumperLabConverter/JumperLabTests/").absoluteString)
        var isFileFromWinOS = myfs.validateIfFileFromWinOS(file: testCR)
        
        XCTAssertTrue(isFileFromWinOS)
        
        isFileFromWinOS = myfs.validateIfFileFromWinOS(file: testNOTCR)
        
        XCTAssertFalse(isFileFromWinOS)

    }

}
