//
//  File.swift
//  
//
//  Created by Yuki Kuwashima on 2023/03/05.
//

import XCTest
@testable import CoordinateKit
import simd

final class CoordinateKitFunctionTests: XCTestCase {
    
    func testPush() throws {
        let master = Coordinate3DMaster()
        master.push()
        XCTAssertEqual(master.matrices, [simd_float4x4.createIdentity(), simd_float4x4.createIdentity()])
    }
    
    func testPop() throws {
        let master = Coordinate3DMaster()
        master.push()
        master.push()
        master.pop()
        XCTAssertEqual(master.matrices, [simd_float4x4.createIdentity(), simd_float4x4.createIdentity()])
    }
    
    func testRotate() throws {
        let master = Coordinate3DMaster()
        master.rotate(1, simd_float3(2, 3, 4))
        let expected = simd_float4x4.init(
            simd_float4(-10.492443, 6.12407, 1.1531689, 0.0),
            simd_float4(-0.6076977, -8.193954, 7.1993146, 0.0),
            simd_float4(6.201995, 3.8334308, -4.9760704, 0.0),
            simd_float4(0.0, 0.0, 0.0, 1.0)
        )
        XCTAssertEqual(master.currentMatrix, expected)
    }
    
    func testRotate2() throws {
        let master = Coordinate3DMaster()
        master.rotate(1, 2, 3, 4)
        let expected = simd_float4x4.init(
            simd_float4(-10.492443, 6.12407, 1.1531689, 0.0),
            simd_float4(-0.6076977, -8.193954, 7.1993146, 0.0),
            simd_float4(6.201995, 3.8334308, -4.9760704, 0.0),
            simd_float4(0.0, 0.0, 0.0, 1.0)
        )
        XCTAssertEqual(master.currentMatrix, expected)
    }
    
    func testRotateX() throws {
        let master = Coordinate3DMaster()
        master.rotateX(1)
        let expected = simd_float4x4.init(
            simd_float4(1.0, 0.0, 0.0, 0.0),
            simd_float4(0.0, 0.5403023, 0.841471, 0.0),
            simd_float4(0.0, -0.841471, 0.5403023, 0.0),
            simd_float4(0.0, 0.0, 0.0, 1.0)
        )
        XCTAssertEqual(master.currentMatrix, expected)
    }
    
    func testRotateY() throws {
        let master = Coordinate3DMaster()
        master.rotateY(1)
        let expected = simd_float4x4.init(
            simd_float4(0.5403023, 0.0, -0.841471, 0.0),
            simd_float4(0.0, 1.0, 0.0, 0.0),
            simd_float4(0.841471, 0.0, 0.5403023, 0.0),
            simd_float4(0.0, 0.0, 0.0, 1.0)
        )
        XCTAssertEqual(master.currentMatrix, expected)
    }
    
    func testRotateZ() throws {
        let master = Coordinate3DMaster()
        master.rotateZ(1)
        let expected = simd_float4x4.init(
            simd_float4(0.5403023, 0.841471, 0.0, 0.0),
            simd_float4(-0.841471, 0.5403023, 0.0, 0.0),
            simd_float4(0.0, 0.0, 1.0, 0.0),
            simd_float4(0.0, 0.0, 0.0, 1.0)
        )
        XCTAssertEqual(master.currentMatrix, expected)
    }
    
    func testTranslate() throws {
        let master = Coordinate3DMaster()
        master.translate(2, 3, 4)
        let expected = simd_float4x4.init(
            simd_float4(1, 0, 0, 2),
            simd_float4(0, 1, 0, 3),
            simd_float4(0, 0, 1, 4),
            simd_float4(0, 0, 0, 1)
        )
        XCTAssertEqual(master.currentMatrix, expected)
    }
    
    func testTranslate2() throws {
        let master = Coordinate3DMaster()
        master.translate(simd_float3(2, 3, 4))
        let expected = simd_float4x4.init(
            simd_float4(1, 0, 0, 2),
            simd_float4(0, 1, 0, 3),
            simd_float4(0, 0, 1, 4),
            simd_float4(0, 0, 0, 1)
        )
        XCTAssertEqual(master.currentMatrix, expected)
    }
}
  
