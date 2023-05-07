
import Foundation

/// 길이가 같은 배열 A, B 두개가 있습니다. 각 배열은 자연수로 이루어져 있습니다.
/// 배열 A, B에서 각각 한 개의 숫자를 뽑아 두 수를 곱합니다.
/// 이러한 과정을 배열의 길이만큼 반복하며, 두 수를 곱한 값을 누적하여 더합니다.
/// 이때 최종적으로 누적된 값이 최소가 되도록 만드는 것이 목표입니다.
/// (단, 각 배열에서 k번째 숫자를 뽑았다면 다음에 k번째 숫자는 다시 뽑을 수 없습니다.)
/// 예를 들어 A = [1, 4, 2] , B = [5, 4, 4] 라면
/// 29가 최솟값이 됩니다
///
/// - 나의 추측: 각 배열에서 가장 차이가 큰 수 끼리 곱한 값을 더했을 때 최솟값이 나온다
///

func solution(_ A:[Int], _ B:[Int]) -> Int {
    var answer = 0
    
    let sortedAscendA = A.sorted { $0 <= $1 }
    let sortedDescendB = B.sorted { $0 >= $1 }
    
    for i in 0..<sortedAscendA.count {
        answer += sortedAscendA[i] * sortedDescendB[i]
    }

    return answer
}


let A = [1, 4, 2]
let B = [5, 4, 4]
let result = solution(A, B)

print(result)
