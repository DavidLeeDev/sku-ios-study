//
//  main.swift
//  Chaining Closures
//
//  Created by 이승준 on 9/12/25.
//

import Foundation

print("Chaining Closures")

struct TaskScheduler {
    let prepare: () -> Void
    let excute: () -> Void
    let cleanUp: () -> Void
    let finish: () -> Void
    
    func start() {
        prepare()
        excute()
        cleanUp()
        finish()
    }
}

//ctrl+m
let scheduler = TaskScheduler(
    prepare: {},
    excute: {},
    cleanUp: {},
    finish: {}
)

//enter
let scheduler2 = TaskScheduler {
    print("Preparing resources..")
} excute: {
    print("Exceuting tasks...")
} cleanUp: {
    print("Cleaning up resources...")
} finish: {
    print("All tasks finished!")
}

scheduler2.start()

struct NewTaskScheduler {
    let prepare: () -> Void
    let excute: () -> Void
    let x: Int
    let cleanUp: () -> Void
    let finish: () -> Void
    
    func start() {
        prepare()
        excute()
        cleanUp()
        finish()
    }
}

let newScheduler = NewTaskScheduler(prepare: {}, excute: {}, x: 3) {
    <#code#>
} finish: {
    <#code#>
}

struct NewerTaskScheduler {
    let x: Int
    let y: Int
    let name: String
    let prepare: () -> Void
    let excute: () -> Void
    let cleanUp: () -> Void
    let finish: () -> Void
    
    func start() {
        prepare()
        excute()
        cleanUp()
        finish()
    }
}

let newerScheduler = NewerTaskScheduler(
    x: 3,
    y: 5,
    name: "Hello World!") {
        <#code#>
    } excute: {
        <#code#>
    } cleanUp: {
        <#code#>
    } finish: {
        <#code#>
    }

