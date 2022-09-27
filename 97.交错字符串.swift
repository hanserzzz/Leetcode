/*
 
 97. 交错字符串
 给定三个字符串 s1、s2、s3，请你帮忙验证 s3 是否是由 s1 和 s2 交错 组成的。

 两个字符串 s 和 t 交错 的定义与过程如下，其中每个字符串都会被分割成若干 非空 子字符串：

 s = s1 + s2 + ... + sn
 t = t1 + t2 + ... + tm
 |n - m| <= 1
 交错 是 s1 + t1 + s2 + t2 + s3 + t3 + ... 或者 t1 + s1 + t2 + s2 + t3 + s3 + ...
 注意：a + b 意味着字符串 a 和 b 连接。

  

 示例 1：


 输入：s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
 输出：true
 示例 2：

 输入：s1 = "aabcc", s2 = "dbbca", s3 = "aadbbbaccc"
 输出：false
 示例 3：

 输入：s1 = "", s2 = "", s3 = ""
 输出：true
  

 提示：

 0 <= s1.length, s2.length <= 100
 0 <= s3.length <= 200
 s1、s2、和 s3 都由小写英文字母组成
 
 思路:
    1.动态规划
    2.f[i][j] 依赖之前的结果和对比结果
    3.f[i - 1][j] && s1[i] == s3[i + j - 1]
      f[i][j - 1] && s2[i] == s3[i + j - 1]
 
 
 */

func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
    let count1 = s1.count, count2 = s2.count, count3 = s3.count
    if count1 + count2 != count3 {
        return false
    }

    let chars1 = Array(s1)
    let chars2 = Array(s2)
    let chars3 = Array(s3)

    var dp = Array(repeating: Array(repeating: false, count: count2 + 1), count: count1 + 1)
    dp[0][0] = true
    for i in 0...count1 {
        for j in 0...count2 {
            let p = i + j - 1
            var result = dp[i][j]
            if i > 0, chars1[i - 1] == chars3[p] {
                result = result || dp[i - 1][j]
            }

            if j > 0, chars2[j - 1] == chars3[p] {
                result = result || dp[i][j - 1]
            }

            dp[i][j] = result
        }
    }
    return dp[count1][count2]
}




