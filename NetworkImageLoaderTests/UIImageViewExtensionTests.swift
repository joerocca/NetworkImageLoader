//
//  UIImageViewExtensionTests.swift
//  NetworkImageLoader
//
//  Created by Joe Rocca on 9/10/17.
//  Copyright © 2017 Joe Rocca. All rights reserved.
//

import XCTest

class UIImageViewExtensionTests: XCTestCase {
    
    var imageView: UIImageView!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        imageView = UIImageView()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testImageViewImageDownload() {
        imageView.setImage(withUrl: testImageUrl)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            XCTAssert(self.imageView.image != nil, "Downloaded image should exist.")
        }
    }
}
