//
//  FileStreamReader.swift
//  JumperLab
//
//  Created by Norman Sutorius on 24.04.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

import Foundation

class FSReader {
    
    enum EncodingError: Error {
        case encodingNotSupported
    }
    
    struct WinControlCharacters{
        static let charageReturn = "\r\n"
    }
    
    let currentPath: String
    
    init(path: String) {
        currentPath = path
    }
        
    func readFile(filename: String) -> String {
       
        let documentDirURL = URL.init(fileURLWithPath: currentPath)
        
        let fileURL = documentDirURL.appendingPathComponent(filename)
        print("FilePath: \(fileURL.path)")
        
        let readString: String = try! readWithEncoding(encoding: String.Encoding.utf8, file: fileURL)
        if validateIfFileFromWinOS(file: readString){
            print("delimiter \\r\\n was found this file was created on windows!")
        } else {
            print("delimiter \\r\\n was NOT found this file was created on unix!")

        }

        return readString
    }
    
    func readWithEncoding(encoding: String.Encoding, file: URL) throws -> String {
        var content: String = ""
        do {
            // Read the file contents
            //            readString = try String(contentsOf: fileURL, encoding: String.Encoding.isoLatin1)
            content = try String(contentsOf: file, encoding: encoding)
        } catch let error as NSError {
            print("Failed reading from URL: \(file), Error: " + error.localizedDescription)
            try content = readWithEncoding(encoding: String.Encoding.isoLatin1, file: file)
        }
        guard !content.isEmpty else {
            throw EncodingError.encodingNotSupported
        }
        return content
    }
    
    func validateIfFileFromWinOS(file: String) -> Bool {
        return file.contains(WinControlCharacters.charageReturn)
    }
}
