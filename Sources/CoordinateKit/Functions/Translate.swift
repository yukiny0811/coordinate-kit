//
//  Translate.swift
//  
//
//  Created by Yuki Kuwashima on 2023/03/05.
//

import simd

public extension Coordinate3DMaster {
    
    func translate(_ x: Float, _ y: Float, _ z: Float) {
        matrices[lastIndex] *= simd_float4x4.createTranslate(x, y, z)
    }
    
    func translate(_ v: simd_float3) {
        matrices[lastIndex] *= simd_float4x4.createTranslate(v.x, v.y, v.z)
    }
}
