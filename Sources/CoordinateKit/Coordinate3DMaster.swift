//
//  Coordinate3DMaster.swift
//  
//
//  Created by Yuki Kuwashima on 2023/03/05.
//

import simd

public class Coordinate3DMaster {
    
    public var matrices: [simd_float4x4] = [simd_float4x4.createIdentity()]
    
    public var currentMatrix: simd_float4x4 {
        return matrices.reduce(simd_float4x4.createIdentity(), *)
    }
    
    public var lastIndex: Int {
        return matrices.count - 1
    }
    
    public init() {}
}
