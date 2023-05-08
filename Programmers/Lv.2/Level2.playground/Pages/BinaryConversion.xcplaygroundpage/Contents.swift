//: [Previous](@previous)

import Foundation

let s = "110010101001"
print(solution(s))

func solution(_ s:String) -> [Int] {
    var answer: [Int] = [0, 0]
    
    guard s != "1" else { return answer }
    
    var string = s
    
    string = string.filter { element in
        guard element != "0" else {
            answer[1] += 1
            return false
        }
        
        return true
    }
    
    string = String(string.count, radix: 2)
    
    answer[0] += 1
    
    let result = solution(string)
    
    answer[0] += result[0]
    answer[1] += result[1]
    
    
    return answer
}
