//
//  Rotate.swift
//  
//
//  Created by Yuki Kuwashima on 2023/03/05.
//

import simd

public extension Coordinate3DMaster {
    
    func rotate(_ rad: Float, _ axis: simd_float3) {
        matrices[lastIndex] *= simd_float4x4.createRotation(angle: rad, axis: axis)
    }
    
    func rotate(_ rad: Float, _ axisX: Float, _ axisY: Float, _ axisZ: Float) {
        matrices[lastIndex] *= simd_float4x4.createRotation(angle: rad, axis: simd_float3(axisX, axisY, axisZ))
    }
    
    func rotateX(_ rad: Float) {
        matrices[lastIndex] *= simd_float4x4.createRotation(angle: rad, axis: simd_float3(1, 0, 0))
    }
    
    func rotateY(_ rad: Float) {
        matrices[lastIndex] *= simd_float4x4.createRotation(angle: rad, axis: simd_float3(0, 1, 0))
    }
    
    func rotateZ(_ rad: Float) {
        matrices[lastIndex] *= simd_float4x4.createRotation(angle: rad, axis: simd_float3(0, 0, 1))
    }
}
