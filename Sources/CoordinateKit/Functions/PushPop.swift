//
//  PushPop.swift
//  
//
//  Created by Yuki Kuwashima on 2023/03/05.
//

import simd

public extension Coordinate3DMaster {
    
    func push() {
        matrices.append(simd_float4x4.createIdentity())
    }
    
    func pop() {
        matrices.removeLast()
    }
}
