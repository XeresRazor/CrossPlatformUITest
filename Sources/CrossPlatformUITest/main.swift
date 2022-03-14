import SwiftGLFW
import GL

if !GLFW.initialize() {
    fatalError("Could not initialize GLFW")
}
defer {
    GLFW.terminate()
}

guard let window = GLFW.Window(width: 1280, height: 720, title: "UITest", monitor: nil, share: nil) else {
    fatalError("Could not create a GLFW Window")
}

window.makeContextCurrent()
var r: GL.Float = 0.0, g: GL.Float = 0.0, b: GL.Float = 0.0
var lastTime = GLFW.time
while !window.shouldClose {
    glClearColor(r, g, b, 1.0)
    glClear(GL.COLOR_BUFFER_BIT)
    window.swapBuffers()
    GLFW.pollEvents()
    let time = GLFW.time
    let elapsedTime = time - lastTime
    lastTime = time
    r = r + Float(0.5 * elapsedTime)
    if r > 1.0 {
        r = 0.0
        g = g + 0.05
        if g > 1.0 {
            g = 0.0
            b = b + 0.03
            if b > 1.0 { b = 0.0 }
        }
        
    }
}
