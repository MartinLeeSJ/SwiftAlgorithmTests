import Foundation

let s = "(()("
let result = solution(s)
print(result)

func solution(_ s:String) -> Bool {
    var answer: Bool = true
    var bracketStack: [Character] = []
    
    for bracket in s {
        switch bracket {
        case "(": bracketStack.append(bracket)
        case ")" where bracketStack.popLast() == "(": continue
        default:
            answer = false
            break
        }
    }
    
    if !bracketStack.isEmpty {
        return false
    }
    return answer
}

