//
//  CsvLineFormatterTest.swift
//  JumperLab
//
//  Created by Norman Sutorius on 11.05.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

import XCTest
@testable import JumperLab
class CsvLineFormatterTest: XCTestCase {
    
    let value0 = ["Reader_Value": "\"0.023\"", "Vorverduennung": "\"\"", "Assay": "\"Fasten_Zeit\"", "Qual_Value": "\"\"", "Quant_1_Value": "\"54.161\"", "Flag": "\"54.161\"", "WellLocation": "\"C5\"", "PatientID": "\"3065CP0\""]
    let value1 = ["Reader_Value": "\"0.024\"", "Vorverduennung": "\"\"", "Assay": "\"Fasten_Zeit\"", "Qual_Value": "\"\"", "Quant_1_Value": "\"11.061\"", "Flag": "\"11.061\"", "WellLocation": "\"D5\"", "PatientID": "\"3065CP0\""]
    let value2 = ["Reader_Value": "\"0.030\"", "Vorverduennung": "\"\"", "Assay": "\"Fasten_Zeit\"", "Qual_Value": "\"\"", "Quant_1_Value": "\"62.029\"", "Flag": "\"62.029\"", "WellLocation": "\"E5\"", "PatientID": "\"3065CP30\""]
    let value3 = ["Reader_Value": "\"0.050\"", "Vorverduennung": "\"\"", "Assay": "\"Fasten_Zeit\"", "Qual_Value": "\"\"", "Quant_1_Value": "\"16.599\"", "Flag": "\"16.599\"", "WellLocation": "\"F5\"", "PatientID": "\"3065CP30\""]
    let value4 = ["Reader_Value": "\"0.048\"", "Vorverduennung": "\"\"", "Assay": "\"Fasten_Zeit\"", "Qual_Value": "\"\"", "Quant_1_Value": "\"80.979\"", "Flag": "\"80.979\"", "WellLocation": "\"G5\"", "PatientID": "\"3065CP60\""]
    let value5 = ["Reader_Value": "\"0.181\"", "Vorverduennung": "\"\"", "Assay": "\"Fasten_Zeit\"", "Qual_Value": "\"\"", "Quant_1_Value": "\"39.343\"", "Flag": "\"39.343\"", "WellLocation": "\"H5\"", "PatientID": "\"3065CP60\""]
    let value6 = ["Reader_Value": "\"0.069\"", "Vorverduennung": "\"\"", "Assay": "\"Fasten_Zeit\"", "Qual_Value": "\"\"", "Quant_1_Value": "\"101.476\"", "Flag": "\"101.476\"", "WellLocation": "\"A6\"", "PatientID": "\"3065CP90\""]
    let value7 = ["Reader_Value": "\"0.031\"", "Vorverduennung": "\"\"", "Assay": "\"Fasten_Zeit\"", "Qual_Value": "\"\"", "Quant_1_Value": "\"12.625\"", "Flag": "\"12.625\"", "WellLocation": "\"B6\"", "PatientID": "\"3065CP90\""]
    let value8 = ["Reader_Value": "\"0.021\"", "Vorverduennung": "\"\"", "Assay": "\"Fasten_Zeit\"", "Qual_Value": "\"\"", "Quant_1_Value": "\"51.846\"", "Flag": "\"51.846\"", "WellLocation": "\"C6\"", "PatientID": "\"3065CP120\""]
    let value9 = ["Reader_Value": "\"0.025\"", "Vorverduennung": "\"\"", "Assay": "\"Fasten_Zeit\"", "Qual_Value": "\"\"", "Quant_1_Value": "\"11.289\"", "Flag": "\"11.289\"", "WellLocation": "\"D6\"", "PatientID": "\"3065CP120\""]
    
    
    func testBringItOneCSVLine() {
        let listOfValues = [value0,value1,value2,value3,value4,value5,value6,value7,value8,value9]
        
        let csvOneliner = CsvLineFormatter()
//        let csvFormattedLineCompare: String = "3065,CP,\"54.161\",\"11.061\",\"62.029\",\"16.599\",\"80.979\",\"39.343\",\"101.476\",\"12.625\",\"51.846\",\"11.289\"\n"

        let csvFormattedLineCompare: String = "3065;CP;\"54.161\";\"11.061\";\"62.029\";\"16.599\";\"80.979\";\"39.343\";\"101.476\";\"12.625\";\"51.846\";\"11.289\"\n"
//        csvFormattedLineCompare.append("\n")
        let csvFormattedLine = csvOneliner.formatListOfValuesInOneLine(valueMap: listOfValues)
        print(csvFormattedLine)
        // Pat_ID Initialien m0 m0 m30 m30 m60 m60 m90 m90 m120 m120
        XCTAssertEqual(csvFormattedLine, csvFormattedLineCompare)
    }

    

}
