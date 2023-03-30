import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    var reportedWhomDict: [String: Set<String>] = [:]
    var reportedNumDict: [String: Int] = [:]
    
    
    for user in id_list {
        reportedWhomDict[user] = Set<String>()
        reportedNumDict[user] = 0
    }
    
    for doc in report {
        let array: [String] = doc.split(separator: " ").map { String($0) }
        let oldValue: Int = reportedWhomDict[array[0]]!.count
        
        reportedWhomDict[array[0]]!.insert(array[1])
        
        let newValue: Int = reportedWhomDict[array[0]]!.count
        
        if !(oldValue == newValue) {
            reportedNumDict[array[1]]! += 1
        }
    }
    
    var bannedUser: [String] = reportedNumDict.filter { $0.value >= k }.map { $0.key }
    
    var result: [Int] = id_list.map { reportedWhomDict[$0]!.intersection(Set(bannedUser)).count }
    
    return result
}

let idList: [String] = ["muzi", "frodo", "apeach", "neo"]
let report: [String] = ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]
let k: Int = 2

let _ = solution(idList, report, k)

