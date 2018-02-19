//
//  DirectoryInventoryControllerTest.swift
//  JumperLab
//
//  Created by Norman Sutorius on 04.05.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

import XCTest
@testable import JumperLab

class DirectoryInventoryControllerTest: XCTestCase {
    
    let directoryPathForTest: String = FileManager.default.homeDirectoryForCurrentUser.relativePath.appending("/Developer/private/JumperLab/JumperLabTests/")

 
    func testListFilesInTheDirectory() {
        
        let dicontroller = DirectoryInventoryController()
        let listWithFiles:Array<String> = dicontroller.ListOfFilesInTheDirectory(directoryPath: directoryPathForTest).sorted()
        XCTAssertNotNil(listWithFiles)
        XCTAssertEqual(listWithFiles[0], "test.txt")
        XCTAssertEqual(listWithFiles[1], "test1.txt")
        
    }
    
    func testIsMimeType() {
        
        let dicontroller = DirectoryInventoryController()
        let isItText = dicontroller.isMimeType(type: "test.txt")
        XCTAssertTrue(isItText)
        let isItNotText = dicontroller.isMimeType(type: "test.tt")
        XCTAssertFalse(isItNotText)
        
    }

}
