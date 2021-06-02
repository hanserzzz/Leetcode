/*

 数字转换字母

 A : 1
 B : 2
 C : 3

 Z : 26

 AA : 27

 AZ : 52

 AAA : 703 = 26^(2)*1 + 26*1 + 1

 BCAC = 26^3*2 + 26^2*3 + 26^1*1 + 3

 */

let map: [Int: String] = [1: "A", 2: "B", 3: "C", 4: "D", 5: "E", 6: "F", 7: "G", 8: "H", 9: "I", 10: "J",
                          11: "K", 12: "L", 13: "M", 14: "N", 15: "O", 16: "P", 17: "Q", 18: "R", 19: "S",
                          20: "T", 21: "U", 22: "V", 23: "W", 24: "X", 25: "Y", 26: "Z"]

func numberToLetters(_ n: Int) -> String {
    if n <= 0 { return "" }

    var tmp = n
    var result = [String]()
    while tmp > 0 {
        let cur = tmp % 26 == 0 ? 26 : tmp % 26
        result.insert(map[cur]!, at: 0)
        tmp -= cur
        tmp /= 26
    }
    return result.joined()
}

print(numberToLetters(676))
