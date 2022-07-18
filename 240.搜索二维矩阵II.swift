/*
240. 搜索二维矩阵 II
编写一个高效的算法来搜索 m x n 矩阵 matrix 中的一个目标值 target 。该矩阵具有以下特性：

每行的元素从左到右升序排列。
每列的元素从上到下升序排列。
 

示例 1：


输入：matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 5
输出：true
示例 2：


输入：matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 20
输出：false
 

提示：

m == matrix.length
n == matrix[i].length
1 <= n, m <= 300
-109 <= matrix[i][j] <= 109
每行的所有元素从左到右升序排列
每列的所有元素从上到下升序排列
-109 <= target <= 109

*/



/*

思路:
	1.以 matrix[0, c],matrix[r, 0] 为分割线，上边的都比这条线的数小，下边的都比这条线大，做搜索
	2.每行二分找
	3.暴力遍历
	
*/

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    let row = matrix.count, colum = matrix[0].count
    if target < matrix[0][0] || target > matrix[row - 1][colum - 1] { return false }

    var r = 0, c = colum - 1
    while r < row, c >= 0 {
        if matrix[r][c] == target { return true }
        else if matrix[r][c] > target {
            c -= 1
        } else if matrix[r][c] < target {
            r += 1
        }
    }
    return false
}



