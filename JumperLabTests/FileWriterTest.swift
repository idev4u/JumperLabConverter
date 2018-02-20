//
//  FileWriterTest.swift
//  JumperLab
//
//  Created by Norman Sutorius on 17.05.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//
import Foundation

import XCTest
@testable import JumperLab

class FileWriterTest: XCTestCase {
    
    let fm = FileManager.default
    
    override class func setUp() { // 1.
        super.setUp()
        // This is the setUp() class method.
        // It is called before the first test method begins.
        // Set up any overall initial state here.
        let testFile = "./JumperLabConverter/JumperLabTests/testWrite.txt"
        let fm = FileManager.default
        do {
            try fm.removeItem(atPath: fm.homeDirectoryForCurrentUser.appendingPathComponent(testFile).absoluteString) }
        catch {
           print(error.localizedDescription)
        }
    }

    func testWriteFile() {
        
        let compare = "hello write test"
        let myFSW = FSWriter(path: fm.homeDirectoryForCurrentUser.appendingPathComponent("Developer/workspace/JumperLabConverter/JumperLabTests/").absoluteString ,toFile: "testWrite.txt")
        let result = myFSW.write(output: compare)
        
        XCTAssertTrue(result)
        
        let myfs = FSReader(path: fm.homeDirectoryForCurrentUser.appendingPathComponent("Developer/workspace/JumperLabConverter/JumperLabTests/").absoluteString)
        let stream: String  = myfs.readFile(filename: "testWrite.txt")
        
        XCTAssertNotNil(stream)
        print("stream:\(stream)")
        XCTAssertEqual(stream, compare)
    }

}
