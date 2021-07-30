/*
 583. 两个字符串的删除操作
 给定两个单词 word1 和 word2，找到使得 word1 和 word2 相同所需的最小步数，每步可以删除任意一个字符串中的一个字符。

 示例：

 输入: "sea", "eat"
 输出: 2
 解释: 第一步将"sea"变为"ea"，第二步将"eat"变为"ea"

 提示：

 给定单词的长度不超过500。
 给定单词中的字符只含有小写字母。

 思路:
 	1.动态规划
 	2.问题可以拆分成前一个子串匹配
 	3.比如sea eat，可以先比较s e需要去掉几个，一次增加
 	4.dp[i][j] 表示 s1[i - 1] s2[j - 1]需要删除几步才能变为相等字符串

 	if i == 0 || j == 0{
 		dp[i][j] = i + j
 	} else if s1[i - 1] == s2[j - 1] {
 		dp[i][j] = dp[i - 1][j - 1]
 	} else if s1[i - 1] != s2[j - 1] {
 		dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + 1
 	}

 */

func minDistance(_ word1: String, _ word2: String) -> Int {
    let char1 = Array(word1)
    let char2 = Array(word2)

    let count1 = char1.count
    let count2 = char2.count

    // var dp = Array(repeating: Array(repeating: 0, count: count2 + 1), count: count1 + 1)

    var odp = [Int](repeating: 0, count: count2 + 1)
    var leftTop = 0

    for i in 0 ... count1 {
        for j in 0 ... count2 {
            if i == 0 || j == 0 {
                leftTop = odp[j]
                // dp[i][j] = i + j
                odp[j] = i + j
            } else if char1[i - 1] == char2[j - 1] {
                let tmp = odp[j]
                // dp[i][j] = dp[i - 1][j - 1]
                odp[j] = leftTop
                leftTop = tmp
            } else {
                leftTop = odp[j]
                // dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + 1
                odp[j] = min(odp[j], odp[j - 1]) + 1
            }
        }
        // print(odp)
    }

    // print(dp)
    // print(odp)
    return odp[count2]
    // return dp[count1][count2]
}

let word1 = "sea"
let word2 = "eat"
print(minDistance(word1, word2))
