//
//  File.swift
//  
//
//  Created by Yuki Kuwashima on 2023/03/05.
//

import XCTest
@testable import CoordinateKit
import simd

final class Coordinate3DMasterTests: XCTestCase {
    
    func testMatrixIsSetInInit() throws {
        let master = Coordinate3DMaster()
        XCTAssertEqual(master.matrices.count, 1)
        XCTAssertEqual(master.matrices, [simd_float4x4.createIdentity()])
    }
    
    func testLastIndexIsCorrect() throws {
        let master = Coordinate3DMaster()
        master.push()
        master.push()
        master.push()
        master.push()
        master.push()
        XCTAssertEqual(master.lastIndex, 5)
    }
    
    func testCurrentMatrixIsCorrect() throws {
        let mat1 = simd_float4x4.init(
            simd_float4(1, 2, 3, 4),
            simd_float4(5, 6, 7, 8),
            simd_float4(9, 0, 1, 2),
            simd_float4(3, 4, 5, 6)
        )
        let mat2 = simd_float4x4.init(
            simd_float4(11, 12, 13, 14),
            simd_float4(15, 16, 17, 18),
            simd_float4(19, 10, 11, 12),
            simd_float4(13, 14, 15, 16)
        )
        let master = Coordinate3DMaster()
        master.matrices = [mat1, mat2]
        XCTAssertEqual(mat1 * mat2, master.currentMatrix)
    }
}
    
