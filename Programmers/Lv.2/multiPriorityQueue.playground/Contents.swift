import Foundation

func solution(_ operations:[String]) -> [Int] {
    var answer: [Int] = [0,0]
    // operations를 순회하며 queue에 넣는다.
    // I로 시작하는 경우
    // queue를 순회하면 자신보다 큰 요소가 나오면 해당 인덱스 앞자리에 삽입한다.
    // D -1일 경우
    // queue 의 맨앞을 drop
    // D 1일경우
    // queue 의 맨 뒤를 drop
    var queue = [Int]()
    
    for operation in operations {
        if operation.contains("I") {
            let num: Int = Int(operation.split(separator: " ")[1])!
            
            if queue.isEmpty || queue.last! <= num { queue.append(num) }
            else {
                for (index, el) in queue.enumerated() {
                    if num <= el {
                        queue.insert(num, at: index)
                        break
                    }
                }
            }
            
        } else if operation == "D -1" && !queue.isEmpty  {
            queue.removeFirst()
        } else if operation == "D 1" && !queue.isEmpty {
            queue.removeLast()
        }
        print(queue)
    }
    
    if !queue.isEmpty, let first = queue.first, let last = queue.last {
        answer[0] = last
        answer[1] = first
    }
     
    return answer
}

let operations: [String] = ["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333"]
let _ = solution(operations)

