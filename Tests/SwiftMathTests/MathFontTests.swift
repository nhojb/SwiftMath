import XCTest
@testable import SwiftMath

//
//  MathFontTests.swift
//  
//
//  Created by Peter Tang on 12/9/2023.
//

final class MathFontTests: XCTestCase {
    func testMathFontScript() throws {
        let size = Int.random(in: 20 ... 40)
        MathFont.allCases.forEach {
            // print("\(#function) cgfont \($0.cgFont())")
            // print("\(#function) ctfont \($0.ctFont(withSize: CGFloat(size)))")
            XCTAssertNotNil($0.cgFont())
            XCTAssertNotNil($0.ctFont(withSize: CGFloat(size)))
            XCTAssertEqual($0.ctFont(withSize: CGFloat(size)).fontSize, CGFloat(size), "ctFont fontSize test")
        }
        #if os(iOS)
        // for family in UIFont.familyNames.sorted() {
        //     let names = UIFont.fontNames(forFamilyName: family)
        //     print("Family: \(family) Font names: \(names)")
        // }
        fontNames.forEach { name in
            XCTAssertNotNil(UIFont(name: name, size: CGFloat(size)))
        }
        fontFamilyNames.forEach { name in
            XCTAssertNotNil(UIFont.fontNames(forFamilyName: name))
        }
        #endif
        #if os(macOS)
        fontNames.forEach { name in
            let font = NSFont(name: name, size: CGFloat(size))
            XCTAssertNotNil(font)
        }
        #endif
    }
    func testOnDemandMathFontScript() throws {
        let size = Int.random(in: 20 ... 40)
        let mathFont = MathFont.allCases.randomElement()!
        XCTAssertNotNil(mathFont.cgFont())
        XCTAssertNotNil(mathFont.ctFont(withSize: CGFloat(size)))
        XCTAssertEqual(mathFont.ctFont(withSize: CGFloat(size)).fontSize, CGFloat(size), "ctFont fontSize test")
    }
    var fontNames: [String] {
        MathFont.allCases.map { $0.fontName }
    }
    var fontFamilyNames: [String] {
        MathFont.allCases.map { $0.fontFamilyName }
    }
}