
import Foundation

//m: 당구대의 가로길이
//n: 당구대의 세로길이
/*
3 ≤ m, n ≤ 1,000
0 < startX < m
0 < startY < n
2 ≤ balls의 길이 ≤ 1,000
 */

// 벽을 기준으로 반사된 startX와 startY의 좌표값을 모두 구한뒤 공의 위치와 가장 거리가 짧은 값을 결과로 내보내면 된다.
// 단 x좌표와 y좌표가 공의 위치와 시작점의 위치가 같은 경우는 제외한다.

func solution(_ m:Int, _ n:Int, _ startX:Int, _ startY:Int, _ balls:[[Int]]) -> [Int] {
    typealias XandY = (x: Int, y: Int)
    
    var result = Array(repeating: Int.max, count: balls.count)
    
    
    let coordinates: [XandY] = [(startX, 2 * n - startY), (startX, -startY), (2 * m - startX, startY), (-startX, startY)]
    
    for (index, ball) in balls.enumerated() {
        for coordinate in coordinates {
            // 시작점과 반사된 지점간 방향이 시작점과 공위치간 방향과 일치하는 경우를 제거
            if ball[0] == startX {
                if startY > ball[1] && startY > coordinate.y { continue }
                if startY < ball[1] && startY < coordinate.y { continue }
            }
            
            if ball[1] == startY {
                if startX < ball[0] && startX < coordinate.x { continue }
                if startX > ball[0] && startX > coordinate.x { continue }
            }
         
            
            
                let dx = coordinate.x - ball[0]
                let dy = coordinate.y - ball[1]
                let dSquared: Int = dx * dx + dy * dy
                if dSquared <= result[index] { result[index] = dSquared }
            
        }
        
        
    }
    
    
    
    return result
}

let _ = solution(10, 10, 3, 7, [[7, 7], [2, 7], [7, 3]])
