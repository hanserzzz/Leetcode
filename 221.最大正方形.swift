/*
221. 最大正方形
在一个由 '0' 和 '1' 组成的二维矩阵内，找到只包含 '1' 的最大正方形，并返回其面积。

 

示例 1：


输入：matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
输出：4
示例 2：


输入：matrix = [["0","1"],["1","0"]]
输出：1
示例 3：

输入：matrix = [["0"]]
输出：0
*/


func maximalSquare(_ matrix: [[Character]]) -> Int {
    let row = matrix.count, colum = matrix[0].count
    var res = 0
    var dp = Array(repeating: Array(repeating: 0, count: colum), count: row)
    
    for i in 0..<row {
        for j in 0..<colum {
            if matrix[i][j] == "1" {
                if i == 0 || j == 0 {
                    dp[i][j] = 1
                } else {
                    dp[i][j] = min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1
                }
                res = max(dp[i][j], res)
            }
        }
    }
    return res * res
}

