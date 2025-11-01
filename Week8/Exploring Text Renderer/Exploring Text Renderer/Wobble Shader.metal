//
//  Wobble Shader.metal
//  Exploring Text Renderer
//
//  Created by 이승준 on 10/31/25.
//

#include <metal_stdlib>
using namespace metal;

[[stitchable]] float2 wobble(float2 position, float amplitude) {
    return float2(position.x, position.y + amplitude * sin(position.x));
}
