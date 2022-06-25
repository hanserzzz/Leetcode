/*
62. 不同路径
一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为 “Start” ）。

机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为 “Finish” ）。

问总共有多少条不同的路径？

 

示例 1：


输入：m = 3, n = 7
输出：28
示例 2：

输入：m = 3, n = 2
输出：3
解释：
从左上角开始，总共有 3 条路径可以到达右下角。
1. 向右 -> 向下 -> 向下
2. 向下 -> 向下 -> 向右
3. 向下 -> 向右 -> 向下
示例 3：

输入：m = 7, n = 3
输出：28
示例 4：

输入：m = 3, n = 3
输出：6

*/
ß

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var result = Array(repeating: Array(repeating: 0, count: n), count: m)
    for i in 0..<m {
        for j in 0..<n {
            if i == 0 && j == 0 {
                result[i][j] = 1
            } else if i == 0 {
                result[i][j] = result[i][j - 1]
            } else if j == 0 {
                result[i][j] = result[i - 1][j]
            } else {
                result[i][j] = result[i - 1][j] + result[i][j - 1]
            }
        }
    }
    return result[m - 1][n - 1]
}




