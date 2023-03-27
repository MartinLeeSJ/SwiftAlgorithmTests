import UIKit


struct TestExample {
    
    static func solution(_ park:[String], _ routes:[String]) -> [Int] {
        var parkArray: [[Character]] = park.map { Array($0) }
        let width: Int = parkArray.first!.count
        let height: Int = parkArray.count
        
        var result: [Int] = .init(repeating: 0, count: 2)
        
        
        for xIndex in 0..<height {
            if let yIndex = parkArray[xIndex].firstIndex(of: "S") {
                result[0] = xIndex
                result[1] = yIndex
                break
            }
        }
        
        for route in routes {
            var isValidRoute: Bool = true
            let op: String = String(route.prefix(1))
            let n: Int = Int(route.suffix(1))!
            
            var x: Int = result[0]
            var y: Int = result[1]
            
            switch op {
            case "E":
                if y + n >= width {
                    print("out of range")
                    isValidRoute = false
                    
                }
            case "W":
                if y - n < 0 { isValidRoute = false }
            case "S":
                if x + n >= height { isValidRoute = false }
            case "N":
                if x - n < 0 { isValidRoute = false }
            default: print("doesn't work")
            }
            
            if isValidRoute {
                for _ in 0..<n {
                    switch op {
                    case "E":
                            if parkArray[x][y + 1] == "X" {
                                isValidRoute = false
                                break
                            } else {
                                y += 1
                            }
                    case "W":
                    
                            if parkArray[x][y - 1] == "X" {
                                isValidRoute = false
                                break
                            } else {
                                y -= 1
                            }
                    case "S":

                            if parkArray[x + 1][y] == "X" {
                                isValidRoute = false
                                break
                            } else {
                                x += 1
                            }
                        
                    case "N":
                            if parkArray[x - 1][y] == "X" {
                                isValidRoute = false
                                break
                            } else {
                                x -= 1
                            }
                        
                    default: print("doesn't work")
                    }
                }
            }
            
            if isValidRoute {
                result[0] = x
                result[1] = y
            }
            
        }
        
        return result
        
    }
}

var greeting = "Hello, playground"
let _ = print(TestExample.solution(["OOOOO" ,"OXXXO","OXOOO","OXXXO", "OOOOS"], ["E 2", "N 2", "N 2", "W 4", "E 1", "S 1"]))

