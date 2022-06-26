/*
64. 最小路径和
给定一个包含非负整数的 m x n 网格 grid ，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。

说明：每次只能向下或者向右移动一步。

 

示例 1：


输入：grid = [[1,3,1],[1,5,1],[4,2,1]]
输出：7
解释：因为路径 1→3→1→1→1 的总和最小。
示例 2：

输入：grid = [[1,2,3],[4,5,6]]
输出：12

*/




func minPathSum(_ grid: [[Int]]) -> Int {
    let row = grid.count
    let colum = grid[0].count
    var dp = Array(repeating: Array(repeating: 0, count: colum), count: row)
    for i in 0..<row {
        for j in 0..<colum {
            if i == 0 && j == 0 {
                dp[i][j] = grid[i][j]
            } else if i == 0 {
                dp[i][j] = dp[i][j - 1] + grid[i][j]
            } else if j == 0 {
                dp[i][j] = dp[i - 1][j] + grid[i][j]
            } else {
                dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + grid[i][j]
            }
        }
    }
    return dp[row - 1][colum - 1]
}


