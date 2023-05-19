import Foundation


let targetNumber = TargetNumber()
targetNumber.getTargetNumber()

struct TargetNumber {
    var numbers: [Int]
    var target: Int
    
    init(numbers: [Int] = [1, 2, 3, 4, 5] , target: Int = 7) {
        self.numbers = numbers
        self.target = target
    }
    
    func getTargetNumber() {
        print(solution(self.numbers, self.target))
    }
    
    
    private func solution(_ numbers:[Int], _ target:Int) -> Int {
        if numbers.isEmpty && target == 0 {
            return 1 }
        var answer: Int = 0
        
        if let first = numbers.first {
            let droppedFirst: [Int] = Array(numbers.dropFirst())
            let plus = solution(droppedFirst, target - first)
            let minus = solution(droppedFirst, target + first)
            
            answer += plus
            answer += minus
        }
        return answer
    }
}
