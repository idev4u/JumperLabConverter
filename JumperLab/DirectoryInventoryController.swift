//
//  DirectoryInventoryController.swift
//  JumperLab
//
//  Created by Norman Sutorius on 04.05.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

import Foundation

class DirectoryInventoryController {
    
    func ListOfFilesInTheDirectory(directoryPath: String) -> Array<String> {
        var listOfFiles = Array<String>()
        let fm = FileManager()
        listOfFiles = try! fm.contentsOfDirectory(atPath: directoryPath)
        return listOfFiles.filter(isMimeType)
    }
    
    func isMimeType(type: String) -> Bool {
        var isMimeTypeFromType = false
        if type.hasSuffix(".txt") { // true
            print("Suffix is txt")
            isMimeTypeFromType = true
        }
        return isMimeTypeFromType
    }
}
