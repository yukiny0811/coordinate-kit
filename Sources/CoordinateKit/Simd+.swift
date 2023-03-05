//
//  Simd+.swift
//  
//
//  Created by Yuki Kuwashima on 2023/03/05.
//

import simd

public extension simd_float4x4 {
    
    static func createTranslate(_ x: Float, _ y: Float, _ z: Float) -> simd_float4x4 {
        return Self.init(
            simd_float4(1, 0, 0, x),
            simd_float4(0, 1, 0, y),
            simd_float4(0, 0, 1, z),
            simd_float4(0, 0, 0, 1)
        )
    }
    
    static func createRotation(angle: Float, axis: simd_float3) -> simd_float4x4 {
        return Self.init(
            simd_quatf(angle: angle, axis: axis)
        )
    }
    
    static func createPerspective(fov: Float, aspect: Float, near: Float, far: Float) -> simd_float4x4 {
        let f: Float = 1.0 / (tan(fov / 2.0))
        return Self.init(
            simd_float4(f / aspect, 0, 0, 0),
            simd_float4(0, f, 0, 0),
            simd_float4(0, 0, (near+far)/(near-far), (2 * near * far) / (near - far)),
            simd_float4(0, 0, -1, 0)
        )
    }
    
    static func createOrthographic(_ l: Float, _ r: Float, _ b: Float, _ t: Float, _ n: Float, _ f: Float) -> simd_float4x4 {
        return Self.init(
            simd_float4(2/(r-l), 0, 0, -1 * (r+l) / (r-l)),
            simd_float4(0, 2 / (t-b), 0, -1 * (t+b) / (t-b)),
            simd_float4(0, 0, -2 / (f-n), -1 * (f+n)/(f-n)),
            simd_float4(0, 0, 0, 1)
        )
    }
    
    static func createIdentity() -> simd_float4x4 {
        return Self.init(
            simd_float4(1, 0, 0, 0),
            simd_float4(0, 1, 0, 0),
            simd_float4(0, 0, 1, 0),
            simd_float4(0, 0, 0, 1)
        )
    }
}

public extension simd_float3 {
    func globalPos(with coordinate: simd_float4x4) -> simd_float3 {
        let pos = simd_float4(self.x, self.y, self.z, 1)
        return simd_float3(pos.x, pos.y, pos.z)
    }
}
