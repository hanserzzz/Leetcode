/*

43. 字符串相乘
给定两个以字符串形式表示的非负整数 num1 和 num2，返回 num1 和 num2 的乘积，它们的乘积也表示为字符串形式。

注意：不能使用任何内置的 BigInteger 库或直接将输入转换为整数。

 

示例 1:

输入: num1 = "2", num2 = "3"
输出: "6"
示例 2:

输入: num1 = "123", num2 = "456"
输出: "56088"
 

提示：

1 <= num1.length, num2.length <= 200
num1 和 num2 只能由数字组成。
num1 和 num2 都不包含任何前导零，除了数字0本身


思路:
	1.先乘再加

*/



func multiply(_ num1: String, _ num2: String) -> String {
    if num1 == "0" || num2 == "0" { return "0" }
    if num1.count == 1 || num2.count == 1 { return singlePursueString(num1, num2) }

    var carry = 0
    var temp = [String]()
    let chars = Array(num1)
    for i in (0..<chars.count).reversed() {
        var n = singlePursueString(String(chars[i]), num2)

        if carry > 0 {
            for _ in 0..<carry {
                n += "0"
            }
        }
        temp.append(n)
        carry += 1
    }
    // for c in num1 {
    // 	temp.append(singlePursueString(String(c), num2))
    // } 

    var ans = "0"
    for s in temp {
        ans = addString(ans, s)
    }
    return ans
}


func addString(_ s1: String, _ s2: String) -> String {
    let chars1 = Array(s1), chars2 = Array(s2)
    let count1 = chars1.count, count2 = chars2.count

    if count1 == 0 { return String(chars2) }
    if count2 == 0 { return String(chars1) }

    var ret = [String]()
    var carry = 0
    var idx1 = count1 - 1, idx2 = count2 - 1
    while idx1 >= 0, idx2 >= 0 {
        let c1 = chars1[idx1], c2 = chars2[idx2]
        let temp = c1.wholeNumberValue! + c2.wholeNumberValue! + carry

        ret.insert(String(temp%10),at: 0)
        carry = temp/10

        idx1 -= 1
        idx2 -= 1
    }

    while idx1 >= 0 {
        let c = chars1[idx1]
        let temp = c.wholeNumberValue! + carry

        ret.insert(String(temp%10),at: 0)
        carry = temp/10

        idx1 -= 1
    }

    while idx2 >= 0 {
        let c = chars2[idx2]
        let temp = c.wholeNumberValue! + carry

        ret.insert(String(temp%10),at: 0)
        carry = temp/10

        idx2 -= 1
    }

    if carry > 0 {
        ret.insert(String(carry), at: 0)
    }

    return ret.joined()
}


func singlePursueString(_ s1: String, _ s2: String) -> String {
    if s1.count == 1, s2.count != 1 {
        return singlePursueString(s2, s1)
    }

    if s2 == "1" { return s1 }
    if s1 == "1" { return s2 }

    let mul = Int(s2)!
    var carry = 0
    let chars = Array(s1)
    var ret = [String]()
    for i in (0..<chars.count).reversed() {
        let c = chars[i]
        let temp = c.wholeNumberValue! * mul + carry

        ret.insert(String(temp%10), at: 0)
        carry = temp/10
    }

    if carry > 0 {
        ret.insert(String(carry), at: 0)
    }
    return ret.joined()
}


let s1 = "2"
let s2 = "3"

// print(addString(s1, s2))

// print(singlePursueString("12", "9"))


print(multiply(s1, s2))





















