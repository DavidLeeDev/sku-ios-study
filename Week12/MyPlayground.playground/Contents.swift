func rep(_ ch: String){
    print(String(repeating: ch, count: 20))
}



print("Hello")
print("World")

rep("2")

func sayHello() async -> String {
    print("Starting Hello...")
    try? await Task.sleep(nanoseconds: 1_000_000_000)
    
    return "Hello"
}

func sayWorld() async -> String {
    print("Starting World...")
    try? await Task.sleep(nanoseconds: 3_000_000_000)
    
    return "World"
}

Task {
    print("Sequential Async Start")
    let hello = await sayHello()
    print(hello)
    let world = await sayWorld()
    print(world)
    print("Sequential Done!")
}
