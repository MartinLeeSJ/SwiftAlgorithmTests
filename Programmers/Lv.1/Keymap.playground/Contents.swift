import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var result = [Int]()
    
    var charDict = [Character:Int]()
    
    for target in targets {
        var typing: Int = 0
        for char in target {
            var min: Int = Int.max
            if let log = charDict[char] {
                print("char: \(char), log: \(log)")
                typing += log
            } else {
                for key in keymap {
                    if let i = key.firstIndex(of: char) {
                        let index = key.distance(from: key.startIndex, to: i) + 1
                        if index <= min { min = index }
                    }
                }
                
                if min == Int.max {
                    typing = -1
                    break
                } else {
                    charDict[char] = min
                    typing += min
                }
            }
        }
        
        result.append(typing)
    }
    
    return result
}

func test() {
    let str = "AVC"
    let target: Character = "B"
    if let i = str.firstIndex(of: target) {
        print(str.distance(from: str.startIndex, to: i))
    }
}


let keymap: [String] = ["AGZ", "BSSS"]
let targets: [String] = ["ASA","BGZ"]

let _ = solution(keymap, targets)
let _ = test()

        
