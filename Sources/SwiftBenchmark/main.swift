//
//  main.swift
//  
//
//  Created by Toomas Vahter on 03.05.2021.
//

import CollectionsBenchmark
import Foundation

var queueBenchmark = Benchmark(title: "Queue")
queueBenchmark.add(title: "QueueSimple", input: [Int].self, maxSize: 128_000) { input in
    return { timer in
        var queue = QueueSimple<Int>()
        input.forEach({ queue.enqueue($0) })
        timer.measure {
            for _ in 0..<input.count {
                let value = queue.dequeue()
                blackHole(value)
            }
        }
    }
}
queueBenchmark.add(title: "QueueOptimized", input: [Int].self, maxSize: 128_000) { input in
    return { timer in
        var queue = QueueOptimized<Int>()
        input.forEach({ queue.enqueue($0) })
        timer.measure {
            for _ in 0..<input.count {
                let value = queue.dequeue()
                blackHole(value)
            }
        }
    }
}
queueBenchmark.main()
