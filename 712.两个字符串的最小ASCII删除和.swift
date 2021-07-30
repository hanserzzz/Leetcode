/*

 712. 两个字符串的最小ASCII删除和
 给定两个字符串s1, s2，找到使两个字符串相等所需删除字符的ASCII值的最小和。

 示例 1:

 输入: s1 = "sea", s2 = "eat"
 输出: 231
 解释: 在 "sea" 中删除 "s" 并将 "s" 的值(115)加入总和。
 在 "eat" 中删除 "t" 并将 116 加入总和。
 结束时，两个字符串相等，115 + 116 = 231 就是符合条件的最小和。
 示例 2:

 输入: s1 = "delete", s2 = "leet"
 输出: 403
 解释: 在 "delete" 中删除 "dee" 字符串变成 "let"，
 将 100[d]+101[e]+101[e] 加入总和。在 "leet" 中删除 "e" 将 101[e] 加入总和。
 结束时，两个字符串都等于 "let"，结果即为 100+101+101+101 = 403 。
 如果改为将两个字符串转换为 "lee" 或 "eet"，我们会得到 433 或 417 的结果，比答案更大。
 注意:

 0 < s1.length, s2.length <= 1000。
 所有字符串中的字符ASCII值在[97, 122]之间。

 思路:
 	1.动态规划，此题和583类似,只是权重不同，要用ASCII做权重
 	2.dp[i][j]  标识 s1[0...i] s2[0...j] 需要删去字母的的最小值

 	if i == 0 || j == 0 {
 		dp[i][j] = i + 1
 	} else if s1[i] == s2[j] {
 		dp[i][j] = dp[i - 1][j - 1]
 	} else {
 		dp[i][j] = min(dp[i - 1][j] + s1[i].ascValue, dp[i][j - 1] + s2[j].ascValue)
 	}
 */

func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
    let chars1 = Array(s1)
    let chars2 = Array(s2)

    let count1 = chars1.count
    let count2 = chars2.count

    var dp = [[Int]](repeating: [Int](repeating: 0, count: count2 + 1), count: count1 + 1)

    for i in 1 ... count1 {
        dp[i][0] = Int(chars1[i - 1].asciiValue!) + dp[i - 1][0]
    }

    for j in 1 ... count2 {
        dp[0][j] = Int(chars2[j - 1].asciiValue!) + dp[0][j - 1]
    }

    print(dp)
    for i in 1 ... count1 {
        for j in 1 ... count2 {
            if chars1[i - 1] == chars2[j - 1] {
                dp[i][j] = dp[i - 1][j - 1]
            } else {
                dp[i][j] = min(dp[i - 1][j] + Int(chars1[i - 1].asciiValue!), dp[i][j - 1] + Int(chars2[j - 1].asciiValue!))
            }
        }
    }

    print(dp)
    return dp[count1][count2]
}

let s1 = "delete", s2 = "leet"
print(minimumDeleteSum(s1, s2))
