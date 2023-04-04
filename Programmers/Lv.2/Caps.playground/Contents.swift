import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var answer: Int64 = 0
    
    // 트럭에 실린 택배 및 수거상자 수
    var dAcc: Int = 0
    var pAcc: Int = 0
    
    
    //트럭이 돌아오는 지점을 담은 배열
    var dIndexes = [Int]()
    var pIndexes = [Int]()
   
   
    
    for i in 0..<n {
        let index = n - i - 1
        
        if deliveries[index] != 0 {
            dAcc += deliveries[index]
            if dAcc - deliveries[index] == 0 {
                dIndexes.append(index + 1)
            }
            
            while dAcc > 4 {
                dAcc -= 4
                dIndexes.append(index + 1)
            }
        }
        
        if  pickups[index] != 0 {
            pAcc += pickups[index]
            if pAcc - pickups[index] == 0 {
                pIndexes.append(index + 1)
            }
            
            while pAcc > 4 {
                pAcc -= 4
                pIndexes.append(index + 1)
            }
        }
    }
    
    let maxLength: Int = max(dIndexes.count, pIndexes.count)
    
    for index in 0..<maxLength {
        var dLen: Int = 0
        var pLen: Int = 0
        
        if index < dIndexes.count { dLen = dIndexes[index]}
        if index < pIndexes.count { pLen = pIndexes[index]}
        

        answer += Int64(2 * max(dLen ?? 0, pLen ?? 0))
    }
    
    
   
    return answer
}

let cap: Int = 4
let n: Int = 5
let deliveries: [Int] = [1, 0, 3, 1, 2]
let pickups: [Int] = [0, 3, 0, 4, 0]

let _ = solution(cap, n, deliveries, pickups)

//d:211 [3]
//p: 04 [4]



//let _ = test()
