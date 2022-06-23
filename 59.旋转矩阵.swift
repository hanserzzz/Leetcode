/*

59. 螺旋矩阵 II
给你一个正整数 n ，生成一个包含 1 到 n2 所有元素，且元素按顺时针顺序螺旋排列的 n x n 正方形矩阵 matrix 。

 

示例 1：


输入：n = 3
输出：[[1,2,3],[8,9,4],[7,6,5]]
示例 2：

输入：n = 1
输出：[[1]]
*/


func generateMatrix(_ n: Int) -> [[Int]] {
    var top = 0,
        left = 0,
        right = n - 1,
        bottom = n - 1
    var index = 1
    var result = Array(repeating: Array(repeating: 0, count: n), count: n)
    while index <= n * n {
        // top
        for i in left...right {
            result[top][i] = index
            index += 1
        }
        top += 1
        if index > n * n { break }
        
        // right
        for i in top...bottom {
            result[i][right] = index
            index += 1
        }
        right -= 1
        if index > n * n { break }
        
        // bottom
        for i in (left...right).reversed() {
            result[bottom][i] = index
            index += 1
        }
        bottom -= 1
        if index > n * n { break }

        // left
        for i in (top...bottom).reversed() {
            result[i][left] = index
            index += 1
        }
        left += 1
        if index > n * n { break }
    }
    return result
}


print(generateMatrix(3))


