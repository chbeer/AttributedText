# AttributedText

A replacement for `Text(AttributedString(…))` that renders `NSTextAttachment`s.

## Installation

Supports iOS 13.0+ and macOS 10.12+

### Swift Package Manager

File -> Swift Packages -> Add Package Dependency and use the URL `https://github.com/chbeer/AttributedText`.

Or add `.package(url: "https://github.com/chbeer/AttributedText", from: "1.0.0")` to your `Package.json`

## Usage

```
struct SampleView: View {
    
    let previewText: NSAttributedString =  {
        let attr = NSMutableAttributedString()
        
        let imgAttachment = NSTextAttachment(image: UIImage(systemName: "clock")!)
        
        attr.append(NSAttributedString(string: "It's 10 o"))
        attr.append(NSAttributedString(attachment: imgAttachment))
        attr.append(NSAttributedString(string: " in the afternoon"))
        
        return attr
    }()

    var body: some View {
        AttributedText(text: previewText)
    }
    
}
```
