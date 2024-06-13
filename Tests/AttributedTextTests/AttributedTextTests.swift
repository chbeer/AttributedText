import XCTest
@testable import AttributedText

final class AttributedTextTests: XCTestCase {
    func testSampleString() throws {
        let attr = NSMutableAttributedString()
        
        let imgAttachment = NSTextAttachment(image: UIImage(systemName: "clock")!)
        
        attr.append(NSAttributedString(string: "It's 10 o"))
        attr.append(NSAttributedString(attachment: imgAttachment))
        attr.append(NSAttributedString(string: " in the afternoon"))
        attr.append(NSAttributedString(string: ", on sunday"))
        
        let runs = attr.runs
        
        XCTAssertEqual(runs.count, 3)
        XCTAssertEqual(runs[0].range, NSRange(location: 0, 
                                              length: "It's 10 o".count))
        guard case .text(NSAttributedString(string: "It's 10 o")) = runs[0].content else {
            XCTFail("Run 0 is not valid")
            return
        }
        
        XCTAssertEqual(runs[1].range, NSRange(location: "It's 10 o".count, length: 1))
        
        XCTAssertEqual(runs[2].range, NSRange(location: "It's 10 o".count + 1,
                                              length: " in the afternoon, on sunday".count))
        guard case .text(NSAttributedString(string: " in the afternoon, on sunday")) = runs[2].content else {
            XCTFail("Run 2 is not valid")
            return
        }
    }
    
}
