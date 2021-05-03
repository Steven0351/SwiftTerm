//
//  Image.swift
//  
//
//  Created by Miguel de Icaza on 4/29/21.
//

import XCTest
import Foundation

@testable import SwiftTerm

final class ImageTests: XCTestCase {

    func testSixel ()
    {
        let h = HeadlessTerminal (queue: SwiftTermTests.queue) { exitCode in }
        let t = h.terminal!
        
        let sixel: [UInt8] = [27,  80,  113,  34,  49,  59,  49,  59,  49,  48,  48,  59,  49,  48,  48,  35,  48,  59,  49,  59,  49,  50,  48,  59,  52,  57,  59,  49,  48,  48,  35,  49,  59,  49,  59,  49,  56,  48,  59,  54,  55,  59,  57,  49,  35,  50,  59,  49,  59,  49,  56,  48,  59,  52,  57,  59,  49,  48,  48,  35,  51,  59,  49,  59,  48,  59,  52,  57,  59,  49,  48,  48,  35,  52,  59,  49,  59,  50,  52,  48,  59,  52,  57,  59,  49,  48,  48,  35,  53,  59,  49,  59,  50,  49,  50,  59,  53,  50,  59,  57,  52,  35,  54,  59,  49,  59,  57,  48,  59,  52,  55,  59,  54,  54,  35,  55,  59,  49,  59,  50,  57,  52,  59,  51,  51,  59,  49,  48,  48,  35,  56,  59,  49,  59,  51,  50,  50,  59,  54,  48,  59,  56,  53,  35,  57,  59,  49,  59,  48,  59,  57,  55,  59,  48,  35,  48,  33,  57,  48,  126,  35,  49,  33,  49,  48,  126,  45,  35,  48,  33,  57,  48,  126,  35,  49,  33,  49,  48,  126,  45,  35,  48,  33,  57,  48,  126,  35,  49,  33,  49,  48,  126,  45,  35,  48,  33,  57,  48,  66,  35,  49,  33,  49,  48,  64,  36,  35,  51,  33,  57,  48,  123,  35,  50,  33,  49,  48,  125,  45,  35,  51,  33,  57,  48,  126,  35,  50,  33,  49,  48,  126,  45,  35,  51,  33,  57,  48,  126,  35,  50,  33,  49,  48,  126,  45,  35,  51,  33,  57,  48,  78,  35,  50,  33,  49,  48,  126,  36,  35,  52,  33,  57,  48,  111,  45,  33,  57,  48,  126,  35,  50,  33,  49,  48,  126,  45,  35,  52,  33,  57,  48,  126,  35,  49,  33,  49,  48,  125,  36,  35,  50,  33,  57,  48,  63,  33,  49,  48,  64,  45,  35,  52,  33,  57,  48,  78,  35,  49,  33,  49,  48,  126,  36,  35,  53,  33,  57,  48,  111,  45,  33,  57,  48,  126,  35,  49,  33,  49,  48,  126,  45,  35,  53,  33,  57,  48,  66,  35,  49,  33,  49,  48,  126,  36,  35,  54,  33,  57,  48,  123,  45,  33,  57,  48,  126,  35,  49,  33,  49,  48,  126,  45,  35,  55,  33,  57,  48,  126,  35,  49,  33,  49,  48,  126,  45,  35,  55,  33,  57,  48,  78,  35,  49,  33,  49,  48,  126,  36,  35,  56,  33,  57,  48,  111,  45,  33,  57,  48,  126,  35,  49,  33,  49,  48,  126,  45,  35,  56,  33,  57,  48,  66,  35,  49,  33,  49,  48,  78,  36,  35,  57,  33,  57,  48,  75,  27,  92]
        
        t.feed(byteArray: sixel)
        XCTAssertEqual(h.images.count, 1)
        let image = h.images [0]
        let bytes = image.0
        let width = image.1
        let height = image.2
        XCTAssertEqual(bytes.count, 40000)
        XCTAssertEqual(width, 100)
        XCTAssertEqual(height, 100)
        XCTAssertEqual(bytes [0], 249)
        XCTAssertEqual(bytes [1], 0)
        XCTAssertEqual(bytes [2], 0)
        XCTAssertEqual(bytes [3], 255)
    }
    
    static var allTests = [
        ("testSixel", testSixel)
    ]
}