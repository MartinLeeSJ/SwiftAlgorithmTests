import Foundation
func solution(_ s:String) -> String {
    var answer: String = ""
    
    let nums: [Int] = s.split(separator: " ").map { Int($0) ?? 0 }
    
    var min: Int = nums.first ?? 0
    var max: Int = nums.first ?? 0
    
    for num in nums {
        if num <= min { min = num }
        if num >= max { max = num }
    }
    
    answer += String(min)
    answer += " "
    answer += String(max)
    
    
    

    return answer
}


func solution2(_ s: String) -> String {
    var answer: String = ""
    var minNum = Int()
    var maxNum = Int()
    
    if let first = s.first {
        if String(first) == "-" {
            minNum = Int(s[...s.index(after: s.startIndex)]) ?? 0
            maxNum = Int(s[...s.index(after: s.startIndex)]) ?? 0
        } else {
            minNum = Int(String(first)) ?? 0
            maxNum = Int(String(first)) ?? 0
        }
    }
    
    var numString: String = ""
    
    for char in s {
        if char == " " { continue }
        else if char == "-" { numString += String(char)}
        else {
            numString += String(char)
            minNum = min(Int(numString) ?? 0, minNum)
            maxNum = max(Int(numString) ?? 0, maxNum)
            
            numString = ""
        }
    }
    
    answer += String(minNum)
    answer += " "
    answer += String(maxNum)
    
    
    return ""
}
// rumtimeError???

let _ = solution2("1 2 3 4")
