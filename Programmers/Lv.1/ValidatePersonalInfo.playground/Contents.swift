import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var result: [Int] = []

    
    let (tYear, tMon, tDay) = dateStringToInt(today)
    
    var termsDict: [String : Int] = [:]
    
    for term in terms {
        let termSperated = term.split(separator: " ").map { String($0) }
        termsDict[termSperated[0]] = Int(termSperated[1])
    }
    
    for (index, privacy) in privacies.enumerated() {
        let privacyArr = privacy.split(separator: " ").map { String($0) }
        var (pYear, pMon, pDay) = dateStringToInt(privacyArr[0])
        let privacyRange: Int = termsDict[privacyArr[1]]!
        
        var (eYear, eMon, eDay) = (pYear, pMon, pDay)
        
        var expiringMonth: Int = pMon + privacyRange
    
        while expiringMonth > 12 {
            expiringMonth -= 12
            eYear += 1
        }

        eMon = expiringMonth

        if eYear < tYear { result.append(index + 1) }
        else if eYear == tYear && eMon < tMon { result.append(index + 1) }
        else if eYear == tYear && eMon == tMon && eDay <= tDay { result.append(index + 1) }

    }
    
    return result
}

func dateStringToInt(_ dateString: String) -> (year: Int, mon: Int, day: Int) {
    let dateArr: [Int] = dateString.split(separator: ".").map { Int($0)! }
    return (dateArr[0], dateArr[1], dateArr[2])
}


func solution2(_ todayDate:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var result: [Int] = []
    var today: Int = convertDateToDays(todayDate)
    var termDict = [String: Int]()
    
    terms.forEach { string in
        let term = string.components(separatedBy: " ")
        termDict[term[0]] = Int(term[1])
    }
    
    for (index, string) in privacies.enumerated() {
        let privacy = string.components(separatedBy: " ")
        
        if convertDateToDays(privacy[0]) + (termDict[privacy[1]] ?? 0) * 28 <= today {
            result.append(index + 1)
        }
    }
    
    return result
}

func convertDateToDays(_ date: String) -> Int {
    let dateArr: [String] = date.components(separatedBy: ".")
    let year = Int(dateArr[0]) ?? 0
    let mon = Int(dateArr[1]) ?? 0
    let day = Int(dateArr[2]) ?? 0
    return year * 28 * 12 + mon * 28 + day
}

let today: String = "2022.05.19"
let terms: [String] = ["A 6", "B 12", "C 3"]
let privacies: [String] = ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"]

let _ = solution(today, terms, privacies)
let _ = solution2(today, terms, privacies)
