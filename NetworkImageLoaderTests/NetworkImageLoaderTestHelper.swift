//
//  NetworkImageLoaderTestHelper.swift
//  NetworkImageLoader
//
//  Created by Joe Rocca on 9/13/17.
//  Copyright © 2017 Joe Rocca. All rights reserved.
//

import Foundation
@testable import NetworkImageLoader

let testImage = UIImage()
let testImageCacheKey = "http://joerocca.me/"
let testImageUrl = URL(string: "https://avatars3.githubusercontent.com/u/10346184")!

func clearCaches() {
    NetworkImageLoader.shared.imageCache.clearMemoryCache()
    URLCache.shared.removeAllCachedResponses()
}
