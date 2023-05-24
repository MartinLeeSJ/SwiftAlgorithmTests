import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var answer: Int64 = 0
    var sortedTimes = times.sorted { $0 < $1 }
    let maxTime: Int = sortedTimes.last ?? 0
    var currentTime: Int = sortedTimes.last ?? 0
    
    var low = 0
    var high = times.count - 1
    var index: Int {
        Int(low + (high - low) / 2)
    }
    
    var cycle: Int = 1

    while true {
        let numOfImmigration  = getNumOfImmigration(at: currentTime, in: sortedTimes)
        
        if n < numOfImmigration {
            break
        } else if n == numOfImmigration {
            answer = Int64(currentTime)
            return answer
        }
        
        currentTime += maxTime
        cycle += 1
    }
    
    while true {
        currentTime = sortedTimes[index] * cycle
        let numOfImmigration = getNumOfImmigration(at: currentTime, in: sortedTimes, until: index)
        switch  numOfImmigration {
        case 0..<n: low = index
        case n:
            answer = Int64(currentTime)
            break
        case (n + 1)...: high = index
        default: break
        }
    }
    
    return answer
}

func getNumOfImmigration(at currentTime: Int, in sortedTimes: [Int]) -> Int {
    sortedTimes.reduce(0) { $0 + Int(currentTime / $1) }
}

func getNumOfImmigration(at currentTime: Int, in sortedTimes: [Int], until end: Int) -> Int {
    var result: Int = 0
    for index in 0...end {
        result += Int(currentTime / sortedTimes[index])
    }
    return result
}

let _ = solution(6, [7, 10])
