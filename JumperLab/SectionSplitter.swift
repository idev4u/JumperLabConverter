//
//  SectionSplitter.swift
//  JumperLab
//
//  Created by Norman Sutorius on 08.05.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

import Foundation

class SectionSplitter {
    
    var delimiter = CharacterSet()
    
    init(initWithDelimiter delimiter: CharacterSet) {
        self.delimiter = delimiter
    }
    
    func split(stream: String) -> Array<String> {
        var splittedStream = Array<String>()
        splittedStream = stream.components(separatedBy: self.delimiter)
        return splittedStream
    }
}
