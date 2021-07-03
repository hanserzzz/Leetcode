/*

 316. 去除重复字母
 给你一个字符串 s ，请你去除字符串中重复的字母，使得每个字母只出现一次。需保证 返回结果的字典序最小（要求不能打乱其他字符的相对位置）。

 注意：该题与 1081 https://leetcode-cn.com/problems/smallest-subsequence-of-distinct-characters 相同

 示例 1：

 输入：s = "bcabc"
 输出："abc"
 示例 2：

 输入：s = "cbacdcbc"
 输出："acdb"

 思路：
 	遍历字符串实现两个要求
 		1.去重复
 		2.字典序最小(让较小的排在高位)

 	思路：
 		1.记录每个元素最后一次出现位置
 		2.插入尾部字符时，要先判断前一个字符是否小于当前字符，如果大于当前字符，而且后边还会有重复出现，则当前字符顶替前一个位置

 */

func removeDuplicateLetters(_ s: String) -> String {
    let chars = Array(s)
    var record = [Character: Int]()
    for (i, c) in chars.enumerated() {
        record[c] = i
    }

    var used = Set<Character>()
    var result = [Character]()
    for (i, c) in chars.enumerated() {
        while result.count > 0, result.last! > c, record[result.last!]! > i {
            used.remove(result.last!)
            result.removeLast()
        }
        if !used.contains(c) {
            result.append(c)
            used.insert(c)
        }
    }

    return String(result)
}

let s = "cbacdcbc"
let res = removeDuplicateLetters(s)
print(res)
