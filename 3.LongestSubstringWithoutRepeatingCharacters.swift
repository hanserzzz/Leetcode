/**
 3. 无重复字符的最长子串
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

 示例 1:

 输入: s = "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: s = "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: s = "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 示例 4:

 输入: s = ""
 输出: 0

 提示：

 0 <= s.length <= 5 * 104
 s 由英文字母、数字、符号和空格组成

 */

// func lengthOfLongestSubstring(_ s: String) -> Int {
//     let chars = Array(s)
//     var result = 0, l = 0, r = 0
//     var window = [Character: Int]()

//     var start = 0

//     while r < chars.count {
//         let c = chars[r]
//         window[c] = (window[c] ?? 0) + 1
//         r += 1

//         while window[c]! > 1 {
//             let d = chars[l]
//             window[d] = window[d]! - 1
//             l += 1
//         }

//         if r - l > result {
//             start = l
//         }

//         result = max(result, r - l)
//     }

//     print(String(chars[start ..< (start + result)]))
//     return result
// }

// print(lengthOfLongestSubstring("pwwwkew"))

func lengthOfLongestSubString(_ s: String) -> String {
    let chars = Array(s)
    var l = 0, r = 0, start = 0, length = 0
    var mSet = Set<Character>()

    while r < chars.count {
        let c = chars[r]
        if !mSet.contains(c) {
            mSet.insert(c)
            r += 1
            if r - l > length { start = l }
            length = max(length, r - l)
        } else {
            let d = chars[l]
            mSet.remove(d)
            l += 1
        }
    }
    return String(chars[start ..< (start + length)])
}

print(lengthOfLongestSubString("pwwwkew"))
