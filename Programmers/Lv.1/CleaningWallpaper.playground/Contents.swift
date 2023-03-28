import Foundation


//[lux, luy, rdx, rdy] 배열을 리턴해야함
//lux 와 luy 는 파일들의 좌표값중 최솟값이며
// rdx, rdy 는 파일들의 좌표값중 최댓값이다.


//[".#...", "..#..", "...#."]    [0, 1, 3, 4]

func solution(_ wallpaper:[String]) -> [Int] {
    var result = [0, 0, 0, 0]
    var isFirstFileDetected: Bool = false
    
    for (xIndex, row) in wallpaper.enumerated() {
        for (yIndex ,file) in row.enumerated() {
            if !isFirstFileDetected && file == "#" {
                result[0] = xIndex
                result[1] = yIndex
                result[2] = xIndex + 1
                result[3] = yIndex + 1
                isFirstFileDetected = true
            } else if isFirstFileDetected && file == "#" {
                result[0] = min(result[0], xIndex)
                result[1] = min(result[1], yIndex)
                // 파일의 좌측 하단까지 드래그 해야하므로
                result[2] = max(result[2], xIndex + 1)
                result[3] = max(result[3], yIndex + 1)
            }
        }
    }
    
    
    return result
}


let _ = solution(["..", "#."])
