

import Foundation


let relation: [[String]] = [["100", "ryan", "music", "2"], ["200", "apeach", "math", "2"], ["300", "tube", "computer", "3"], ["400", "con", "computer", "4"], ["500", "muzi", "music", "3"], ["600", "apeach", "music", "2"]]

let _ = printRelation(relation: relation)

func printRelation(relation:[[String]]) {
    let rowLength: Int = relation.first?.count ?? 0
    for column in 0..<rowLength - 1 {
        print(Set(relation.map{$0[column]}))
    }
}

