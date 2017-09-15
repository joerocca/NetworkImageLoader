//
//  NetworkImageLoaderTests.swift
//  NetworkImageLoaderTests
//
//  Created by Joe Rocca on 9/2/17.
//  Copyright © 2017 Joe Rocca. All rights reserved.
//

import XCTest
@testable import NetworkImageLoader

class NetworkImageLoaderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        clearCaches()
        
        super.tearDown()
    }
    
    func testImageDownload() {
        let expectation = self.expectation(description: "wait for downloading image")

        NetworkImageLoader.shared.downloadAndCacheImage(withUrl: testImageUrl) { (image, error) in
            expectation.fulfill()
            
            XCTAssert(image != nil, "Downloaded image should exist")
            XCTAssert(Thread.isMainThread)
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testCancelImageDownload() {
        let expectation = self.expectation(description: "wait for downloading image")
        
        let task = NetworkImageLoader.shared.downloadAndCacheImage(withUrl: testImageUrl, forceRefresh: true) { (image, error) in
            expectation.fulfill()
            
            XCTAssertNotNil(error)
            
            let code = (error! as NSError).code
            XCTAssertEqual(code, NSURLErrorCancelled)
        }
        task?.cancel()
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
