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
        /*
             重新检查答案，看看当前答案是否符合字典序最小，要参考之前记录的map
             1.当前的Letter小于最后一位，如果最后一位后边还会出现则可暂时放弃当前最后一位，由当前游标Letter去顶替最后一位才可以保证字典序最小
             2.（result.last! > c,!used.contains(c)） 如果前边已经出现当前c则，而且c小于当前答案的最后一位，则是合理的
         */
        while result.count > 0, result.last! > c, record[result.last!]! > i, !used.contains(c) {
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

let s = "cbaacabcaaccaacababa"
let res = removeDuplicateLetters(s)
print(res)
