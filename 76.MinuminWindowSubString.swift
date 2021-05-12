/**
 76. 最小覆盖子串
 给你一个字符串 s 、一个字符串 t 。返回 s 中涵盖 t 所有字符的最小子串。如果 s 中不存在涵盖 t 所有字符的子串，则返回空字符串 "" 。

 注意：如果 s 中存在这样的子串，我们保证它是唯一的答案。

 示例 1：

 输入：s = "ADOBECODEBANC", t = "ABC"
 输出："BANC"
 示例 2：

 输入：s = "a", t = "a"
 输出："a"

 提示：

 1 <= s.length, t.length <= 105
 s 和 t 由英文字母组成

 */

/**
 滑动窗口
 */

func minWindow(_ s: String, _ t: String) -> String {
    var need = [Character: Int]()
    var window = [Character: Int]()
    var l = 0, r = 0, valid = 0, start = 0, length = 0

    let s_chars = Array(s)
    let t_chars = Array(t)

    for c in t_chars {
        let v = need[c] ?? 0
        need[c] = v + 1
    }

    while r < s.count {
        let c = s_chars[r]
        window[c] = (window[c] ?? 0) + 1

        if let v = need[c], v > 0, v == window[c] {
            valid += 1
        }

        // 判断是会否需要收缩窗口
        while valid == need.count {
            // 现在符合条件，每次收缩窗口前更新答案
            start = l
            length = r - l

            let d = s_chars[l]
            if window[d] == need[d] {
                valid -= 1
            }
            window[d] = window[d]! - 1
            l += 1
        }

        r += 1
    }

    return String(s_chars[start ... (start + length)])
}

let result = minWindow("ADOBECODEBANC", "ABC")
print(result)
