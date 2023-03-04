# CoordinateKit

Lightweight 3d coordinate transformation library for Swift.

## How to use

Using push/pop/translate/rotate functions to change and move around the coordinate space.    
```somevector.globalPos(with:)``` function will transform your local positioned vector to global positioned vector.

```.swift
import simd
import CoordinateKit

//original vector
var original = simd_float3(2.0, 1.0, 1.0)

//process
let master = Coordinate3DMaster()

master.push()
master.rotate(Float.pi / 2, simd_float3(0, 1, 0))
master.push()
master.translate(100, 0, 0)
print(original.globalPos(with: master.currentMatrix)) //SIMD3<Float>(0.99999416, 1.0, 98.0)
master.pop()
print(original.globalPos(with: master.currentMatrix)) //SIMD3<Float>(1.0000001, 1.0, -2.0)
master.pop()
print(original.globalPos(with: master.currentMatrix)) //SIMD3<Float>(2.0, 1.0, 1.0)
```
