//
//  UIImageViewExtensionTests.swift
//  NetworkImageLoader
//
//  Created by Joe Rocca on 9/10/17.
//  Copyright © 2017 Joe Rocca. All rights reserved.
//

import XCTest
@testable import NetworkImageLoader

class UIImageViewExtensionTests: XCTestCase {
    
    var imageView: UIImageView!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.imageView = UIImageView()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.imageView = nil
        clearCaches()
        
        super.tearDown()
    }
    
    func testImageViewImageDownload() {
        let expectation = self.expectation(description: "wait for downloading image")

        self.imageView.setImage(withUrl: testImageUrl) { (image, error) in
            expectation.fulfill()
            
            XCTAssert(self.imageView.image != nil, "Downloaded image should exist.")
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }

    func testCancelImageViewImageDownload() {
        let expectation = self.expectation(description: "wait for downloading image")
        
        self.imageView.setImage(withUrl: testImageUrl, forceRefresh: true) { (image, error) in
            expectation.fulfill()
            
            XCTAssertNil(image)
            XCTAssertNotNil(error)
            
            let code = (error! as NSError).code
            XCTAssertEqual(code, NSURLErrorCancelled)
        }
        self.imageView.cancelImageDownload()
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
