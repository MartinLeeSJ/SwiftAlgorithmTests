import Foundation

func solution(_ grid:[String]) -> [Int] {
    enum Direction: Int, CaseIterable {
        case N = 0
        case E = 90
        case S = 180
        case W = 270
    }
    var resultSet = [Set<String>]()
    var pathQueue = [String]()
    
    let w = grid.first?.count ?? 0
    let h = grid.count
    
    for x in 0..<h {
        for y in 0..<w {
            print("hello")
        }
    }
    
    return []
}

let grid: [String] = ["SL","LR"]
let _ = solution(grid)// [16]

