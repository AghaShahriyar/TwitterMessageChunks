//
//  Twitter_Message_SplitTests.swift
//  Twitter_Message_SplitTests
//
//  Created by Agha Shahriyar Khan on 04/11/2019.
//  Copyright © 2019 Agha Shahriyar Khan. All rights reserved.
//

import XCTest
@testable import Twitter_Message_Split

var messageSplitTest: MessageSplitModel!


class Twitter_Message_SplitTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        messageSplitTest = MessageSplitModel()
    }

    override func tearDown() {
        messageSplitTest = nil
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let guess = "I can't believe tweeter now supports chunking my messages, so I don't have to do it myself."
        
        let testResult = messageSplitTest.splitBy(message: guess, length: 46) //Actual size is 50
        
        let result = [Chunks.init(chunk: "")]
        XCTAssertNotEqual(testResult, result, "SUCCESS")
        
        
        let guess1 = "Ican'tbelievetweeternowsupportschunkingmymessages, so I don't have to do it myself."
        
        let testResult1 = messageSplitTest.splitBy(message: guess1, length: 46) //Actual size is 50
        
        let result1 = [Chunks.init(chunk: "")]
        XCTAssertEqual(testResult1, result1, "SUCCESS")
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
