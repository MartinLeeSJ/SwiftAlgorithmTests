import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var networkArray = [Set<Int>]()
    
    
    for outer in 0..<n {
        for inner in outer..<n {
            
            
        }
    }
    
    return networkArray.count
}

let n: Int = 4
let computers: [[Int]] = [[1, 1, 0, 1],
                          [1, 1, 1, 1],
                          [0, 1, 1, 1],
                          [1, 1, 1, 1]]
let _ = solution(n, computers) // 2


let test1: Set<Int> = [1, 2]
let test2: Set<Int> = [2, 1]

print(test1 == test2)
