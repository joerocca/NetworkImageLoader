# NetworkImageLoader

## Usage

#### General
```swift
let task = NetworkImageLoader.shared.downloadAndCacheImage(withUrl: imageUrl) { (image, error) in
    guard let image = image else {
        print(error?.localizedDescription ?? "Error downloading image.")
        return
    }
    print(image)
}
```

#### UIImageView
```swift
imageView.setImage(withUrl: imageUrl)
```
```swift
imageView.cancelImageDownload()
```

#### Prefetching
```swift
NetworkImageLoader.shared.prefetchImage(withUrl: imageUrl)
```
