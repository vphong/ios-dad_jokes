//
//  DadJokesTests.swift
//  DadJokesTests
//
//  Created by Vanna Phong on 30/07/2018.
//  Copyright © 2018 vphong. All rights reserved.
//

import XCTest
@testable import DadJokes

class DadJokesTests: XCTestCase {
    
    var apiUnderTest: APIClient!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        apiUnderTest = APIClient()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        apiUnderTest = nil
        super.tearDown()
    }
    
    // MARK: - Models
    func testAPIGetRandomJokeSuccess() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // 1. given: set up any values needed
        var joke = Joke()
        
        // 2. when: execute call
        apiUnderTest.getRandomJoke { (result) in
            joke = result!
        }
        
        // 3. then: assert expected result
        XCTAssertNotNil(joke)
        
    }
    func testAPIGetRandomJokeHTTPError() {
        var joke = Joke()
        
        apiUnderTest.getRandomJoke { (<#Joke?#>) in
            <#code#>
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
