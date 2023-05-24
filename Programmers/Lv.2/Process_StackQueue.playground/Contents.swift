import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var priorites = priorities
    var answer: Int = 1
    var locations: [Int] = priorites.enumerated().map { (index, _) in
        return index
    }
    
    while true {
        guard let max = priorites.max() else { break }
        let first = priorites.removeFirst()
        let firstLocation = locations.removeFirst()
        
        
        if first != max {
            priorites.append(first)
            locations.append(firstLocation)
            continue
        }
        
        if location == firstLocation {
            return answer
        }
            
        answer += 1
    }
    return answer
}


let _ = solution([1, 1, 9, 1, 1, 1], 0)
