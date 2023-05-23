import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var answer = 1
    var currentA: Int = min(a, b)
    var currentB: Int = max(a, b)
    
    while currentB - currentA != 1 || currentB % 2 != 0 {
        currentA = currentA % 2 == 0 ? currentA / 2 : (currentA + 1) / 2
        currentB = currentB % 2 == 0 ? currentB / 2 : (currentB + 1) / 2
        answer += 1
    }


    return answer
}

let _ = solution(8, 4, 5)
