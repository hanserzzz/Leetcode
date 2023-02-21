/**
 763. 划分字母区间
 给你一个字符串 s 。我们要把这个字符串划分为尽可能多的片段，同一字母最多出现在一个片段中。

 注意，划分结果需要满足：将所有划分结果按顺序连接，得到的字符串仍然是 s 。

 返回一个表示每个字符串片段的长度的列表。

  

 示例 1：
 输入：s = "ababcbacadefegdehijhklij"
 输出：[9,7,8]
 解释：
 划分结果为 "ababcbaca"、"defegde"、"hijhklij" 。
 每个字母最多出现在一个片段中。
 像 "ababcbacadefegde", "hijhklij" 这样的划分是错误的，因为划分的片段数较少。
 示例 2：

 输入：s = "eccbbbbdec"
 输出：[10]
  

 提示：

 1 <= s.length <= 500
 s 仅由小写英文字母组成
 
 思路：
    1.用一个map记录每个字母最右边的位置
    2.遍历当前字符串，并更新当前字符串中的最右位置到达符合的最右位置清空记录下一个字符串
 
 */


func partitionLabels(_ s: String) -> [Int] {
    let chars = Array(s)
    var records = [Character: Int]()
    // 首次遍历记录每个字符的最后位置
    for i in 0..<chars.count {
        let c = chars[i]
        records[c] = i
    }
    
    var result = [Int]()
    var maxRight = 0
    var left = -1
    for i in 0..<chars.count {
        let c = chars[i]
        let cMaxRight = records[c]!
        maxRight = max(maxRight, cMaxRight)  // 更新目前段最大右侧边界
        if maxRight == i {
            result.append(i - left)
            left = i
        }
    }
    return result
}

let s = "ababcbacadefegdehijhklij"
print(partitionLabels(s))
