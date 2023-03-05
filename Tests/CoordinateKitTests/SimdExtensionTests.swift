import XCTest
@testable import CoordinateKit
import simd

final class SimdExtensionTests: XCTestCase {
    
    func testSimdCreateTranslate() throws {
        let testResult = simd_float4x4.createTranslate(2, 3, 4)
        let expectedResult = simd_float4x4.init(
            simd_float4(1, 0, 0, 2),
            simd_float4(0, 1, 0, 3),
            simd_float4(0, 0, 1, 4),
            simd_float4(0, 0, 0, 1)
        )
        XCTAssertEqual(testResult, expectedResult)
    }
    
    func testSimdCreateRotation() throws {
        let testResult = simd_float4x4.createRotation(angle: 1, axis: simd_float3(1, 1, 1))
        let expectedResult = simd_float4x4.init(
            simd_float4(0.08060455, 1.3011687, -0.3817733, 0.0),
            simd_float4(-0.3817733, 0.08060455, 1.3011687, 0.0),
            simd_float4(1.3011687, -0.3817733, 0.08060455, 0.0),
            simd_float4(0.0, 0.0, 0.0, 1.0)
        )
        XCTAssertEqual(testResult, expectedResult)
    }
    
    func testSimdCreatePerspective() throws {
        let testResult = simd_float4x4.createPerspective(fov: 2, aspect: 1.3, near: 0.01, far: 100)
        let expectedResult = simd_float4x4.init(
            simd_float4(0.4939174, 0.0, 0.0, 0.0),
            simd_float4(0.0, 0.6420926, 0.0, 0.0),
            simd_float4(0.0, 0.0, -1.0002, -0.020002),
            simd_float4(0.0, 0.0, -1.0, 0.0)
        )
        XCTAssertEqual(testResult, expectedResult)
    }
    
    func testSimdCreateOrthographic() throws {
        let testResult = simd_float4x4.createOrthographic(-100, 100, -100, 100, 0.01, 100)
        let expectedResult = simd_float4x4.init(
            simd_float4(0.01, 0.0, 0.0, -0.0),
            simd_float4(0.0, 0.01, 0.0, -0.0),
            simd_float4(0.0, 0.0, -0.020002, -1.0002),
            simd_float4(0.0, 0.0, 0.0, 1.0)
        )
        XCTAssertEqual(testResult, expectedResult)
    }
    
    func testSimdCreateIdentity() throws {
        let testResult = simd_float4x4.createIdentity()
        let expectedResult = simd_float4x4.init(
            simd_float4(1.0, 0.0, 0.0, 0.0),
            simd_float4(0.0, 1.0, 0.0, 0.0),
            simd_float4(0.0, 0.0, 1.0, 0.0),
            simd_float4(0.0, 0.0, 0.0, 1.0)
        )
        XCTAssertEqual(testResult, expectedResult)
    }
}
