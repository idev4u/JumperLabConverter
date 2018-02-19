//
//  FSWriter.swift
//  JumperLab
//
//  Created by Norman Sutorius on 17.05.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

import Foundation

class FSWriter {
    let fm = FileManager.default
    let outputFile: String
    let path: String
    
    init(path: String, toFile: String) {
        outputFile = toFile
        self.path = path
    }
    
    func write(output: String) -> Bool {
        var isWritten = false
        let documentDirURL = URL.init(fileURLWithPath: path)
        
        let fileURL = documentDirURL.appendingPathComponent(outputFile)
        print("FilePath: \(fileURL.path)")
        let fileAsString = fileURL.path
        let fileexists = fm.fileExists(atPath: fileAsString)
//        if FileManager.default.fileExists(atPath: fileURL.absoluteString) {
        if !fileexists {
            do {
//                try output.write(to: fileURL, atomically: false, encoding: String.Encoding.utf8)
                try output.write(to: fileURL, atomically: false, encoding: String.Encoding.isoLatin1)
                isWritten = true
            } catch let error as NSError {
                print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
            }
        } else {
            do {
                let fh = try FileHandle.init(forUpdating: fileURL)
                fh.seekToEndOfFile()
                fh.write(output.data(using: String.Encoding.isoLatin1)!)
                fh.closeFile()
                isWritten = true
                
            } catch let err as NSError {
                print("error append: \(err)")
            }
        }
        //        print("File Text: \(readString)")
        return isWritten
    }
}
