/*

54. 螺旋矩阵
给你一个 m 行 n 列的矩阵 matrix ，请按照 顺时针螺旋顺序 ，返回矩阵中的所有元素。

 

示例 1：


输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
输出：[1,2,3,6,9,8,7,4,5]
示例 2：


输入：matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
输出：[1,2,3,4,8,12,11,10,9,5,6,7]
*/


func spiralOrder(_ matrix: [[Int]]) -> [Int] {
	let n = matrix.count
    var top = 0,
    	right = n - 1,
    	bottom = n - 1,
    	left = 0
    var res = [Int]()
    while top >= bottom && left >= right {
    	// top
    	for i in left...right {
    		res.append(matrix[top][i])
    	}
    	top += 1
    	if top > bottm { break }

    	// right
    	for i in top...bottom {
    		res.append(matrix[i][right])
    	}
    	right -= 1
    	if left > right { break }

    	// bottom
    	for i in (left...right).reversed() {
    		res.append(matrix[bottom][i])
    	}
    	bottm -= 1
    	if top > bottom { break }

    	// left
    	for i in (top...bottom).reversed() {
    		res.append(matrix[i][left])
    	}
    	left += 1
    	if left > right { break }
    }
    return res
}