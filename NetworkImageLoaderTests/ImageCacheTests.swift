//
//  ImageCacheTests.swift
//  NetworkImageLoaderTests
//
//  Created by Joe Rocca on 9/15/17.
//  Copyright © 2017 Joe Rocca. All rights reserved.
//

import XCTest
@testable import NetworkImageLoader

class ImageCacheTests: XCTestCase {
    
    var cache: ImageCache!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.cache = ImageCache()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.cache = nil
        clearCaches()
        
        super.tearDown()
    }
    
    func testMemoryCacheSize() {
        self.cache.memoryCacheSize = 1
        XCTAssert(self.cache.memoryCacheSize == 1, "memoryCacheSize should be able to be set.")
    }
    
    func testClearMemoryCache() {
        self.cache.store(testImage, forKey: testImageCacheKey)
        self.cache.clearMemoryCache()
        let cachedImage = self.cache.memoryCachedImage(forKey: testImageCacheKey)
        XCTAssertNil(cachedImage)
    }
    
    func testStoreImageInMemoryCache() {
        clearCaches()
        
        self.cache.store(testImage, forKey: testImageCacheKey)
        let cachedImage = self.cache.memoryCachedImage(forKey: testImageCacheKey)
        XCTAssertNotNil(cachedImage)
        XCTAssert(cachedImage == testImage, "cachedImage should be equal to stored testImage.")
    }
    
    func testStoreImageInDiskCache() {
        let expectation = self.expectation(description: "wait for downloading image")
        
        clearCaches()
        
        NetworkImageLoader.shared.downloadAndCacheImage(withUrl: testImageUrl, forceRefresh: true) { (image, error) in
            expectation.fulfill()
            
            let cachedImage = self.cache.diskCachedImage(forKey: testImageUrl.absoluteString)
            XCTAssertNotNil(cachedImage)
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
