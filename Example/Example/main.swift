//
//  main.swift
//  Example
//
//  Created by Yuki Kuwashima on 2023/03/05.
//

import simd
import CoordinateKit

//original vector
var original = simd_float3(2, 1, 1)

//process
let master = Coordinate3DMaster()

master.push()
master.rotate(Float.pi / 2, simd_float3(0, 1, 0))
master.push()
master.translate(100, 0, 0)
print(original.globalPos(with: master.currentMatrix))
master.pop()
print(original.globalPos(with: master.currentMatrix))
master.pop()
print(original.globalPos(with: master.currentMatrix))



