import Foundation

struct Process {
    let priorities: [Int] 
    let location: Int
    
    init(priorities: [Int], location: Int) {
        self.priorities = priorities
        self.location = location
    }
    
    func getProcessNumber() -> Int {
        var answer: Int = 0
        var processDict = [Int:Int]()
        var priorityQueue = self.priorities
        var indexQueue = self.priorities.enumerated().map { (index, priority) in
            if let value = processDict[priority] {
                processDict.updateValue(value + 1, forKey: priority)
            } else {
                processDict[priority] = 1
            }
            return index
        }
        
        var processArray = processDict.keys.sorted { $0 > $1 }
        
        while true {
            guard let biggestProcess = processArray.first else { break }
            guard let restProcesses = processDict[biggestProcess], restProcesses != 0 else {
                processArray.removeFirst()
                continue
            }
            
            let index = priorityQueue.firstIndex(of: biggestProcess) ?? 0
            priorityQueue = getRearranging(of: priorityQueue, between: index)
            indexQueue = getRearranging(of: indexQueue, between: index)
            
            priorityQueue.removeFirst()
            processDict.updateValue(restProcesses - 1, forKey: biggestProcess)
            
            answer += 1
            
            if indexQueue.removeFirst() == self.location {
                break
            }
            
        }
        
        
        
        return answer
    }
    
    
    private func getRearranging(of array: [Int], between index: Int) -> [Int] {
        Array(array[index...]) + Array(array[0..<index])
    }
    
}
