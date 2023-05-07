import Foundation
/// Leo가 본 카펫에서 갈색 격자의 수 brown, 노란색 격자의 수 yellow가 매개변수로 주어질 때
/// 카펫의 가로, 세로 크기를 순서대로 배열에 담아 return 하도록 solution 함수를 작성해주세요.
/// - 갈색 격자의 수 brown은 8 이상 5,000 이하인 자연수입니다.
/// - 노란색 격자의 수 yellow는 1 이상 2,000,000 이하인 자연수입니다.
/// - 카펫의 가로 길이는 세로 길이와 같거나, 세로 길이보다 깁니다.


// 가로를 x 세로를 y 라고 하면
// 갈색타일의 수는 2(x + y) - 4 개
// 노란타일 수는 (x - 2)(y - 2)다
// 두개를 더하면 xy 다 즉 가로세로를 곱한 값이다.
func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var result: [Int] = []
    
    let widthTimesHeight = brown + yellow
    let widthPlusHeight = Int(brown / 2) + 2
    
    var height = 3
    var width = Int(widthTimesHeight / height)
    
    while height <= width {
        if width + height == widthPlusHeight && width * height == widthTimesHeight {
            result.append(width)
            result.append(height)
            break
        }
        height += 1
        width = Int(widthTimesHeight / height)
    }
    

    
    return result
}

let brown = 24
let yellow = 24
let result = solution(24, 24)
print(result)

